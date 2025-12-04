Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFECCA4831
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 17:33:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A588C628D0;
	Thu,  4 Dec 2025 16:33:04 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013027.outbound.protection.outlook.com [52.101.72.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09EC5C349C4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 16:33:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rEZkDuJcalCAF8XfSxIh0n0d3Sff3YGu4Khsxtqw5ETG0MrWKGAvbL1tYs/juQEaq1ScksnDYEYhytq254ggHibIBc39NqX9kxlAdzJ5ADCueSxR8hMRHYjg/FngB3qUizXepGP+49DFDiGyAhVNEixyPVmIl28KUD2RyAti4kJ76XvDJYvBesISxaGRfbj5lTujVZW/067Jiw8FoqcWRWBaTjwhn20F9d02HTeNbpVBikxp1wWAvfJwcaYu+y4tlBEKUnFBEKhiHrCG0cvE/5GQz/fA1nb4KQSL/74FoDbQYFNQdF1pGAHvGPX7MpY1Hdd7CnvSAhvH8plWZt3qog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=knZvREVWGiWXZkzsK3hSbaAq7VN0+QL6Lw20gkXPb8E=;
 b=syj6ErmZBZdhl8EwsnOrfOorB1EtqsEolf8O3D06tfR2EXmn2B3FXOAaK/q8JkILLUWE7BoAjMOb4J2SHmOzO7GMHfR8eNdcWzIczXouMFWMZDbZvkBGctXBJKebisuivXDA43hiEJmJJ5tzph+DFZQ4FRAwer5tOqyK/WCXUq84UgOHOhQQOP5Z5qvvFPd5LmcqSfDJ9/inZIGU2hjAL6uVPYn8LZHj5Bx5cqI2DtzBOdeWGC0WUDxAVsjWBH1J2bSaA4VmxkP4oMAbA5i1oHtyTj9v6uQ+eTrC6ivgpOBtndbkF362+ObzAH3xTh8I6a5LrGhgznwvRySH4GqRIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=knZvREVWGiWXZkzsK3hSbaAq7VN0+QL6Lw20gkXPb8E=;
 b=Xs5pWEEJtFw9a1xS72K5SYzpD5z/t+x/y/cRB+uiKb78Nn6Zm6uz6mAot1PoU+lFaUYk5pU5q1lh5A8Y1nV/oAxuspx20/uU6CGP3eWV23sP8WyOK35Ii1ThLSL1P+qLsVSVVOzu1y9oZRzrvSmGiq2dLBVXCMzby9fX01cJHbs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 16:32:22 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 16:32:22 +0000
Message-ID: <6ca6b0de-57dc-4bb4-81b9-0a208856d3fb@cherry.de>
Date: Thu, 4 Dec 2025 17:31:27 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-21-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-21-patrice.chotard@foss.st.com>
X-ClientProxiedBy: WA0P291CA0021.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::25) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA4PR04MB9367:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f40ab12-8b54-4d47-d012-08de3352b399
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q29teXBGamg3QWd1RnVKVEwzR2pzLytNZlFKM08vaXl3QlkxdmN2R0N0OVFr?=
 =?utf-8?B?eSszcTlacXJxNTh5WUFSU2JmdlZ5aXp5TWIwSHUzVDR2ZFpEeXBIOVBRSGth?=
 =?utf-8?B?VXI2RGI5dlgreHFJNWdiYVFNSGpONkRxN0lSSmprVzhjMUxqa3dpa3NER0dI?=
 =?utf-8?B?RHd6NmtuTmFPbWlxVkF4dXNJSTZVQlBxQTdZVEhHMVZPWGRzVVkyUGUxWWFk?=
 =?utf-8?B?UHpBb2VXSk9hWWoxSzBxa2N4K1pFeUFhVm94UGdVbEVSUnNPSlhiMGlqZTNq?=
 =?utf-8?B?T1gxK3BHcjR0bi9sRUxyb0tGeThHVnBBajdGYzlZSkZWQURXajBHcUpEVXdE?=
 =?utf-8?B?Tk1ER0tZTHZoVGE4VjNkNFR1UjhTQUwwaWRrRzlmeFN2Z1NtRjFoZ3pjbkZh?=
 =?utf-8?B?LzczVjd6TG5CWlMvWGV5SEF5d0NEVU5zTmFkb3MrbytRV1p3SThWT2lGSStO?=
 =?utf-8?B?b29YblVjaHUvV1gvRlhlbjdkQkhrdWsvR0ZFamwvNWVRT2E4SUVSUU8wNXZ4?=
 =?utf-8?B?WHp3eVhCaUdJa1BYR0s3NWgrVGJyOGgvdFZMRXNleWhjT0tNQmcxWGJ5Rm02?=
 =?utf-8?B?TEtBSXFCYWYvSlFQN1FuYUhTMVp4dzhZSXd3eEJZOFQ3QUN1OWpvQ0RuT3lW?=
 =?utf-8?B?NXZ5ME5FaWFOdGNyQkFrV3NHL1JhYkZiMTIrR3NsNDM2VkJKV0ttc3NJdytW?=
 =?utf-8?B?ZmdmbkJXVm1PbEdEMkJHMmNMOThXUVh2VjE0anNKRy9XVDhBWjYzZng3cUM2?=
 =?utf-8?B?RG50RlRRMVM5OEMwV3FDMWlWZktMZFJhNmV2ZnY0dFVvK1JHZWxwdW1JN2M0?=
 =?utf-8?B?U3owTWhjcktXdW1DL21HNkh1S3o3dnRORjEzZ2JjNlBENnRoUUY2NWxwd3R4?=
 =?utf-8?B?dHBzd2dJWFZNTFFRZGYrQXdLeWY3RzlDTmQxSENnRTJ3cUZjeEtwWDRFNW5V?=
 =?utf-8?B?eVhka01ZTEV6UEdyV1o5OWUrcHBzZWlFZFRTS3I0S1JqbEcxbGZrYnNibk4x?=
 =?utf-8?B?UFJtc0NRK2xNYXU5MEY2eFkzRm9uanhlWTFHVWdQYzhwTWw4NXdLQXM1NnNR?=
 =?utf-8?B?UXpReElUazJoblMvNWtJUWhLN3lJd1Q5dzYyNElPN2pZeis5Z2xRZG5mTE9I?=
 =?utf-8?B?ZVd4T0JuazVuK1FTV1hjWlNSeHNjV0dxWHFyeHhDamRmRXB4dklsQkhaME44?=
 =?utf-8?B?NlFSTkU3cWk2cHVRbElERjZtSHcwTGJJSUxQd2FHUGZSOTdTdGgwQWFqd0RZ?=
 =?utf-8?B?V1Q4dFh0U1ZWVGpRYTk1NTdRWS9JY2JYajNkbUZ6ZFJxcE1vNysySUpab1BK?=
 =?utf-8?B?N0tsRHRYeGdkQjk1OHpTbVFBZEptQXFBeTl2VDVaa2tLUVU0UUtUMjdrRUVS?=
 =?utf-8?B?cE9BWFRvWWVHZkpsa1RwTk00UExjamdIODRkN3VXYjVBTE5kTlhMT1ZQc0NH?=
 =?utf-8?B?cEZ1b0xWdUJnUEFubEpxSmo5VXhUWkMrRERDY0VFcWg4SWh3WXlIZDhtNzdh?=
 =?utf-8?B?R24xVTB3ZjE2Y3BoZklSbDc5bEs2Q0d2RVBDSU96ZEZ6bHBFdUlrWTBjVXda?=
 =?utf-8?B?WFNnVEZMMlJNWFdaU3JNSnFHOVBqUUdTdy84UkJGQXNXczNtQVJ4YVN6QmdI?=
 =?utf-8?B?Wk9hRk5abWtRemxqdVAxKytOcld3bno4Y3ljRVFvbHMreUxSSWVRS1BId3Zs?=
 =?utf-8?B?UEF0bTIvVktUTmhoUXU2Vm5PZjM1Z0I4cHlNbnliQ0FtRHNkTkRnVmxrTDdS?=
 =?utf-8?B?SU0wemRvaCsrQnZPakh1VmduZ1VudDBCNTRkdGZUZFRYUlVySDBLUUZPSG5Q?=
 =?utf-8?B?SXdTeTQ1M1Q0WS9tUE0vRzdMYjA1Z2IvQmNRMVZhUytCYk1TZkk4Q002L3hn?=
 =?utf-8?B?U3p5OWUycmQ3OVFXemp6bWJNcjJVdEpsdnhQK0FvVXl5czRaNHIxdUNSNDJS?=
 =?utf-8?Q?lqD5UjpN+48A20jiBS6XlYeNjooBNT1M?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGxLRDZnanRSaHgzc3NlOTZEOTk2UTI1K2NLdzMzZWx1aVlCczIwWmQxZFpY?=
 =?utf-8?B?RitGaE9CYnJDbkNaQkNrVG9mRytRaDBiaDlyZEhGYS8vNjJpNDNBUGQzWWx2?=
 =?utf-8?B?dk9yOXlIMzRJOUZvTEpPR2JkWjhXdXR1N3dhbGlaUnVmcXZ2QmVDM0dmRkF6?=
 =?utf-8?B?MXFjQ0xISnBFNzVraXVNNVNCY0h1ekVMTzFjVWxnbHJoY3d0Z005NlNGQ002?=
 =?utf-8?B?am9wa25EcVZudExsRHVqa1llYkU2M3pjNDcwVmd0MDIzeFRvV1NvOWFqZFpV?=
 =?utf-8?B?Q0VnTnc4LzAwRDFCbUVjRUpra0phTzlRaXQwVHlSL0tPT1NxU1I3WVgvYmpT?=
 =?utf-8?B?eXB6Z0JVNWUxaWJQTlJtbE5vMVQxUGJLWEtla1l0OTcwa2dldHNhSThmdTBk?=
 =?utf-8?B?aUNVQWRvZnh4Ujd4Mk1heE9RVVVDS01GdFR1VC9DdldTeDVXMU9FV0ZiNWtp?=
 =?utf-8?B?bnFrVW9scGdqbXhGS2tYRnh2dnNHV00xQy9kNlFkWHRZVmRTUmFXdnViYUFP?=
 =?utf-8?B?TzdOeDgzNkNQRURvTEVqQmJtVWU1T1BScjNZZUdSU2VGakFaYnhqUWVFT2o5?=
 =?utf-8?B?MjNnME40eHZoY2JoL1FwbW15N2hNcVcyb3Bza1JNbHhJd2l4M1Z6NGx3K2lF?=
 =?utf-8?B?RmhwY1R1SGRYdkFkZlVNbGpzeWszZVRFOW1XaitldmIyRDFMUlVzZWE4UG9N?=
 =?utf-8?B?UkRaVG1GRVp1dWVBc0xpL3dWMjZ6dEJ4WitHaHdZbWQ1Z3QrNzlFSlNRVm4x?=
 =?utf-8?B?K014c1hRSEJLaExKNzhuYU8vMUtvRUZwMjd5akJlQ3ZSQkZjRVdWYUxDZ28y?=
 =?utf-8?B?RzREQVBDUXZ3bjRlLzYwNEh0L0hyanIzR1h6dkF1UlZRTDdKZDlXcmQ3UXNK?=
 =?utf-8?B?OGlpNzh5SSs1WjdsZDRrZVNnZzJnMXpvUmRRK2tIYTc5M2FKM0RRZEFPRFVM?=
 =?utf-8?B?MFp4ckIwWXVob013dy9lR2I2U3pjSTZ1MXVSUkhTbmt0UExRS1NKV3BRVkln?=
 =?utf-8?B?aUo2UkttNGpaUlNQZUEzWHdITGJaTHhRV2Y4NlhXNENrU1VXVzkzOS9mWDJB?=
 =?utf-8?B?MTR6dzIrZ1hqTDRhc2pteXlrenRwYmdrYTBHa0l5VHNaRktIeDJYdTJLMEJS?=
 =?utf-8?B?M0NTZGFhbzJGVWYxSWRoVE5qU0crN0NXTDBvdW5QNnoxNXdjeit3cnQwdk9z?=
 =?utf-8?B?a0RTNHlrQXV3WTFLeFM4QVNzMFBlTCtUR3hOR2tRUVB2cllIcnFPV2tUSzNU?=
 =?utf-8?B?bDJ4NXp3NG9vWjBGTi83WldzdUpMOGxIcXpwdGVOeTVCNDFXZWtWWmNYdFVI?=
 =?utf-8?B?YndoOVl4YU1xbWY1Z09Ja1RCblhkcWg4dHBuQmhBY1JDS2pzNHNIMHRZOFVI?=
 =?utf-8?B?ck9kNUQ5NnJPb2EwTWJMdWVYUkRZemtBaWZMWU1zNkRSNGU1c25GK1hYY2Vm?=
 =?utf-8?B?cGtXNW5XdjhvRnpKMmxYa3pnT1hjZ1V4dFVPTzh3MTNETi9UcGtiRUxjek1L?=
 =?utf-8?B?WWNkNlJJOVQ5clZmMjRKRVd6OUViejYramVNL3BseHhhWGNKQ2VSM0tzMEZw?=
 =?utf-8?B?SUpIN1FvNWpFeXdHUXd4NWh2UWtoMS9nQWViRk9QbWxoRHFoWmxtNUZGNnJs?=
 =?utf-8?B?YnprRTNySjAzeTRTN1ZKT21jK2ZrSUVqQmMrei9NSnhyOW5nU3U0NkNNcEs1?=
 =?utf-8?B?Q0k1bndvTzE4WTNiclVPOEltUUs1c1ZuZ3BiTXpENzZxTWlGLzFpSko3TmZD?=
 =?utf-8?B?M0luUFlxLzl0cXcyUis3ZTg4eWx6WVgrMjVXSUFySDB0SEU3Zjd6dFJtTXl5?=
 =?utf-8?B?RXpzZTFlWTRqRytudUV4Uk01RFhQZGc2UEZHZW5lendiMlZ2TGhEWndOWDJR?=
 =?utf-8?B?dUdNb1QwT1ZQaGlVZ0ZqcXZZUnRJZU1Kc3JVNGVLNWlOeElmRU1KanZFcDRK?=
 =?utf-8?B?a2dpOWFzWlhkZHpTU2w3SnIyVVRaRmhOQjBCM1N0Ui9UM3RFK2FUUXJZdCtl?=
 =?utf-8?B?L1hFNmVHTjhEZjVpVXdlK1Fua3JiQVdqcjRXWXU5Y3hYV2l0VjVrZ3haN1cw?=
 =?utf-8?B?ZkZaWXZFZHp0WXZ5dkc0VjBFSkZES1dMR2o3cXhvR1BiR2pyalZPbVNQZlpK?=
 =?utf-8?B?QWY0d1l4K1g5L1FQUHV1VzdtUTFtQ3dkTkMvYnprVnRIQU1Rbzluakt0U1ZK?=
 =?utf-8?Q?lH51U5NlixKDxhvIXy4o5fY=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f40ab12-8b54-4d47-d012-08de3352b399
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 16:32:22.7910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IMRj878aA9S0LbSvfqxj6WSRyFoDooFzfb+R99IH0T5m9LXtzT7FVSE+J4VplE2xuE9a4Glw8jOQ4kbewk3/xxBBMU6hT31J8HY48HUcIdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9367
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Peng Fan <peng.fan@nxp.com>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 20/23] ARM: dts: stm32: Drop "u-boot-led"
 and "error-led" from stm32mp157c-ed1-scmi-u-boot
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Patrice,

On 11/14/25 5:23 PM, Patrice Chotard wrote:
> Remove obsolete properties "u-boot, u-boot-led" and "u-boot,error-led"
> from stm32mp157c-ed1-scmi-u-boot.dtsi.
> 
> Remove led-red and led-blue nodes which are available in kernel DT.
> See kernel series: https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=1022570
> 

You may want to wait for the DT to be sync'ed with Linux's for this 
patch so that the red LED can still be used with the led command?

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
