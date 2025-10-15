Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A282BBDC221
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Oct 2025 04:18:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CCBCC56618;
	Wed, 15 Oct 2025 02:18:29 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011008.outbound.protection.outlook.com [52.101.65.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A764C56613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 02:18:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dPM8EuT1D6IdJam/y5uFeN8PEeEh0Ct9TgDyci/XLqLSlOamtg+21B4RbQ2aPx+il6TBAzXRh3tl8c0aADXEBtjdbx2fli9Y7BqOnXUmLVg1GRZR+/03YmtlAogtJz/KSlyH0KI8pHlMgqG4lk1m7qrcTDaTWLM9beylOEZFnVFjmE6baTvbFp2sbkbHsa6CGTSQpDcA0MNTwaOlge0I9CwpkwBhAe0o/5GLuwMQuimGMR84sl64fmS7kFJUQXsXog2O7MAo5maD4jj0T/X+ilngyzhXmKVbUYbpzUmAjtO3GC8C+kJNq3DUf9csmutrlmNDR8qMMnkFDeTOYAHMpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l1/EtXtahmSutqi0loBKiv5vtiwYmvK/d6VozCeXPl0=;
 b=yVcziOiY7+Mv/W1HZAUWhcSoWH4Qtnc15LRYoXHraZqGkdQa8xP2zOyCFI+26Q2IlSIOkd1Af1gVWOf4oT9xJCP2VKxTm05bsR59UmOsPFV6BNiWqx2iRsbuUXdaqPEhgQardNLsHUIaHyNgqLXbYv5TeVexzlxjJ3f0yfAKpfNWLU9HCJsqXJMDOmQhz19UzA0tiKHiH3KURjyvtg5xmGRhY8K+rmkNpQKW6nFaVkWW7ZNOgj5ozCOA03diaQCXolfK9RhPcYlf8niYfjVTGgy74zkaP2r4kgOdJZ8Y1UfV0HGvm75+8ANeV11AEZJrxGIY7Y3IISDWArDeuiljPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1/EtXtahmSutqi0loBKiv5vtiwYmvK/d6VozCeXPl0=;
 b=sq2yVQB/H7UZdOSBSOFa8tao7RGS685dFAV2FsBIeXlSEfxX4xKeTP0H8+rde+XXVA0DK+EQw4kVHltVse/ycxl9X6Cg4NI6D6f50cef3/lz5ZKD/lDSkJGt6PbcjWdpzU/LXzYfzGUQRuyUFwKN6sE+aovnIgLoH7fSwTJ7sv8xoTPhklihk/6ieXwTqDBjYd5O4Li3+1jbmOxuZdoYUyfosF21lyD8YMJphyFRx6vh6tK0rtns5HUn6EjD0fwc7C2Nb7N3lvWh2xRjSGdBwu35tespg/yQaG+l6CQqQISzjC4fBu556SlvaxM5xEeaVWlocZDrqcGmi4/dT9mwwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU0PR04MB9444.eurprd04.prod.outlook.com (2603:10a6:10:35c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Wed, 15 Oct
 2025 02:18:26 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 02:18:26 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 15 Oct 2025 11:30:28 +0800
Message-Id: <20251015-imx-rproc-v2-3-26c6b3d16c35@nxp.com>
References: <20251015-imx-rproc-v2-0-26c6b3d16c35@nxp.com>
In-Reply-To: <20251015-imx-rproc-v2-0-26c6b3d16c35@nxp.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Fabio Estevam <festevam@gmail.com>, Stefano Babic <sbabic@nabladev.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0033.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::21) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU0PR04MB9444:EE_
X-MS-Office365-Filtering-Correlation-Id: e2462467-7ac4-4610-b713-08de0b911fc1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|52116014|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VlYvTGM4QWQvZXpjaEIwdjJtcGFaS2kwNjNYYksvdWVBbzB4VXpJOG5JOGhq?=
 =?utf-8?B?d2hEbkJRZ1hrQkxONjR3QXlaQ1RwSXhKdm9FOUYvY040R3VQZ3NvUFh3ZlRj?=
 =?utf-8?B?RUZ5WWQxWWoveVVJbXhUR2tSS0hrUkJOanhYYVhTZ1JhQXdiUFlGTDdNUlVv?=
 =?utf-8?B?ZmZpb1lTY0dJdlh5TkRERlc5L3laK0hlSWNSNEQvZUJKY3hFS3l1dWdva3VV?=
 =?utf-8?B?c0VWNVNsWTc3UXYrZ3NKMWtha3paQjVGWDNZcnBqbHVhYkdhKzBDYlJEYlox?=
 =?utf-8?B?NzVnQmVoOFlodS9hY3JHZ2I3aFdBU3RQc21PZk5RYlZ3c2hyY29xakVSOHB3?=
 =?utf-8?B?MEx0ZXVvemgvQlNvVFU2WjREeHB4Mjd0VVBTUWtZNHgwQkhvQUd3dlo3WTlq?=
 =?utf-8?B?SUlQLy8xUGYzSEdWM1ZXaXF0cVVxcWZLZ2RQUVpTMkQwZEtqeVJLR0h4bk5T?=
 =?utf-8?B?NGtUNWRHd0o1L3JNYmwyK1pRNStDTGthTkprbCtHQTdmSCtOcElLdWkybUxS?=
 =?utf-8?B?NWlVOUxtUHltUXl5cUNhNnZCQXBPSnRHd3FVd2MvN0dtZlhhZFB4UDhxVXgv?=
 =?utf-8?B?YS9nOEJVVmthMHlQWk5Ba1h1NUwrUS81NExmdElSellSK1R4SXFpU05FUVRC?=
 =?utf-8?B?Sm9qOUV4TmVuTU9MU0txQzhaZmJLa0pDanpZYmI1ZVdHeHdhRGZoYXZHcVhq?=
 =?utf-8?B?Y2hVM3ozZldwOXJKNUFSZUdaL21Ub3E3OFoyTEVCMjVuT045cE56bCtDZUhD?=
 =?utf-8?B?K3IrTVpjTitaNzVvY1k5ZDBYVm9tWFBobi8zU2VIOGNXek1wajYyVEkzVmJ4?=
 =?utf-8?B?b015TGgrYzB4dmVTWlJuaXZwTzhaZ05JbjUzZ01lV1daZzlScHkzSmJ6V2h3?=
 =?utf-8?B?TWNtM1htc2kwcU94dUJ4UmxpZzl6a21uMk1nVzgrRFdiTUZkNkQrNnZXZ1BG?=
 =?utf-8?B?eTFRcUhZMFNHQk0wOWEvNlhhUXZXd0lHTkFyM0tWM0pBRE5Ybi9Eckd0SHZY?=
 =?utf-8?B?aFVtQTFTSWxKdElYN3dzRllEbXNNZExZZkNwbVR4bzBJRnFaVDFOWVQ4SXgy?=
 =?utf-8?B?OGpsZVdQRXp1TytDdEo3cWZKUmhPOW56eDZSU3FiWmxOOGRLelBwZkplNWJz?=
 =?utf-8?B?T21ieEp3aGM1cFpDaHF2TmRqUkkyY0ExdzdVK1F3VlBzVXVQY0J2YldRMmRj?=
 =?utf-8?B?Q3FBRkU5VDhBb3NodExVaEJmV1Z5czltL1Vma2gxamR0alZvYXlSdXEyOXVx?=
 =?utf-8?B?R0JoYkNaLzd2dTBLS3F1cjN5VE9GdGNEcnE4ajhSaTl5ZGRkL3RaV0hNdWVp?=
 =?utf-8?B?L2tqMWlXa1JBcktKbitFVnIzaTRzZCtTR1ViY3hGNmlEQUVDWEJ1VHF0YTFm?=
 =?utf-8?B?TFhMN1J3RGJFK2pOd0xLTGlXazhaeXdLbHlmMkNrVDJRMTZEOFZ6eVduWjRO?=
 =?utf-8?B?ME9XN0ZBM2huTkROT1FxVlI5VGJvV0RRZ2luVG83Rmc2UXh0Unpza3dqZHhw?=
 =?utf-8?B?bkVmS3JxUFpTc2pqNWlaZDVlL3dEUFRmZGUwaDhDMjlIWk1nSTJ1TUt1elRn?=
 =?utf-8?B?SWFaYjQ5N2tRcjh5eUNudlVxcjhlT3JSK3RYc1d3NlpLS2pUNm9hNkF2eHpm?=
 =?utf-8?B?ZVJkTnhrSkIvcER3aS9pRSt4aU5GaWtlWlQra0hoZ0J2UHJqOUcxN0tFVUhH?=
 =?utf-8?B?dzREUW9VYm9od3h3NXpKemtxUS8yNFc1d0hsUnppM0o5U2czKzhnc2I1U3JT?=
 =?utf-8?B?TVI0WEc5dk1Tdnovc1VCelgvaGJybXpoM0lQcjhBMFh1NTdPblRBTnBnempO?=
 =?utf-8?B?d2lKUzB2R25yVExBdnZWUjEwQ2p2V0sxNHppa0V0ZjkrVjVoMUhvRUJ6ajl3?=
 =?utf-8?B?RzE1RkxpZG8wYUtRZ0o4bjk1cGFVcnlwSEM4M0ZwLzBLY0krNnpTa0xtalI1?=
 =?utf-8?B?VEdYbTBhYUNURUhFeEFLc1pQTVliMFU3ZlpZM3F6bmV3Q1RkS2VVcm14ZGlz?=
 =?utf-8?B?d202Q04zclBwb21DQktDWUFwMTI3YUQyaUd0UEtEK3hucnpXdXUyM2tzZ2tT?=
 =?utf-8?Q?PCH2S4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(19092799006)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHNYbkZqVzhJM01UVHc4dFBReUtsMlBHNGUxOVVvVGRVNGNJUTE5OU5zTFA5?=
 =?utf-8?B?VFh0bUtiQXhmYjg2M3E0a0FRRVpSeDR3WDJYY1RWS0hWcitsaGxhWWlEeWZL?=
 =?utf-8?B?U0lqZStoQ2dHKzBqaG1LWDlPRVplenMrSUlEZlV5QWk4TVBzbWp3N2pzWmVR?=
 =?utf-8?B?RUlnYVFncEZvUTJYNWZCMFE3RmJGQmJoYTBoaEJ6Ukd4VmE5UFlxSGE2VEN4?=
 =?utf-8?B?TkFsY2hHSDlRc3FOVGU2THlJUkdCZEs2RHZhMmg0TEZHOCtyL0NLUjd3YXJ0?=
 =?utf-8?B?bHpyNzM1c0g1YTNWWlZBT3ZxZXJWYzZ4Z3dUMGs2dWdsTkI0QTd2OHVUSXpB?=
 =?utf-8?B?SXkxVWxSbTI1Z2tvT05sUG5LWGIwVmoxYkNOdy9OVll2dGtDeXJETU1tQ2Zy?=
 =?utf-8?B?b3JjbTNSUGhNaDEzNnc2RHFBQ0lYK2RpMWJod3FWSjJnSGNpcTVPbXdOcm5H?=
 =?utf-8?B?WnNHclFUdk8ya20zWGhySFRjSmxzUzVZbFRSOVNCaEVSTmFTRVNWWC9JZnhi?=
 =?utf-8?B?R2RzaW5WTGtBT1NOS0tZcXV4dS9oRm9lekE0UjB1V0Vpc1ZmaWVJMUtuUXNQ?=
 =?utf-8?B?Y3E4WUEzcmVjZUVaU2lwN05ONDVJcG8wdWpkQytNM29LK1hoYTZpVll3Vnpv?=
 =?utf-8?B?d1lEbTZCVjhEZndMU3ltRXU0aUtnUTUrTys0OVExdTdMK0RmL1ZDanBXWkhx?=
 =?utf-8?B?ZXdKV3l4ZFBscEp4ay9iSUFCTU1jdHlCUHc2bS9KTXYzbnBZdmlSWDdYQ2p1?=
 =?utf-8?B?OGRTeDNoZXFXaGxhcVJMZHltanhUb3Z3THl6M1N4TkxGajgzSmNzKy90VU5X?=
 =?utf-8?B?bWtiSk5mVzZsdnlpWjdPSVFRcWJwT2xqaWZOaVFzYTZBeXlOVjA4WFMwVU9W?=
 =?utf-8?B?Skw0RzNhUHd0a0NiRVdwVndIcjRKMWE3eDFUNW9NYzRhekFXeGZ5a3BDVTd4?=
 =?utf-8?B?YXcwb1RtWEcrRDR0OHgrdzk3cUdkUUlaQzNBazZwVlRldW41Y09RbHB3N3JP?=
 =?utf-8?B?dGo2WWRuUHZ4aTREd1VqODB1blE0bEF0Y2hNczRmV0FJYlJocFJoQlBoVEhk?=
 =?utf-8?B?L1pxOVdpN3NCNHZaL3YvVkdHUVhwT2pZcEpZc3B5QitOMjFveE5xKzhGV1U3?=
 =?utf-8?B?d1NxdEtjcjNsVDIrTlc2WEprelFpUkdTYU5vSllHL2FZb09ldXpWVWQzUHF1?=
 =?utf-8?B?SzlqTWRjMXI1SW4rS1Y2M1hlT0J5NkJYR1ZSVWNVSk83Z0tqN213OTlwajBW?=
 =?utf-8?B?dG1nM0w3ZDVNMTBRZmxaV1ZXUkgwQXUyQUlUUEtXTUlHa3BYSHA2Zyt6ZTR0?=
 =?utf-8?B?aTkrOVJsOStEY0MxQW9IVndXbmhROGJQN1d6SjU5SGVtRFkyR0NTdFFjQldn?=
 =?utf-8?B?eXFzUVYwc2xzRGYwUjBNZ2pLWFVoZEpCbXBqR25EcFdwWU4yTHFCaHdQMFpw?=
 =?utf-8?B?OXFvbENmUE1xZVdxWnhNcEgycjhJUk1YUCtCWXRDcWxUd0NsVmVwK0l4b0Z5?=
 =?utf-8?B?U1JNcGw5Yk02VERVSGsvL3YrN1dOUDRHTXNQcmZLR1pueU1HRjlIdHFVUldE?=
 =?utf-8?B?RlNMK1VQV2IwMVdKczU2Vk5RbTFtMzVnWUdFZUU4ZDVDOXhRakl6TFRzT1Zr?=
 =?utf-8?B?Z0l4dmdzSUtMZGdMSXRaakVzM2k3NXZMZ2FIZ2tOaUhTMGpRVGJ0M2g2OFQv?=
 =?utf-8?B?UXltVFVlNWVLZHY1dVFHRitjT0ZIdC9LbFZTZFE5bjY1bTlFSEE5VWhFMGRB?=
 =?utf-8?B?bURIV3lYeTJrbnBrTVNaYzlZTlNNS2NnVTY4RlJqRlFFSUdlMHR4bDNrQjVq?=
 =?utf-8?B?VW5QZVVaQlowYnBNcnlrTU45eXVyN0x1S0gyUUNuYnQxVjlWMFVUSE9MUmdF?=
 =?utf-8?B?Z083Uk9yd1BMblk3dUZ0YWx4dGdWSTU5bFdUMnFVUGRxMk9FNGVnZlczQlVr?=
 =?utf-8?B?a3pYbzNhelo1cXEzdWVNQTgvMk8vUjU4emFNY3JjN2JieE9kbk90dTIwSENX?=
 =?utf-8?B?SXhKTjU3eWpmVzJlemhtM0J6cVRyODAyZXpya1NnbWdCc3FHQkswRndUOEEw?=
 =?utf-8?B?OU9qK3paRXUzZUo3NkZrMDF4U2I4RnU5RFEzUlhLWnZaZjBtQWdyUUpUc2tt?=
 =?utf-8?Q?GDWu+lEYLNEQBJIMV0t7Rntoz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2462467-7ac4-4610-b713-08de0b911fc1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 02:18:26.5707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q4kT4fkTbDQhaM4KWAdj70JQWt1ROrILPP4QTawHx7QQy8D843wmp9xIAbwo4ULTMMcUTwFO4wusCB97Ke4AHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9444
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Udit Kumar <u-kumar1@ti.com>, Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Andrew Davis <afd@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
 Judith Mendez <jm@ti.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ryan Eatmon <reatmon@ti.com>, Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH v2 03/10] remoteproc: imx_rproc: Support
	i.MX8MQ/M
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

