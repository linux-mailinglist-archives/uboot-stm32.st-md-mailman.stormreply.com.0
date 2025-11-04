Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAE2C306BD
	for <lists+uboot-stm32@lfdr.de>; Tue, 04 Nov 2025 11:07:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 839A1C62ED7;
	Tue,  4 Nov 2025 10:07:11 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013006.outbound.protection.outlook.com [52.101.72.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 716E1C62ED7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 10:07:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Exhf1L4OEg3Vlr9j4mPLrPZsNFs9o2ZjTt5fH5NGCB8pYrWx2T1O/Kx+xTQ/I+7Wywfb9IgUQzv4yH/ma3tE+2YAtU1MLGVT8p+EJEchsZKmoMxFWiq/H9ye6DQ7nd9rxAIye6Ls+SsZwLvlE3QwdsgX+Z7SE0m9CrIU0k853Lq2wZELu8z0IaICMHDDG9PuskBZsuTu5ks9QHmkbwz1hc/yy1ONiuyClf6jxti/4pd5H6u2n0sPj+/pA51J58UwHTiii6coIC2KObkXZtCWUsAZUVWYKc7ic5eMopJzEse07Npu6yxvoOhzx/+FLdgsNipUZCnL6nbIPX6ls6MZbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UyskbXo5hSlHkKRVaaIyqpvML5O2qARYu3FJeLEnbs0=;
 b=CSsCW1IGcRyhMGHKF+Y01z877TJ2jgViJESu6AX9IIx6Sh3KM0f5rGN+PrxGoVUJ/ZNfDPBkCzCkFPqc6SZsLFZxxB2nuA/Ibs1EsOFOvhjGCmuQHQjKBt9sN8GnBhbY+0oRYPpJt+Jktg1rZwVQ0EKmfP43LcnPWAsrZAerY2GFtPv9af2HKcIDImYBhAXDCnEzq/ZHOgnezlutppFuuw5uwoAVTpEJIKald/Lu//+m3ZUEcwVHcCalcbSQt7ftSSyWrRAksucdXeM86fz4Tix7ksX7I4sRW6tiqFPizO1WTJE0a4w6wl9A0EsKLacchwwqzxVuUCUknH8KpiTcrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UyskbXo5hSlHkKRVaaIyqpvML5O2qARYu3FJeLEnbs0=;
 b=Zi9IOYt8Cb/oT6w+SaKFJ3oT6ol9m5W6sM3qTh7LAowq6Y6ZE2v3qhCLzr/7aIJiyjSY/HzvKhgnSFv8E8COMEoa+KPams8oHvM+KT4z6a141UhvvZ93Yyr+5LvKzgAQqVBw//efFgZ73MnnCqBLQTQFsE52xKptAzI9i0bb93P6tMypq7hZnisJlZyJIx9tRNuHzHxtBCAkC9rUt6fllfFV1GHBiAyh+G6IltjnN8a17tph9uswM+nWuBkq/R8ssFmoaGbYs1fQTAKa/+OhDYO/+RpSF0uUKAxfqK5Cd/yRT5Zf3GhEyj/Yutpb4d2dWqwUN2GeV9bcWbBwIElJng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB10955.eurprd04.prod.outlook.com (2603:10a6:800:27c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 4 Nov
 2025 10:07:08 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.006; Tue, 4 Nov 2025
 10:07:08 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Tue, 04 Nov 2025 18:06:00 +0800
Message-Id: <20251104-imx-rproc-v4-v4-11-8bbc7b886737@nxp.com>
References: <20251104-imx-rproc-v4-v4-0-8bbc7b886737@nxp.com>
In-Reply-To: <20251104-imx-rproc-v4-v4-0-8bbc7b886737@nxp.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Stefano Babic <sbabic@nabladev.com>, Fabio Estevam <festevam@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762250766; l=2980;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=tYpqyVROkHajMUk/gmbPAuJTUQZUr1O8aus2T0A0O2I=;
 b=kwrqXNxLhLHzaFpSWtQNNX8661AyHPm8tscSN3yYzaCmsOcrJd/YQctD/CkjQEpTNnXkmPOeg
 QFWcCarWsV5AcQDVobN7ooCHmr3UdN11NaWw3DwvxhKOqEaUag42VXf
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI2PR04MB10955:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c4e6425-8431-446c-1022-08de1b89ea27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|7416014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDFIRGhnbE9raStQM215SlZTYnQ0T3RqWFJWNytQdlplRFR5d1dScXJ1bG9t?=
 =?utf-8?B?aDBseVZBVVV1Ry9LYWlIc3NweExBSE1tcUJQbE5hQWtLcUo0U2IvbHM0c2JE?=
 =?utf-8?B?RWE5byttZnlxUnhnekV6cUFhbHI4TERXV01sUnJjd281RmFsOUV1K1ZVSjIw?=
 =?utf-8?B?QkswSlVFK0ZxempITkErT0JzNEcwYmU2UkRZdWlPSlVtODNCS2s5NFFSRHpX?=
 =?utf-8?B?dDlNeFZsYmtaOFByeE9TQzlUaG9hNlNYV3gvelUvcnFQNGhtNmYrVWE2NmhI?=
 =?utf-8?B?UkxISWV6d2dQa0gwUkxqTmcvVis3UHVYR2czNnhOKzNBTTNxNm5BbjRDSy95?=
 =?utf-8?B?dVVQbmpYcnJlTXFZaXdFY28vOGNYdVdvcWVIU1pDL1dwbUtqN3JBZzRyTEM5?=
 =?utf-8?B?RDJnRmUyU0lJYTBnRWs1T01lOVJaaWJnUVBxcU5xMHVHcUxBU2p2KzJJTlJY?=
 =?utf-8?B?YkNiNm1Dbi9SOUhlRGdMVm1LdkYwa0dxZ0ZyZU5WN3ErajJSYXo0RTBRZzVW?=
 =?utf-8?B?UDEwOXVkelVEcDVEWm91ZDduSHhaQ1diK0R6UW50MS9HVURLcnhUSVU0OGpU?=
 =?utf-8?B?OXlEUy9NeDB2WFZKRzhhNWc4NzNvQlRHYm9QeFY1b2Q2NG0xRUtmRmh6cGNT?=
 =?utf-8?B?NVhzNWIwYUh3UkFFR2RpRENLR0QrUkpZTSsxcjJyRHF1VGVPVXBMS2JUNVdr?=
 =?utf-8?B?a1plTWViZzBEMGxQSUUzY2J1c29GWjU5a3J3ZUtPVFplYkJ3b2MyQWdOekVa?=
 =?utf-8?B?Sk5WVjBZSUc0TE1SUk44aGpHellYR3YxMHVMTnFWMmMvbUxPeWM5akNpZjY2?=
 =?utf-8?B?MldibEJ5MFNBUnYwbi9TVDBRTFFBRUJoY1g1emdIRW1ERVdDdm1vMVdUNXdV?=
 =?utf-8?B?V1YzYUZvbmg0ejA1ckNYOXJnK3hSa2lVRkl2NlRwWGNXVlNaSjVrVUg3OTRN?=
 =?utf-8?B?c2tZcDdINlJubGJGWTduN0xiYjArTHNRRUhTaCttLzM2UFlsRGdhbE1oN1lI?=
 =?utf-8?B?aWUySmtPRzN3d3ZBMC9HWjEwTGRHTWFnZzZqN0NEM1VEYWJ6YkpNL3V3RDhC?=
 =?utf-8?B?NGVRZFRSUVJNRzUvTEtTK2tPVHMrTmk3SXJ3TnhhMWM3WFBwemNLZ1hPM2w0?=
 =?utf-8?B?RTYyMldBekNuTDgrZ0I5Z0pkNmhVTzlhNmFaVEZlUmxvUXlnOStzQjY0RHhl?=
 =?utf-8?B?R21ONDFSS2dEYzZldWdMNmduVldmZGFQcFNlcTg4cmxPL1l4WVlPZWVHVk8y?=
 =?utf-8?B?WUo1eU5jRysyQmo3cjRVTy80THpNOW9SdjR6SlR4QmJ3cjNwYmdGcUJDeXpp?=
 =?utf-8?B?MHNlMlp3ckIzdmZUWVVmaWRtL25ZcHZ2ZXlVakFhbHBpYVFQSDUwUGdXdExQ?=
 =?utf-8?B?ejNmWjB1dndQclY1TlJYV2VFd0FiRENtZ1FmVDRSS05yM0lSU1B0eGF3RUM3?=
 =?utf-8?B?YjZRYkFDeFpSWXNjRXdNQlBURGlWbVNyK1lsZ0ZmMnFESUJvR054NXgrZzFI?=
 =?utf-8?B?RTBTWmQ3ajhFdDU0dXpsR0lYV3lubEM5aXhHTE56V20xQ1hIeXhpaW5LREYv?=
 =?utf-8?B?bXpRVFlzclhyL3czUWZVaEhWWEhYcitqdm94NWxwL05rdDE2dXhMMlVid3ha?=
 =?utf-8?B?MWFaMlRZZEJvQ0xLQkpTeWFjTGRlajV4WHdWZFc5Y1ZJaEZRY09XRzBoa29l?=
 =?utf-8?B?Y0h5M1JvMnJHaC9kV1BBd0p5WGw1TW03UEFuZ1BYQ053a25vbW40c0NsNTNJ?=
 =?utf-8?B?akxVdU9iWnhWREFsNFk3MnE5RlZWUXdWRVFCSi84NkFrRDZKLzNTRk80ZEM1?=
 =?utf-8?B?Y055Q0lXRVYzc0ZVd0pVU1F5SnYrbmhPdXc1VzhWV2xENFpYMFM4Zjhsa01K?=
 =?utf-8?B?eEg0Z3lMbW9xMDdqK1AyTG9udlVSWk42M1ZEMWJsdkpobFhNbElNcjNSWUp5?=
 =?utf-8?B?YW9CaVpESXBJME5oNFV1ejJ1enFiMkY2TjQwbllsMWRCalppZHgzQlRQRXVh?=
 =?utf-8?B?dTczeFMxQkZXV09QZSswZk9OblVVM2dMNHFaWmhrQ1dDN1JtZTJKMloyY3hw?=
 =?utf-8?Q?t76/KO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUovRDVvYy93VEdZOUZFWm9tZnJvckg3Wit0UjVmd0FwdE03TFdXWnV2SmxP?=
 =?utf-8?B?QTFodTd3Lzk1Si9HYUJDdUhDSmFSVVJuR2JHZW0xMXlEQ1ZlTEtFb0VNTHpT?=
 =?utf-8?B?a0VBb0UyZlY4Q1RaclJJcDhIek4xdTMxRlFvMWNPb25kR05TMWhzMWZxVzNY?=
 =?utf-8?B?Q216ZXM2SHcxTysyOWxZWFhXektrbXIyYkpGenZRQlBtWEhOcjMvODE1K1JS?=
 =?utf-8?B?dWNudlJsakc4ejk5YUZwMmhIVnNTSXhRNTY3eG1ic3pCNDd4SW1CU1BHaW9l?=
 =?utf-8?B?YmFaY2k1dzZLamkwbFZlTVdZZmtUbmllQTY4bTlZN1pNVkJIQzVhYS9qSmth?=
 =?utf-8?B?QzBXUHpMNzNHRXgzcVkyU0hkRW5GL2JQV2ZFOGcyZkdkK05jeU41MWJtbENl?=
 =?utf-8?B?MFdMWFVDQ0c1N3g2NHNsZ2VvY3dFSU9UTlU5UWkvY3hNeVd2UGtaMkFmNkZt?=
 =?utf-8?B?YXdaV0doMHovM3BCbm1ERldSc0kxcXpFL09MQ09GVTNzeEVqVTV1NWlzZnFH?=
 =?utf-8?B?L3IreHJnZ0dkWENmeHM4Njk0RzVSQ05hZEJtSzlkYyt2WVN5aWVoeEV3VllT?=
 =?utf-8?B?Z2RsQ2JVYUpGbklsamRodnBqbUQvclJnSUhqL2pGQTl1dytpQ09ibCtZcS9J?=
 =?utf-8?B?bUFJdFNUOUFuZkx0VmY3bHZOQ3czTGhGVGlCbXFJZWJxWW5FL2dTa3BBdTBI?=
 =?utf-8?B?dnpUTjZnODlrT0puQXNScDZkUXJLRlYvMXZhYUprejJOWjZ3U0RCY2xXaSta?=
 =?utf-8?B?MThFWHBQdHZMYkRMa1l3amV3RktoTU9SL3N1ekc2akk2Y3JCaktXcElNVnZJ?=
 =?utf-8?B?by9ES05yQy94bDgwa2FKYVpIWnVRQzhmTnlOVlU2RlhOdkU0SElwZUpsNUM4?=
 =?utf-8?B?REkwWnVWdWh6NDZuN3htOGowK1R2SURyVVdFc2IySGNoaVdNREVzVUxGc0FF?=
 =?utf-8?B?Zys1UnpYVG5nbVJEVlRYRER3OGl2OThITDgwbkp2SHYrWklJVmtEU3k4djls?=
 =?utf-8?B?U244ek9udXo1c2ZuR2RGOTFZRGFFakN1WjZFd3gxMjRGcWNtS3R1VFhPekxN?=
 =?utf-8?B?UWFrV0lEeE9XaU02UlQvTTA2K25BWW9ZVnpmZnN0QW03N0IyZDBhTWVwTnl6?=
 =?utf-8?B?UW1GYytVUUtueFZrc0dubnlzTXJLMG44UzhHYWM4bERoT21teXYwd0RabCs3?=
 =?utf-8?B?b0xZN0xRbUR3Wit6MlQzb2RFOEwvL1g5OXFucC8xeFFCb0k1VGt2eWxFOENN?=
 =?utf-8?B?Vmg3RXpRT1NFVGRMa2h5N3Y3dWZySThoNjlyQ1V1dG56a0hKdjhYNEtVMkNJ?=
 =?utf-8?B?UElMMFQ5R0VXbjlLK1lLbGV4TFdIR3h4SjRLd0poREhGSkpHMFVEMVkwcVZj?=
 =?utf-8?B?eGxVc1I5SFFyY3NyZisreStHUW1MeU4vUFhCaG53dW04dWI1MnM1K091NXFp?=
 =?utf-8?B?UGVSR3VTWGM0YjZRVllIeWZ2NHpsZCtmNUdFRWpGQW1oR21pT1FjemF4QTN5?=
 =?utf-8?B?N094UitiRDlKV0RwVDBXcXVjbDNpdHBhbjVaSGlYWnRyNnIxVnNhK2tRVUR0?=
 =?utf-8?B?bHRTSFFhM1NyeDR2V1hqeVlOSXVTTk5peW5EVFk4Si9xRE8zcTIvaWdGVGNU?=
 =?utf-8?B?QWhCUkE2Z0xMd3hOVXJRbHprRWxUVXFLWGZ1RlJUSHcvVEFMUmcxaWh0OUxD?=
 =?utf-8?B?eENtbzJkNklkeEFIR1FldXphMU9pcWJPNWk5Z1JZZ1M2M0kwSlVUU2h4aFI4?=
 =?utf-8?B?cWN5dlIwYmExU25DMi94WE1rWWxHVmdhZmNLa3g3amw3b1hWS20vNm1MbWs5?=
 =?utf-8?B?TkJrR1RHN1NpWi9WaVVYbjF5RjZadVBWY1R4OEZidkJ3WG5jb3RHOXFqRjBt?=
 =?utf-8?B?aWYzR1dKbzFvZzJvTzJ5aWVKSFY0MzY2WEJLa2JBSEJsZXA5YUdYcGxBNzJ4?=
 =?utf-8?B?NXZNbDIyQlZSWGxtSEpCbHNHRGhzeWloRmg3OHhzOVlvOU56TDZITEwwem83?=
 =?utf-8?B?NGQ1ZGRNTElBQjNTSnQ0ZkxrNGl1T1pNTUZuLzl6empvZEJpdXkycE5jYmNJ?=
 =?utf-8?B?UHVFRTV5N0RabGJFVnQzeFUrYnczYnA2WGRZUXlCOHkyck1Cck4xYzhwbVhQ?=
 =?utf-8?Q?bOI7Yzhj0su0EK78QvRJJ7WAq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c4e6425-8431-446c-1022-08de1b89ea27
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 10:07:08.7518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9zIcvLw7Xx4+NpISiCqUKiWz0rh2+xsl/IFsp5eWcE8uzMEhg8FZ71mTLXZOJIWxnIWkVQ0bBxHM0YULrvNalQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10955
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Udit Kumar <u-kumar1@ti.com>, Andrew Davis <afd@ti.com>,
 Beleswar Padhi <b-padhi@ti.com>, Judith Mendez <jm@ti.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Ryan Eatmon <reatmon@ti.com>,
 Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH v4 11/12] doc: board: nxp: Add remoteproc guide
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

