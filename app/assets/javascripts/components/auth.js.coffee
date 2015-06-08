@SignInForm = React.createClass(
  _handleInputChange: (ev) ->
    nextState = _.cloneDeep(@state)
    nextState[ev.target.name] = ev.target.value
    @setState nextState
    return
  getInitialState: ->
    {
      email: ''
      password: ''
    }
  _handleSignInClick: (e) ->
    e.preventDefault()
    $.post '/users.json', { user: @state, authenticity_token: getMetaContent("csrf-token") }, (data) =>
      @props.handleNewRecord data
      @setState @getInitialState()
    , 'JSON'
  
  render: ->
    React.DOM.form
        className: 'form-inline'
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            type: 'email'
            className: 'form-control'
            placeholder: 'Email'
            name: 'email'
            value: @state.email
            onChange: @_handleInputChange
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            type: 'password'
            className: 'form-control'
            placeholder: 'Password'
            name: 'password'
            value: @state.email
            onChange: @_handleInputChange
        React.DOM.button
          type: 'submit'
          className: 'btn btn-primary'
          onClick: @_handleSignInClick
          'Create record'

)


      