From: Peng Fan <peng.fan@nxp.com>

i.MX8MQ/M use MMIO based method to directly configure SRC registers
to start/stop M4.

Add mmio ops to start/stop/is_running.
Add i.MX8MQ cfg data, i.MX8MN reuses i.MX8MQ data.

Reviewed-by: Ye Li <ye.li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 107 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 1b2ef5005e3a2f2cc1254e953b0bcb7a58063f5a..c71e409a00a55179b06434dfa190e8eb8ba559f1 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -9,10 +9,27 @@
 #include <dm/device_compat.h>
 #include <linux/arm-smccc.h>
 #include <linux/types.h>
+#include <regmap.h>
 #include <remoteproc.h>
+#include <syscon.h>
 
 #include "imx_rproc.h"
 
+#define IMX7D_SRC_SCR			0x0C
+#define IMX7D_ENABLE_M4			BIT(3)
+#define IMX7D_SW_M4P_RST		BIT(2)
+#define IMX7D_SW_M4C_RST		BIT(1)
+#define IMX7D_SW_M4C_NON_SCLR_RST	BIT(0)
+
+#define IMX7D_M4_RST_MASK		(IMX7D_ENABLE_M4 | IMX7D_SW_M4P_RST \
+					 | IMX7D_SW_M4C_RST \
+					 | IMX7D_SW_M4C_NON_SCLR_RST)
+
+#define IMX7D_M4_START			(IMX7D_ENABLE_M4 | IMX7D_SW_M4P_RST \
+					 | IMX7D_SW_M4C_RST)
+#define IMX7D_M4_STOP			(IMX7D_ENABLE_M4 | IMX7D_SW_M4C_RST | \
+					 IMX7D_SW_M4C_NON_SCLR_RST)
+
 #define IMX_RPROC_MEM_MAX		32
 
 #define IMX_SIP_RPROC			0xC2000005