Add guide on how to use the Remote Processors on i.MX8M and i.MX93.

Update MAINTAINERS to include doc/board/nxp.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 MAINTAINERS             |  1 +
 doc/board/nxp/index.rst |  1 +
 doc/board/nxp/rproc.rst | 69 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 818a2d74fbad60f0425e3cebc24b6029c2623141..60772a494a365f6a2890ca499eab5f91e1cac1e4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -317,6 +317,7 @@ F:	arch/arm/include/asm/mach-imx/
 F:	board/freescale/*mx*/
 F:	board/freescale/common/
 F:	common/spl/spl_imx_container.c
+F:	doc/board/nxp/
 F:	doc/imx/
 F:	drivers/mailbox/imx-mailbox.c
 F:	drivers/remoteproc/imx*
diff --git a/doc/board/nxp/index.rst b/doc/board/nxp/index.rst
index 670501164b5c11f64dc1dab03b6f90e2fba0163d..7b881961b65d4b481b018761cdedb7efb4d208c7 100644
--- a/doc/board/nxp/index.rst
+++ b/doc/board/nxp/index.rst
@@ -26,4 +26,5 @@ NXP Semiconductors
    mx6sabresd
    mx6ul_14x14_evk
    mx6ullevk
+   rproc
    psb
diff --git a/doc/board/nxp/rproc.rst b/doc/board/nxp/rproc.rst
new file mode 100644
index 0000000000000000000000000000000000000000..b023c1fadf6253438158b46a9ca1cc9a4e3dd757
--- /dev/null
+++ b/doc/board/nxp/rproc.rst
@@ -0,0 +1,69 @@
+.. SPDX-License-Identifier: GPL-2.0+
+   Copyright 2025 NXP
+   Written by Peng Fan <peng.fan@nxp.com>
+
+i.MX remoteproc usage guide
+===========================
+
+Introduction
+------------
+
+This guide is for giving user how to use the Remote Processors found on
+various i.MX Chips. The term remote processor is indicating the Cortex-M
+[4,7,33] cores inside i.MX family.
+
+i.MX8MM-EVK
+-----------
+
+Steps to start the Cortex-M4 core
+
+    load mmc 2:2 0x90000000 /lib/firmware/imx8mm_m4_TCM_rpmsg_lite_str_echo_rtos.elf
+
+    rproc load 0 0x90000000 ${filesize}
+
+    rproc start 0
+
+i.MX8MN-EVK
+-----------
+
+Steps to start the Cortex-M7 core
+
+    load mmc 2:2 0x90000000 /lib/firmware/imx8mn_m7_TCM_rpmsg_lite_str_echo_rtos.elf
+
+    rproc load 0 0x90000000 ${filesize}
+
+    rproc start 0
+
+i.MX8MQ-EVK
+-----------
+
+Steps to start the Cortex-M4 core
+
+    load mmc 0:2 0x90000000 /lib/firmware/imx8mq_m4_TCM_rpmsg_lite_str_echo_rtos.elf
+
+    rproc load 0 0x90000000 ${filesize}
+
+    rproc start 0
+
+i.MX8MP-EVK
+-----------
+
+Steps to start the Cortex-M7 core
+
+    load mmc 2:2 0x90000000 /lib/firmware/imx8mp_m7_TCM_rpmsg_lite_str_echo_rtos.elf
+
+    rproc load 0 0x90000000 ${filesize}
+
+    rproc start 0
+
+i.MX93-FRDM/QSB/EVK
+-------------------
+
+Steps to start the Cortex-M33 core, need to choose the correct file for
+corresponding board.
+
+    load mmc 0:2 0x90000000 /lib/firmware/imx93-11x11-evk_m33_TCM_rpmsg_lite_str_echo_rtos.elf
+
+    rproc load 0 0x90000000 ${filesize}
+
+    rproc start 0

-- 
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
