Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4061BD7E5B
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Oct 2025 09:30:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95491C56605;
	Tue, 14 Oct 2025 07:30:15 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013003.outbound.protection.outlook.com [40.107.159.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE995C36B31
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Oct 2025 01:37:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kYRPO0M9mEvqph3/a1Im+bKFkdctxuY556URM5S0V0ICu5Xf6KAF/j5sdvmotV/A9dx5X3825NnDtvk+U6VFE3xuaijA+d9KvUUuIVWkWnOezXXpGihun2kR0MNGFmhwsTmlIFbYxFzRbyvUcqwYk7ZNGfI/+3m2acaEB6BOsnmcEbjVEc9KuKqWhUNdqD7TAchEXRgH2l6SKQXS2o7fve5qz761upIc+ZeDukYIk9sILfcXthDm5rTWmqgY3hQRtDzAzFAiHKwV1IbvopeHusREYenRnTxjoklMTgUx1JsjWE39EZgl2BrscDrlED32nnuNH70glMgrS13jky0FDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IEJaL8rJXuRuaSMNZio/1rEWwmQ/2xxdBrh1zroz+uw=;
 b=mmxMc++BrTrxcb9Wdb3Bija5V0e9wPX44JHamWZgD6nBNO3uOh6fBScYc9CxpxVuVjgmOa3OivNmgSOeREgaiZFXwYnXhGhpeA4f2qdqxZ0xhlEMhoqsf/g0ZOootzGFUj+o8ORLe3L2N8J34Xg0UZR/XfJhuJmJ4FUbCEK9X1vWNztkH/m0+/2T6p8isfe+81LRDzImVSXFRnWUh4sC75VvLbQkbphieaXoTS82brPLPhb1XtBv2MIqeKGrubyvffRPhwQzRYV+9IESbnmLI0DTAg0DaWMrg6mp6DhKL+sqf09z5di5kHTZfthDViAq/rek4UxUAiFVLU419RNW6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IEJaL8rJXuRuaSMNZio/1rEWwmQ/2xxdBrh1zroz+uw=;
 b=g8HSB1zDfMXNoCE/77Wwm1g7uZGRGERw4XmkNki+3EjLlRhxqjq4nJ1hNJ8j2E8q2AqB0WKSGAPFXbIcPKGRw/Z0GefRNiJbQunPWzerBCG13Avy4yAo6xKD9LL9RY0dL2DpCvYj2qJyRqcIsUCn1/M5tQcf4osORDuMoV6CH4FwdGpYQivR9cxIafTDRyimARWs0GpvRrO8n1FX9M1WyERK4Cew4Uo7OwYz94ytJLr8xqIsdjfNNlM24ujQhGPdna14il/8I54/Dpic7SXBB9Te+qtBiao54XFo5eO7bsTwuCXWCwVRYCp0zV4yXMFmxKnVWgT9Mi9xyYamw0gGeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI0PR04MB10613.eurprd04.prod.outlook.com (2603:10a6:800:25f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 01:37:54 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 01:37:54 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 13 Oct 2025 10:49:28 +0800
Message-Id: <20251013-imx-rproc-v1-9-fb43a3fafcd0@nxp.com>
References: <20251013-imx-rproc-v1-0-fb43a3fafcd0@nxp.com>
In-Reply-To: <20251013-imx-rproc-v1-0-fb43a3fafcd0@nxp.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Fabio Estevam <festevam@gmail.com>, Stefano Babic <sbabic@nabladev.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR04CA0202.apcprd04.prod.outlook.com
 (2603:1096:4:187::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI0PR04MB10613:EE_
X-MS-Office365-Filtering-Correlation-Id: 17d45f88-226c-4a4b-9f80-08de09f920f0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2VpVzgxRzFCTnd2YS8xd2tYSTZtWHNaSlpQMzVYMXB1TEZ2SFRJb3ptdHVp?=
 =?utf-8?B?c010cGIxbklOVlFvWHZEMnd4R2MwNmNYekpUa1Vlb3BvRWtCTzFNNWlKaURI?=
 =?utf-8?B?ajd1eUREUTZicEM2YzBBWVZtR0pOMEcxQzNXQ0JYVWdNOGN0Uzc0akJmZnQr?=
 =?utf-8?B?cDJCUXBmcHBjc2t3dE92ZGZrU2JTekszbkw1S09NbnM1ZmJYYUZpd2x2eE12?=
 =?utf-8?B?NWRmckhHTmRnSUxsNUVuaXBhaE5hbWdNSHdsbHdYeko3RmhLNUZRVitRYlRR?=
 =?utf-8?B?M0RoZUNyd3RzVjdYK05DYWFxanFTeURuQXk3cEhQcnM1TXJodCtoQW8zU3Yy?=
 =?utf-8?B?ejNCOVFmaGZ6TGJvREVKeVB6MWd5M2EzNDhVWnJKODQyd2VneDMzeUoyRDdJ?=
 =?utf-8?B?TU5lUFFYckZGWUQzd2VxelR5a1lzUFNUSWhhNlRWRnV4a1U5TTN2eDFMR2h5?=
 =?utf-8?B?V3B6OWY2OFhtS2RqbFFaN3RzN1B0Y2xBZFBNUU9CNTlodExtbUtVc1d2Y3ZH?=
 =?utf-8?B?WjlrVzFnL2hobmRDWDhrR2o2b2h6NlNxdnAzZTlDbVd5ckREZkZOaldiNEVI?=
 =?utf-8?B?RTZha1VCNTlTdU5JNjZXQ3A4bkNvRWZmamVBckh0VnBZNHBtMXlWL1RiY0Zt?=
 =?utf-8?B?YVNnSnRITnF3cmhYaGd5RWxTSlRXSmtzTG5HR2RBU0hSS1M3Y0VzQkxKbnY4?=
 =?utf-8?B?ZEMzK2psV09BU3JnSXZVQkZOcUpOY2ZZYjFVSUl5Nkpna2lJcFFtVUpkTW1D?=
 =?utf-8?B?QkhVSmVNUUFNTWJHRDZvZjdLbWxsNCt0MDRDY0pPQnpLMTFTL1lZV0RCR3lk?=
 =?utf-8?B?MnU1WFRHTVR5VVcvVHhCTi9IR3UwUjQ0bmRQTkpYNm84bUdJUGZYK01MZDd0?=
 =?utf-8?B?UkRYNUVndnFRMXNBU1Z0THhKU1FWbW5FRzV0aDRFWm52Ly83QjY3MUpnTjFq?=
 =?utf-8?B?RU8wRlVhYTZOYnU0QmtINHhVNWpmbzF6MzEwTWtPRmRnU3hrUkplTndNS1Jp?=
 =?utf-8?B?Sys4OXFZbEhGS04xZTl0MmtSeUN3bkFSNFlza0UwUGh2SHJmU2RiVmZUZDVP?=
 =?utf-8?B?OEc5TUVNK3NiWFhHRmM4eldBb0Z2Nk8weVNZdXVwbmx1R1EzUDlKbWl4L3d3?=
 =?utf-8?B?bmluZHBuWXNmRXNmKzYycEszT3k0UUc1VnRmMG9iOE9RUm9kVDB0eGRQZ2VH?=
 =?utf-8?B?Mk9IbURlQi9KRDRSVlNKZUt4N1dBVFE4dldXajdNc01nWW0wUWNhamRnWDBt?=
 =?utf-8?B?N0FzdUZXNXp5MU1vWFVha2pSMFlBRDU1Lys1aDVsZGplMWx1aFlPcHJrUVhL?=
 =?utf-8?B?QmZMYlZTMG5va3RVcHpGdGFlaWRnZXlXcThkTFJKUHdTMi9SK2ltMTkwSDNh?=
 =?utf-8?B?bm03Z3E3cEFhVWpqL2V5WGxMeHRCa2VtVUoweFA3TSttbjRMWFVhYm45Zkll?=
 =?utf-8?B?ZU9JSzN0K0ZsZ3hySWtzdUlMcnhqS3lpaUJNWDFDOHRyTGdVRThZSWVURXJD?=
 =?utf-8?B?T0pxb3VKNndvbkdRb1VKVjNqY3pyM0lLemtlVWY3aVg5TUJvRUptd1A5L2JE?=
 =?utf-8?B?TXlhUC9zN2dLUHlvSCsvS05NUCs2TysweW9TMlQzc1VKeEh4QXA5Um82Rmxy?=
 =?utf-8?B?eG5HUHc4cjBCZzRmUUR0bXRINDAxaXBTSHhNRTJ3Q3Y2dFF6R01KRitGYlV6?=
 =?utf-8?B?M3BtakVaSTVrdUlqejRSOFZ3MEhQNGV2WUd1YkNJMUtTVGU2WjJna2FkU3JQ?=
 =?utf-8?B?SnZDU0F3S2grY3RNQjlTTm5nUWdqc2pzNVB0d3FaRk1QeVF1UWJ5cVVUMngw?=
 =?utf-8?B?Wm51eW5sYThYV0UyeC9xSnVFZHNwMHJRN0xWZEJ6MFAxNkZ2NXR0YjRTYkkr?=
 =?utf-8?B?MkpkTER2cTV4TUxKSUl2YnhPM0NyUjJ2MEE0b0UzQnVVN3QwSEhOQm0zdmFl?=
 =?utf-8?B?UFFXcm5UVW9pdnplSlQrRjVDdGtYMzFRN09sUVlhMUtGZjVvaVlFWFJoc0lQ?=
 =?utf-8?B?dGVjODVVeWZNajRRTnlueTlLTTJSdlVhL3lTbDVtcGRWR3JDWEdzUG4rYThB?=
 =?utf-8?Q?KnHnyP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bk5yTk9hREp1VXdkazkvcmx1dzFkMmszNGIvUGpoWkNHUUs3WnExMzhqTXJt?=
 =?utf-8?B?LzkzU2RiQXczcEs1OHM1ckd4N1NjeE1TWk81dkM4SzFaNHNoaGdOZHBxQStz?=
 =?utf-8?B?RXQxVE44NlBJYWZudllLcUdMeWc4bUczVVg0T09kOVEydmVYenA4UER1MXpL?=
 =?utf-8?B?TnBKdkdTYjRZRUNZWUpmditlKzNKS2FMUWpZTHlkbzYyaWxMMGtPdzc1WXZl?=
 =?utf-8?B?bTcvcFZEYU1ncVNWZ21xZHVnRDNwbXY2NE92Wm9wN3BncFVXTTVCZmlSSnI2?=
 =?utf-8?B?SkFUSDFFL011V2t0WFhKU1dnT3h1VWszR2pEcWtLYVNtZmROb0hUNWhHUFFY?=
 =?utf-8?B?Nk0yUGlvdmkxNWJmQ0pzb0FmVmlFVDFGR1k0Wm9rdGVGbUdSenBrTzIwSHNz?=
 =?utf-8?B?LzQvTjVEWUFaYzc0T0RPMlVWOS9mdmhrVFNWK3Y4TG1MRXYzd0xQdzRHQjRu?=
 =?utf-8?B?a2V5VzlmWFAyMnJJOEpENzE5R0VmMkxZNDhXTlZabVpJSDAyUzdJREhtdExn?=
 =?utf-8?B?dHUwU1FsOGo4azVIeTA0bzluRTVaQXJWU0dBSGtlVEJBMGh4ZDNuMjcyK1Jp?=
 =?utf-8?B?aDJTNmV6UGdyRHFKNGFlandLaU9qYjFhaTRYVmFkelkreVlNZG5kZzhaMFN1?=
 =?utf-8?B?elUrM3NVellRYS9xVk5aRVJ3a3lrMFlHK2U5WXNkbm1nckhkTGt6ZDYreU5u?=
 =?utf-8?B?SGx6U3BaYjd4d1pUaUk3SmdPbjNjQ1lMTm1nL1k5Y3VrZWo1aUNVRHhXc0Mz?=
 =?utf-8?B?T3VWRDZndmhrV3Ryb0JnRkQ0c1pTQWJ4enFYZ09SbG1SWVpWUWZtbXVjbm5y?=
 =?utf-8?B?K0M2c1FlTDJuMCtoTGREdUpKbmxhaW9oTnpqMzd0Z2RjQlJQOFp1K2hEdFpS?=
 =?utf-8?B?RDJnbnZ4SVc4RE1CVUk2Ty9iK21FWE1jdWZISlRoNk5EcmNnOWVtKzdBMjY2?=
 =?utf-8?B?SGYvRmhVa2FyQ3Y0QlRGT2tyU0g5U1B5TzNFTzVYWWxpL1BKR3lGWTY4b3g4?=
 =?utf-8?B?YlZPSTYyTTNiUXF3K3VEZGJ3TDNHb0dITmMzZnlibmhJeUJYSGRJRDhvZHBu?=
 =?utf-8?B?ODM4bDhJMkhSM2xaZUlyYnBXTTRXSGhZdS9LVHpmTmQ3cTJMcHJ0b2hEa3Fi?=
 =?utf-8?B?WUh0eWxlaHlhdVNrNXROQngxU3NLTUdZYWV0c0ptQVgzUmVEeEVYb2tCT29D?=
 =?utf-8?B?ZTZYTWE5UUE2cm5xQkp5aXZ4QWlJMCtVQnBhcFE1bkdlZWtZOEdLSEVnMEUr?=
 =?utf-8?B?WnVMT2VORDZqdVFMblJ3QW1BMlpJQldZN3RybmdqTTdWT1h5amZ1YXp2ZW1l?=
 =?utf-8?B?OWNkbGU5OUlyS3Z5TmM0NFN3aDVEQWlZV2FibTNQUk9HR3VuaTcxZTRseGw5?=
 =?utf-8?B?V29ZeHIwY29VZ2VtQ1U3SDl4TnVFNWF4bUd3dm1DeG9vSmZ1YVk3bStNd3Zr?=
 =?utf-8?B?K250QWh0UFNjdlZrUHlnUEh0M0NOOUR5VHRlZm42eFJCTE04TUFxOFVPVmw4?=
 =?utf-8?B?dEk5VDZzcFVLOGFhcWdON3ZjVllsWUN2UGNKMFRhNzM2VUlBNmw5Y1BLVGYz?=
 =?utf-8?B?bG5GbHE1OHZnM3V4N2RINmcrQjhDMGpIZUJxcURXT2piYXgwblJic2dkQlJF?=
 =?utf-8?B?dVZ3RS9SZTduQ0UrMEFtUUZXK2xySmZGcFR2RHlUeFhJV3BiNjJHeVdKOGNn?=
 =?utf-8?B?aDJKKzI1d3ZWUDJVSUVDcC9Qa0NPUDNZWnY3TEZpcnZYUVBTOVRHWmtIU1hh?=
 =?utf-8?B?YmdkU1Y4Ty9CUTdTL3FBWHJiTW1hTWIvMnZxTnRVR1N6TzNKcFVaK0tjbllY?=
 =?utf-8?B?TnhQN2RCVFo2S1pxMXFKOHc0SlpmWjd6VWdXZWxxSGV0N2NZaHNSM3NqbWoz?=
 =?utf-8?B?bmxNUU5lY1ROQjJzTjF6MlNCUEtBeGJUQXVYa3gzU2diMWJlVkwwb0pneXZn?=
 =?utf-8?B?ZUIxenJqOHFhTS94eWZGYnZxMXVPRzMxbnlIUEdlQWpVOUVoV2FuVlVHYUZG?=
 =?utf-8?B?UWhWczc1UmVqUUs3UWZEdU1RUzBpMlhjcU1iSkhTdlcvRXdMZSs1djJ1R1p2?=
 =?utf-8?B?T01PU3NrVWFSZVpyS0pNemJJeVpyQUFKTGpUOHo5RnBoRm5aY0pETWV6TmRv?=
 =?utf-8?Q?GyW7jDbGnQeKoB8mePi25DH8l?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d45f88-226c-4a4b-9f80-08de09f920f0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 01:37:54.0116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oixJ3ZLxdd6njt0EvFYe9mxIoVcbSZOo5vrqqXo9mqe7w24NPQdI04RYMNzSzLO7a8Usy7hl+EZjT4Lm7SG9iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10613
X-Mailman-Approved-At: Tue, 14 Oct 2025 07:30:14 +0000
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Udit Kumar <u-kumar1@ti.com>, Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Andrew Davis <afd@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
 Judith Mendez <jm@ti.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ryan Eatmon <reatmon@ti.com>, Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH 09/11] imx8mn: Enable remoteproc for i.MX8MN
	EVK
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

Select configs to enable remoteproc for NXP i.MX8MN EVK boards

Reviewed-by: Ye Li <ye.li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm/mach-imx/imx8m/Kconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/mach-imx/imx8m/Kconfig b/arch/arm/mach-imx/imx8m/Kconfig
index 35da05e93f5300ccbc77eeb3ad07050768900b94..0584dcb580fd4b25582b26b899c70f3cb78a3858 100644
--- a/arch/arm/mach-imx/imx8m/Kconfig
+++ b/arch/arm/mach-imx/imx8m/Kconfig
@@ -175,6 +175,10 @@ config TARGET_IMX8MN_EVK
 	select IMX8M_LPDDR4
 	select FSL_CAAM
 	select SPL_CRYPTO if SPL
+	select CMD_REMOTEPROC
+	select REMOTEPROC_IMX
+	select REGMAP
+	select SYSCON
 	imply OF_UPSTREAM
 	imply BOOTSTD_FULL
 	imply BOOTSTD_BOOTCOMMAND
@@ -186,6 +190,10 @@ config TARGET_IMX8MN_DDR4_EVK
 	select IMX8M_DDR4
 	select FSL_CAAM
 	select SPL_CRYPTO if SPL
+	select CMD_REMOTEPROC
+	select REMOTEPROC_IMX
+	select REGMAP
+	select SYSCON
 	imply OF_UPSTREAM
 	imply BOOTSTD_FULL
 	imply BOOTSTD_BOOTCOMMAND

-- 
2.35.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