@@ -22,6 +39,7 @@
 
 struct imx_rproc {
 	const struct imx_rproc_dcfg	*dcfg;
+	struct regmap *regmap;
 };
 
 /* att flags: lower 16 bits specifying core, higher 16 bits for flags  */
@@ -38,6 +56,14 @@ static int imx_rproc_arm_smc_start(struct udevice *dev)
 	return res.a0;
 }
 
+static int imx_rproc_mmio_start(struct udevice *dev)
+{
+	struct imx_rproc *priv = dev_get_priv(dev);
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+
+	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_start);
+}
+
 static int imx_rproc_start(struct udevice *dev)
 {
 	struct imx_rproc *priv = dev_get_priv(dev);
@@ -65,6 +91,14 @@ static int imx_rproc_arm_smc_stop(struct udevice *dev)
 	return res.a0;
 }
 
+static int imx_rproc_mmio_stop(struct udevice *dev)
+{
+	struct imx_rproc *priv = dev_get_priv(dev);
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+
+	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_stop);
+}
+
 static int imx_rproc_stop(struct udevice *dev)
 {
 	struct imx_rproc *priv = dev_get_priv(dev);
@@ -92,6 +126,25 @@ static int imx_rproc_arm_smc_is_running(struct udevice *dev)
 	return 1;
 }
 
