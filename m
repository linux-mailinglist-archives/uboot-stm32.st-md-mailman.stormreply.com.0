Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BFFBDC23D
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Oct 2025 04:19:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CAEC2C56615;
	Wed, 15 Oct 2025 02:19:05 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011021.outbound.protection.outlook.com [52.101.70.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF004C56613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 02:19:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rl+/4EvqKo3J2QJFdXp7/SO9pWRDfwBuIJNDOpJUMjXLquOAVat/gnKtEqyADYBZ7Chvsg5D2v+nsUYHDuMPH2Gr/ogm6E3I+YLPj/ObxxYsM6wLC5XejIbta8EhfXHL6gnDrxvcBlziP9fn/cxGgwomywPjWNv0Em0l2BCxV0p4FSxBEeDAtjH/YQsdkCLPtbR2DOKFbzMO3GZBgXRGXGOYWpDc0nwx7ls+xQVwRTzNrXCdM6E5iDfeynJ5H8DuJF+K5JxCcOvL3bGl9oH2yZkqWtq7cxbW0xeHXbsl9d5KvXSmybSgQDPPXGI5Y3dSdoUU2H26UB3s8fxJ2BNEeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HpYnLYBOw/GHNWBHzQ63FX5N3NIrCAYps/ldQ3vqDOM=;
 b=AZvayotgU2VOUxAukBxQ4r0zA9A/RPFDcn21Q5YCykytk9mWjx03zSQ3HooZbFEstYoUMeKXV/XKOVh9qgyCxMNcpkUbBtzVrNXeT905aExYLVGgVfMnFGGuNj5ONNrvA1chxc4CKV5vp2b92lITDibuRCLUFN1aBv/34V6HJwD3t+RnjG+CivjtDy3QajJxtZof0EmCxKdApAewM1DSw3ja+wQHvMaRiJ0J8PJQi0pa9ytALzgBa83s551vuuzzhZHXYzm2IjuUdzK8xjNoUPed7G0XC1TZRdgbcixUZj2GsCDcukVn36ZvKZfJBg+CQZs1F7umFyqxpB1N+c/kqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpYnLYBOw/GHNWBHzQ63FX5N3NIrCAYps/ldQ3vqDOM=;
 b=LedDD0Ge4GY6/ARnPZDkyhC6wpoL7qKKXtRkIis4g82AmKUcXIBvefVZpcmNmieGzyIJdSst1Z/R+UQKiF3t+aqHPVnRy5sRsFsePNUxjaZQquY1CJtW2ZRIMaA4/7J9jHnPUebNdfojr9NfsmWeqqdod9t09lm5wl49GvT3sisPrspyp1YqvPOOFGpC1iCJ9yAlFgd2r/KXGeysY+gWOSOe3b4h7TNw47F9txkhh3EEYE/Z/RKGnrRUnqiXdQDWeNrv6Oy2gpqK1oPe5BcZbnC/BY4+KyloAN1WBTfULO1Wki1wz9WOZj21RCAco2Ajf2YYKBIq2gDVkfUY6RSeUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU0PR04MB9444.eurprd04.prod.outlook.com (2603:10a6:10:35c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Wed, 15 Oct
 2025 02:19:03 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 02:19:02 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 15 Oct 2025 11:30:35 +0800
Message-Id: <20251015-imx-rproc-v2-10-26c6b3d16c35@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: f030e790-ef12-4d04-f1b4-08de0b91354c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|52116014|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OGxVcnpHdzlsa1pab25pRy9VczkrS0U2TVRiaEVMaFd2dGplMEZzaGw1YUpL?=
 =?utf-8?B?TU9raHgrbkwrN3BPWVI2SjNRdm53R0xFUm82VjVvNGRKSjJWUTR0ZGJSakln?=
 =?utf-8?B?RTcxRTZRSWFPVXVLRFNVYkFkMS9iQUY3Mm01a3VJeVZQMjRlR25MWFcxc0lX?=
 =?utf-8?B?T2dEVEJGQ0lha3ZoenJGS0ZXQ1p4eGhyUFVZd2dJVlg1Qjl1azFOVVpmTTBZ?=
 =?utf-8?B?TUpKNTdEREtDSFNtdGllNXF2ZlFTQU5TbTJWd0hRb0hqNERPY3greVBuS1M1?=
 =?utf-8?B?azBzZFRRTkxXczNpR25jMHZ0cTNCaVh4b3JwbER6T2dGY2FrQTgyZU93WjhW?=
 =?utf-8?B?blBsQk5VQU9hZ1NHTU8zRSt5OUVTamF6ZnRpcVFSOEt6UmR2SGo3dXB5R0xl?=
 =?utf-8?B?cWVhcHkxbmlFRUhJdmJCQURSTmpvWTdMUkpRNGtWam9Fdmh5SnBLeXVoQllS?=
 =?utf-8?B?cHpvSFoyS1pFbTlUOGZVQXBaUDRrRW15QkU1U1hpUnp4NHBISFdtTUlsdE1N?=
 =?utf-8?B?MEJ4ZmhCazV1YjFFWTRGN20xWmlZaGhNeThONnNWZm5YVkdPdkFOVDNNY1I3?=
 =?utf-8?B?Q1Y1YTExd2tsWTQ3NGpyTDBCOHJKNG5yYnJJdGNCRXVsWTZ4Qm16U0dFYVpH?=
 =?utf-8?B?T3ViZ0lwT0tORURhSENHRWZWZHM5dGxTdzVlWGlYbFRIWTFFaWNVNGVFZ2M5?=
 =?utf-8?B?OUZSYjdIcGlrV1pJbFJob1RSZ0lEc29aQ0F5VStzMk16dGpJdnA4eU9ySzRx?=
 =?utf-8?B?THpsMUJraWhKMmdVTjhCSDlVdmErUklLMXhCdmZvSWp1Wi9vZ3JjZEVBOUlw?=
 =?utf-8?B?czFuN0VrZGpzb2ZMdHZHTlFENzdyV25jRm9xOTYzU093a1RybW1aVVFkYmtP?=
 =?utf-8?B?dUMvamI2Mm9rSXJub2hQTVVESVVNeUhQZjA1RVZBa3dLMk85VUEwVEFqRkRI?=
 =?utf-8?B?QU8zNjNVak8rMHZmeDJCT1RudXhoY0V6REtsNnJ6aDFwSDZWOWxnMGlCaExu?=
 =?utf-8?B?cW5nL1ZrcXlDR0NUZmErMXFzbmtTVUFkdk5iaUhNWFJkK3RJZ1ZYalhKRmI4?=
 =?utf-8?B?cnBvd1plRlh5VFN3UnZxWjVVN0xLUWVySjJicjV3R1NONDhVc0dzZ0xYSDJ2?=
 =?utf-8?B?c0RFWXQzTEdOMmJvQmdWV1ZGYmF5T1gwM0twd1BHWFVHOTJzdEJ4c2kzazVV?=
 =?utf-8?B?SHlJc1diWmU1MUkzYlcyaWtMdG1kQmdnTktuUW5yZkk1bktUZnZsZTlnY3pS?=
 =?utf-8?B?dUFrdlJ1bC96Z0ZyOFRseUNnVGxYcm93ODREN1RvOUw1ZlY1WGJWQlNsWS96?=
 =?utf-8?B?SEdaaG41dG9aeHdMOStjQm42R1ZHOTg3bnZzSENKSUdWREozSGF5MHJPNDd2?=
 =?utf-8?B?NnN4RzIyWEorWU4rZUtCVElONTF1OGZ2bFlFRDFRcVl5cFNaMnNkanRaT004?=
 =?utf-8?B?aE15NzBNSHB1REZ2ZWN3ZlRlQjZWOEl1VjRGOEdjWklmZWhoaGlhdVdQOUFO?=
 =?utf-8?B?M0c1OW1TY0J2UjRhZ29iYktnVEhkTVBEOTlGZ3hQQUJlUWlVT1hkZHYvdWZl?=
 =?utf-8?B?c1p0N0tJM1Z0NVNFQ1piWDczL3plUU9ZdFl0UlMwQlRWN2pnQzRsL285SHlo?=
 =?utf-8?B?bXo3VTBYekhIQ2RGZ3ozQ0lndmR4Z2RoVCt3ZEFmV3hFTFVqc3IrRkdLUzBx?=
 =?utf-8?B?cDI0QUpkWDAreGFPUTRRN2F1WUNiandHbmlPazdQSFFpRTUwMlQwbVhJUDBU?=
 =?utf-8?B?TGY2UDUxMGpUQWg4QXhXZXd6eXNWTktZL29NS2VmNFd0ejBxN0dwZHJXK0o2?=
 =?utf-8?B?SHpEL0l2ek0wVTBsclNmcytwaUp6amM5Z3ZJell5czZrclFTWlZxdlZaWVdj?=
 =?utf-8?B?M2FOaGFxU2V1N0JsUzJJSTk2YVRnODNibHpERzkrN1EvaHpNK0JneVBkcHVM?=
 =?utf-8?B?TS90bEI5ZWpPTzNOYU9aYURad3BJc3ZsZTNFRHFIdnltdDQrbHYxemYvMXkx?=
 =?utf-8?B?blFJUW01SmdIVmR3VmlEV0xKWVREWHpLK2lrTXVva1dnL2NyTm0ycmh6a25S?=
 =?utf-8?Q?tp98Ff?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(19092799006)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGViQ0pNdXA3K3JWRnk4Nk1wOEpHQTV0eHVnZzA2WXBkSFpCdUpDZ0tJakVF?=
 =?utf-8?B?T1RIY24xUkU3cUpKeXFIZXkvQmoySjJTbytySHcwTWM5eVhLc2pEcjNRS0l0?=
 =?utf-8?B?dWJ1Yzdhb2dqd2FvUW9vcXMyaG5DcU8vRnVsSURXU0piNFFzNFlVMjl4djVR?=
 =?utf-8?B?eVhTMWd0MlRHcHBvMUd5QkJPYkhqbWpscGg4SDFKeTFWQkxMQUxjcE5tOFdP?=
 =?utf-8?B?Z3Z2S1B5N00zUnhCWXRpazQ0Mk5BWnlDZi8vQ2tHQ2RUdGVCaDlXTFhVQk5E?=
 =?utf-8?B?SEVXR3ozcmtaZVdLeGk2aWxtc3IyZUp6RU1JenNWS1NTZkw3dVlGK1ZWaXVY?=
 =?utf-8?B?dTVWQ2tXYmRmUjBxNmhmRjdYakx2RHhwb0xjbVhKY2VhcUhoekNsVGE3eTMv?=
 =?utf-8?B?WmhPdjE3Z3JSRmh2THpKelZsampsMlNUZmRVTUhmMy8wZGZGZzQvMmRuZ0lm?=
 =?utf-8?B?emtySnR6VnFWUmhrTXlaK2JlaUZxb2JqT1hhazFlUW9URXdEUjZ6Y1MrRkF0?=
 =?utf-8?B?cEhYN3NSSHpNM3U2L1JFQXdZZmRPUlJhWDdEOUR3eVhKWURnUGFJOCtBaGV5?=
 =?utf-8?B?UWRCS2xOeG5KRmJqK3cySFlIZ09PN1F2WERzZHROb0N5MTI4RWk5WDl0eC9F?=
 =?utf-8?B?eEhjNnZqSXEwSHoxSlZ3dk5yMWdxa0ZUKy9ZY010alAwR3JsWUdnZnNKTHZa?=
 =?utf-8?B?UUx6WVEvdSsrMm9sZUd2WVRLby9xbEFVUng4ZmgvUnVWZldheVdrWWYrWWJj?=
 =?utf-8?B?UWQwZGpEajhJbThmdnEvNkY1V05KeUU5eFRBUnptME40RDlnM09zNitydWdR?=
 =?utf-8?B?REZ1b0xaM3E1Z1hsTmNLNVYyWWFWUGJ5S1ZCSGs3dUxERUhMYVNnY3M3V0NY?=
 =?utf-8?B?MzU4anlUQVJWU2EyMHp6UURWMFFOTXc1RUV3dnRxWWdEODNtaUhFUFZQMjdK?=
 =?utf-8?B?cGQ5U1B3VnNDMDRKMCtranBhbWh6aFRQUmVMYmpody9Sd3RDZExsNmlyMUJ4?=
 =?utf-8?B?WnI5SlEycTNOZEs2Rm5Pcm9QQkxBVWZ5MWh2TVIxNCsvU1gvdGcxc3Zja0tj?=
 =?utf-8?B?aW1RTlFCcnV0Z3N4TUMvV0lYbHFwZk1rOXdFaGQyalFoMjJkdWVRaTdKSVdX?=
 =?utf-8?B?Qnk4NzJRSHJGYmZaRTRFN1JOaXVxOFhaU2MzUGQrUnNNTFkyd0tNb0VVVjVv?=
 =?utf-8?B?R3RLdUsrb3JLY2pvQXZlUFJlVk5QQ1NKS0FkQldEd3gzNlVmaUFoZyt0Ky9U?=
 =?utf-8?B?WTFJQWtaMmhHbHVMandJc2ZlYmgyRXpobzUrM2lybkdOdDBmNUNSWEo1S3Fv?=
 =?utf-8?B?aFNyRkFmNmpoVWlheEVwS1RXNXg0Z05yai9QR0djTGpQQ0huUEFvVzVRL3pL?=
 =?utf-8?B?dlNnWWRRWEhNTDkzc0JvWW5kSmZqaXNqWEJJYk5CdmRnZzZzV0toOFZ5VXJ4?=
 =?utf-8?B?ai9ac0VMcnRZSHM1dzJDYTRKV2Fhb0Z2NHZ4ZXo1ejJINk1aVitIV3BKNFdW?=
 =?utf-8?B?VHdEWjBFMWg4YkFyeExPNzBqSU90TUZEMnoyTVd6ZjkrNktNOWMxR2ZPRFl0?=
 =?utf-8?B?bk0rbTI3ZEJaNm4xNFVJbjF2WTNYOFlCN1pwRGJyNWZMQWNhcWt5aHdaVEhV?=
 =?utf-8?B?Mlhsc29xZWkvWEUveHZ5SkNYNDl0QUl1ajhnd2I5UHcvZndoWVo3eDdMQ0pn?=
 =?utf-8?B?cUdxS2VFY3Q3Qm0zN1JiNUI5N2VtNjZLWWRFM2pEUzZDbmZvUUNWdXVVSlhI?=
 =?utf-8?B?MGRWejQ0bXh4K21NUG5oazY1NlkyMkZBUjBUYk1MU21ZWG51TllnbFN5K2d6?=
 =?utf-8?B?VWZkVktOd21oNTk0NldTNGs3b2N6OTA4V0dTRWhuRzRDWUpPL3c5WERkTUVR?=
 =?utf-8?B?ekRqRjg3cXJycE5KVk5nQjJVNUo0WnpGczkzZWUrTVRyUFBKVmNocU04ZE1Q?=
 =?utf-8?B?WGVQcXc4ZHZTa21UY2ZVWnJiVWFTdWM5Z2N0UWxpZm9YVW1kaWZyQW55OHJq?=
 =?utf-8?B?Sk15VERwNnVIZUlES25wejJwaVYzNXVQRVRWSkxVQ1lMY3pnbityUW1CTUJz?=
 =?utf-8?B?UmNDRXJ0TVpkeVdpTDh4K0MzZnZNUkNFT1pGTURhMGdTMDYzWEE1c0tZRVFw?=
 =?utf-8?Q?pkg60jEfq/HiKNQorn22XBDXp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f030e790-ef12-4d04-f1b4-08de0b91354c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 02:19:02.8228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DEdeOG2DTftt0WexVSDeBZ6dS7RHj5suHDaRF5amjpPuuBbJNYtt0/PduRBSeYsUos/aVRhN8SBl/QJ3jp2MGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9444
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Udit Kumar <u-kumar1@ti.com>, Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Andrew Davis <afd@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
 Judith Mendez <jm@ti.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ryan Eatmon <reatmon@ti.com>, Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH v2 10/10] imx93: Enable remoteproc for
	i.MX93-EVK/QSB/FRDM
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

Select configs to enable remoteproc for i.MX93-EVK/QSB/FRDM

Reviewed-by: Ye Li <ye.li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm/mach-imx/imx9/Kconfig | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/mach-imx/imx9/Kconfig b/arch/arm/mach-imx/imx9/Kconfig
index 48f458fa55c0938b0219648541314b1655ffc980..7fd408815e3b62665f8cd7a0456d137385dfa444 100644
--- a/arch/arm/mach-imx/imx9/Kconfig
+++ b/arch/arm/mach-imx/imx9/Kconfig
@@ -69,6 +69,10 @@ config TARGET_IMX93_9X9_QSB
 	imply OF_UPSTREAM
 	imply BOOTSTD_FULL
 	imply BOOTSTD_BOOTCOMMAND
+	select CMD_REMOTEPROC
+	select REMOTEPROC_IMX
+	select REGMAP
+	select SYSCON
 
 config TARGET_IMX93_11X11_EVK
 	bool "imx93_11x11_evk"
@@ -77,6 +81,10 @@ config TARGET_IMX93_11X11_EVK
 	imply OF_UPSTREAM
 	imply BOOTSTD_FULL
 	imply BOOTSTD_BOOTCOMMAND
+	select CMD_REMOTEPROC
+	select REMOTEPROC_IMX
+	select REGMAP
+	select SYSCON
 
 config TARGET_IMX93_FRDM
 	bool "imx93_frdm"
@@ -85,6 +93,10 @@ config TARGET_IMX93_FRDM
 	select IMX9_LPDDR4X
 	imply BOOTSTD_FULL
 	imply BOOTSTD_BOOTCOMMAND
+	select CMD_REMOTEPROC
+	select REMOTEPROC_IMX
+	select REGMAP
+	select SYSCON
 
 config TARGET_IMX93_VAR_SOM
 	bool "imx93_var_som"

-- 
2.35.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
