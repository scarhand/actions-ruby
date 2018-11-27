FROM ruby:2.5

LABEL version="1.0.0"
LABEL repository="http://github.com/scarhand/actions-ruby"
LABEL homepage="http://github.com/scarhand/actions-ruby"
LABEL maintainer="Niels van der Zanden <niels@pharynx.nl>"

LABEL com.github.actions.name="GitHub Action for rubygems"
LABEL com.github.actions.description="Wraps the gem CLI to enable common gem commands."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="red"
COPY LICENSE README.md /

COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]