+static int imx_rproc_mmio_is_running(struct udevice *dev)
+{
+	struct imx_rproc *priv = dev_get_priv(dev);
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	int ret;
+	u32 val;
+
+	ret = regmap_read(priv->regmap, dcfg->src_reg, &val);
+	if (ret) {
+		dev_err(dev, "Failed to read src\n");
+		return ret;
+	}
+
+	if ((val & dcfg->src_mask) != dcfg->src_stop)
+		return 0;
+
+	return 1;
+}
+
 static int imx_rproc_is_running(struct udevice *dev)
 {
 	struct imx_rproc *priv = dev_get_priv(dev);
@@ -171,6 +224,15 @@ static int imx_rproc_probe(struct udevice *dev)
 
 	priv->dcfg = dcfg;
 
+	if (dcfg->method != IMX_RPROC_MMIO)
+		return 0;
+
+	priv->regmap = syscon_regmap_lookup_by_phandle(dev, "syscon");
+	if (IS_ERR(priv->regmap)) {
+		dev_err(dev, "No syscon: %ld\n", PTR_ERR(priv->regmap));
+		return PTR_ERR(priv->regmap);
+	}
+
 	return 0;
 }
 
@@ -217,9 +279,54 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
 	.ops		= &imx_rproc_ops_arm_smc,
 };
 
