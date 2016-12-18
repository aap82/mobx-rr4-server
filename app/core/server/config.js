import 'source-map-support/register';
import {server} from 'universal-webpack';

import settings from '../../../webpack/universal-webpack-settings';
import configuration from '../../../webpack/modules/base';

server(configuration, settings)