+static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
+	/* dev addr , sys addr  , size	    , flags */
+	/* TCML - alias */
+	{ 0x00000000, 0x007e0000, 0x00020000, ATT_IOMEM},
+	/* OCRAM_S */
+	{ 0x00180000, 0x00180000, 0x00008000, 0 },
+	/* OCRAM */
+	{ 0x00900000, 0x00900000, 0x00020000, 0 },
+	/* OCRAM */
+	{ 0x00920000, 0x00920000, 0x00020000, 0 },
+	/* QSPI Code - alias */
+	{ 0x08000000, 0x08000000, 0x08000000, 0 },
+	/* DDR (Code) - alias */
+	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
+	/* TCML/U */
+	{ 0x1FFE0000, 0x007E0000, 0x00040000, ATT_OWN  | ATT_IOMEM},
+	/* OCRAM_S */
+	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
+	/* OCRAM */
+	{ 0x20200000, 0x00900000, 0x00020000, ATT_OWN },
+	/* OCRAM */
+	{ 0x20220000, 0x00920000, 0x00020000, ATT_OWN },
+	/* DDR (Data) */
+	{ 0x40000000, 0x40000000, 0x80000000, 0 },
+};
+
+static const struct imx_rproc_plat_ops imx_rproc_ops_mmio = {
+	.start		= imx_rproc_mmio_start,
+	.stop		= imx_rproc_mmio_stop,
+	.is_running	= imx_rproc_mmio_is_running,
+};
+
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
+	.src_reg	= IMX7D_SRC_SCR,
+	.src_mask	= IMX7D_M4_RST_MASK,
+	.src_start	= IMX7D_M4_START,
+	.src_stop	= IMX7D_M4_STOP,
+	.att		= imx_rproc_att_imx8mq,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mq),
+	.method		= IMX_RPROC_MMIO,
+	.ops		= &imx_rproc_ops_mmio,
+};
+
 static const struct udevice_id imx_rproc_ids[] = {
+	{ .compatible = "fsl,imx8mm-cm4", .data = (ulong)&imx_rproc_cfg_imx8mq },
 	{ .compatible = "fsl,imx8mn-cm7", .data = (ulong)&imx_rproc_cfg_imx8mn, },
 	{ .compatible = "fsl,imx8mp-cm7", .data = (ulong)&imx_rproc_cfg_imx8mn, },
+	{ .compatible = "fsl,imx8mq-cm4", .data = (ulong)&imx_rproc_cfg_imx8mq },
 	{}
 };
 

-- 
2.35.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
