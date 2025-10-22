Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7DBBF9853
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Oct 2025 02:49:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFE1DC5E2C3;
	Wed, 22 Oct 2025 00:49:06 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010048.outbound.protection.outlook.com [52.101.69.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4E73C5E2C1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Oct 2025 00:49:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dku5YWIZ9nNn2xBeUPLLY5hLbX59AZphbocNJbvE5EjkmgviHmo/IdfYk3XDGRZIuSYROElI9hDUPzXMzL/xNgKAMJoz6nqphKCRCxLp61eeZDXvvlkkb0ETwGYBS4S+lAsALFhc9ckWTv6QW2Dd/D5ZK5Sjq+bfzqgdQyWPpw2cvrebHBS1WDNA+rpguuvT6xjUdFaYT9urJDDVmsPKJDq0/dKAQCiYz5v6UOXsOmr8ylP5mhld+1uafXW6TR4/F2RRR8lEQwkK3BC7kVvrCjPQ0b4pl+nJGWwqJ/X8V9oDE7tj+DogljpxpoaY2DCBnTmCPn/Ww1yxnI7ZO/rc+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNIPXgzKrzmJZv/q5M4OGke+cck+tRDkO6AUz5nBFM4=;
 b=fQ+4RZ4UcLx5hcK75BthBavpKDLa5nxLVdLXb52cvKk8EiahqMMrXiOlw+bYtECSSaH2rNHFbbapaZVWosjLsx4MRdT6N71wJyBtsQp/O0HLZ0So8BaFo5ro8VEIuoyXWhsZZZr63TCFB4UAR+1LblwHQ5fYZyou4LqkmIAl8ylaeSbyWBiPjwBmUfsY50pm2EIQqehu5yArnLQMEp56YKMwuIg0KwUVPPdSxmYFmKqE9bJDgdeklOZMEiSDD8FRTWDEkugKUB/hWnnAjr2KnEj4rYWfvqsWjnCP6AfOIVEr4LdOFbGrcmfbMdCmCbtT5dwoj2ZKNEErmIBB3sLGrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VNIPXgzKrzmJZv/q5M4OGke+cck+tRDkO6AUz5nBFM4=;
 b=FYCGLEQporBa+RgSoAhM7Eu2zUStJNz45V0iSk75Mrxcb814iKmKDqcdE5MrLLlfFlVF29q7Bbla9dqT5fHfpndJNCbVBvFOM6zRLb1UNFZB9E3fZRiP4JF2fYL4X5G9gDI1bvieEVZT9txxkBiVXKpIZolb+nTgMnUeTDtGkORrqqOEwwkMi1xd+hT1fw5LrqSfPGeA0dBBPoCYEu9D7/W4UbgeJIfv24f4ClZYJaM2Nkq7sdKrn+r46GyKJNyQhSrhLsnLyGEXiHjNBoMDmcGdXd+IYlj6HnLbOZgWd9PJ2iBLvh0GMy9QkGQLITXVtqP9vMzaIPFNrwOXgKG76w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBBPR04MB8027.eurprd04.prod.outlook.com (2603:10a6:10:1e6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 00:49:03 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.016; Wed, 22 Oct 2025
 00:49:03 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Wed, 22 Oct 2025 08:48:28 +0800
Message-Id: <20251022-imx-rproc-v3-v3-2-92273a82c5da@nxp.com>
References: <20251022-imx-rproc-v3-v3-0-92273a82c5da@nxp.com>
In-Reply-To: <20251022-imx-rproc-v3-v3-0-92273a82c5da@nxp.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Stefano Babic <sbabic@nabladev.com>, Fabio Estevam <festevam@gmail.com>, 
 Tom Rini <trini@konsulko.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761094123; l=10463;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=pvtqMij5qHJ9dYoIIlecuUqfZvOSMHzpk4+qYPUZmxQ=;
 b=u/FZJW/aC1pB/kS9k79fgAVcZ4/6F9Zyv8iE7hYpnqFJqoqnyinmrEHyeeabD3hdPsmSvi7k3
 bkt9byLKd+2Ar5yI7LRqqwyVe+e7OUZkBCqGvQ5G9WlCQTY2sKWe0j2
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR02CA0075.apcprd02.prod.outlook.com
 (2603:1096:4:90::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DBBPR04MB8027:EE_
X-MS-Office365-Filtering-Correlation-Id: e9347606-2e87-4f95-b076-08de1104cbf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZDVHQVYvSVVsc0VUS01PTjdYMldONldQWXhkMThSMVRxM1lFSjJVMnJKN2Np?=
 =?utf-8?B?NVNUMVdiSmlHQ2RUaW01UGE4TE8xU2tVdVUrVjFNSGhOU1ZKUmFVYS9McDBl?=
 =?utf-8?B?SmpFZ1o4N01xQ3RndDFQMGJNTlV3ZmM1RVFKeGhMQUlROXFPWVJ1Y0NVUWNK?=
 =?utf-8?B?WVVkZDAzUkRQSnc4d21XQjJXUm5NMVBXU3ZWd2wxSGo4SWxNNEMvRXhqbm5Q?=
 =?utf-8?B?dGR2SFg0SWMzMGYxUmtnMkF4MndmaHg1NkVKNm5sUWx3WWdhcXp1RkJCTEYv?=
 =?utf-8?B?Y1FOLy9ta3I4aEdnMEZJRU5iaG0vOGpyNUx0UTZNdjg2NmpwVlVvZkRlMTM3?=
 =?utf-8?B?TEZ2amttdDJjQk5lVVF2NnlWVFlZbzU5RWFSZ29LYVhETzBCcDBEWWtjMDh5?=
 =?utf-8?B?bWV0SmVUT2IvRElYNmdrVjdBa05KSW9kY01hOHFGRkZwVitaNHlsQkFyQmd5?=
 =?utf-8?B?UUNHT01ZUnY2SW9OaTZKQVl6a0x5bnlkSEwvSmcxcmVCa2EvVzVaWHFiSFY3?=
 =?utf-8?B?dHBtTlpkMXhwa3dIdnZ2TkkwQUpJRFVFcXFja2tua0dhUkxSeGRTNDhjSmFB?=
 =?utf-8?B?RzJUV3c1d252c2RvaDUzdEFFcHZUeXJPWEl2Rm41QUh4eDJHUFpvUTdCbDFR?=
 =?utf-8?B?SnZlWE8rTEp5bW8rM2ZCTXVXaEgxSHpkWkFhSy9GM3VoTlJ3M2loUzJScys5?=
 =?utf-8?B?ajBKYVNWRk5FcjJvMjBEM3JJYUJ4MGhxRi84UWhpeFFnUUxmY1haL3VRVEdV?=
 =?utf-8?B?eHhhWjMvd081NkFLMGpoL2EybGZqcUNwK2hSVVVGMWU3ZDJLWjhLMmNIVzNn?=
 =?utf-8?B?RmQ1cVhoVDhSc3Vrc0c1dDAxYU1TbmJGd2k5M0NseVhLQUZpaVRoWlRxOEUz?=
 =?utf-8?B?MGp6cERWMXdlQ29oVytyVzVudVBDeFMzWDRaZFkzdi9IcGd0OWl5bTNCVDBZ?=
 =?utf-8?B?MFBhb3J4bFZpdzZPM1l6K3hzc2lvcXA3cXR2UVpNZmVoUEp2OFhXem1iZlBE?=
 =?utf-8?B?ZHI5K0dlUXMwNExleEV1VFR0L21tdmg1VjhTdW9YZDYrWGpHdHVka1E1Vjdi?=
 =?utf-8?B?djBaM1F5VXB4UkhkaytWWFVrdmtyOHpHQVFRY2lpejN1ZlcvNmxHWS9pb0Yy?=
 =?utf-8?B?Rml0dWNOb3J3dGQzZWc4cDRZci9iRFJ4RWowQlBvalNlMTJsaUMyeWp5WFhy?=
 =?utf-8?B?enA3anZaTlFHTlhRNnRJZkJCUVRsMXpxNkJEeEFzbyt0N2VHMFN0cHRxeVNr?=
 =?utf-8?B?ckhsajIreGs1bUgvcUxObWV6UmV5ckpSSkZMU3pZWVN2dGovMjdiYnNMQVg3?=
 =?utf-8?B?TW0zblkxWm1yWUMyVGozK0I2azBYQmJ1SkluejB5amtHN1NPa1pWUFhlSjVm?=
 =?utf-8?B?UERUbnRRdHpwZGt6MHZzaFczNTlOeGtEUHlLMWJDb0ZDZWQrb29makNlaUo5?=
 =?utf-8?B?SkN1d1RjMlFUeS9CVjhkLzBsQ3c4SVF2UVVRWTVNUzhCM2E4ZlEzOXJaNVkr?=
 =?utf-8?B?OVdPN3FFZGs1bUl6dFB4ODF0M2RVN0JVZVRGakpIcDB6OTBsNlFlZ3EzYlpn?=
 =?utf-8?B?bjZwT3NjUjVUWE5LZHNVbGpsa2dyTzMydkd4endOajd1RlJ3SGIyZ0RNN3JG?=
 =?utf-8?B?bHo5RXdyQXBJdHAxSjZyTy85dE5CSFpzY0t4bGVBb25TRU5wa0ZyRWgybGhH?=
 =?utf-8?B?WjBodGU1aFpldy9GQnphL2dQZHA0bEdVTVFheUxEY3A4b3V2RVZ6UkRFb3d3?=
 =?utf-8?B?dzZBcGM4aFhTeSsrbktQL1phWTh1YVNKMmdpTVI1SE1ZM3dETHJnS0N5QWJ4?=
 =?utf-8?B?K21ld1NjWTdOYi8xQ2s4RmNYTGtUanhHWjJWSUR6Skh3L2c0YXZQTzd3UzA5?=
 =?utf-8?B?bzN6NHNqVzJOTFF0NFJ4K1MvQlNwYnRoa2NOTnB6K0lTbkkzUmNHcmNCRnRF?=
 =?utf-8?B?ckhuOHkxTkFmYTBUSGlOWnFKOFZtVGVNdlhUMWdMb2NsU1FtbEVMdzJ0NGtM?=
 =?utf-8?B?eWxyYS9HMWQvQjBpTHNhbXpsZ0xLQXlZdVZXSTRUdExRSGZiWlpGWHlCUVhD?=
 =?utf-8?Q?8CyiRV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmozRllEV1BwRTF2Y3dqNWMrd1Y5ZEM0Mk8yR0VoWjRtSlFHVHJyMTg3dFVz?=
 =?utf-8?B?L0J2OER0dWtBVVkxbG5FdHhRSHRXd1V6RnB0a0pxbjhkVXZxb1M4eGdoTXdS?=
 =?utf-8?B?WVBKbVpoRHY5UWVUYUU2OEs1VElRcW5LQ3NQdHRqakdXcnBqb1NvdTgvVXVJ?=
 =?utf-8?B?NzlKbU5FdkYyODNHT3UrRmRFM1N0SVg3RkFHcVlkWGZsV0RINmFoV0ptektJ?=
 =?utf-8?B?UzQxOFZCMGtHdTlWMytUMnV5cTZha0pYZUtoZlBFOWdBNnRLN01iSStEYWJ5?=
 =?utf-8?B?Nkt0Z1A3YTkvTHVlVGxVQXdGbWVrRjhmcXZjOWpFZmtEOEpyM0oxeUVvVklO?=
 =?utf-8?B?MHhmRnd1R3NCK0xhT3lsVEJ3czJXL1ZTS0tMMDZMSXJyUHUyWDV5bVdxTXpY?=
 =?utf-8?B?RFA2Y00xV1g2cVBYeWdFeGZPaWFwZlRTWWVMZlhlUlpoUHQzS3FoK2pDbTln?=
 =?utf-8?B?VUNBRkd0dHh5b0RkQ04wQms0TXJodUtaNWM0WFVtS2p1cGFtZzB2MkVENkpQ?=
 =?utf-8?B?M2g4SDQ3MG5pMmVtci95dlV2YmRBY1ltRkxtR04yUjdlR0RnZjZOcVVhMlUr?=
 =?utf-8?B?WVdoL0tRdklBUkQ4VjZZajZYaUdZdmRDZjlxaTlpTi8vemNjOFB0clo4YjE5?=
 =?utf-8?B?YU5PU3lTRUNEZW1ZelFTTjNoMW43MDM3U2RzSVY1R0w3M1RONzNlTzhSY0Yx?=
 =?utf-8?B?cmdOZ1AvNElUbkNmbTd6QUZ5SHR4eVBHc2JaNVQvWUxFc1VnMG9iUWVhcWVC?=
 =?utf-8?B?STl4eXFQRmMrTjZoNGxLVkVQRVl2K3Vhb2dDUGJWR2NQZTgvYUNaZzVkbDJJ?=
 =?utf-8?B?QXphZlNIeG9DeXFjck5MZkpYMEgvR0VGR2cxUUZyQ045Zjd2Q0VtcnRTbW13?=
 =?utf-8?B?MFpzQWRZWVhIeDc3a2ZnQ3lnb05SMXFtVXFOclhXMGVxOWdxTVF4K3hNOU5W?=
 =?utf-8?B?c3hTcWcyaHZtV2JPSGVRWEpnV0dBa0lGTnN1T3QxQUxUM05UK2FQenFaYnAy?=
 =?utf-8?B?VjkvRFh1Wmp1ak1GVTZ6OVlHUm81NlBpMitRQS9vWkVJOFpxZXZMYnR2aXdx?=
 =?utf-8?B?YnRBK0Q0ejNmKzlNYWF4SWI1V2hJaE1EdTRwOExJdjI2bzdGTSs4TWNIdWlF?=
 =?utf-8?B?dG51dVBxc1VoQldaamxmK2lWMUJQN2NIRjlkbG5nVE1iOG1SV1RGTVM1UXJk?=
 =?utf-8?B?UmVBVG54WEVnTE9QUGJNVXV3ZzB5UHdSNGg4cWdGYTlwd2Q1cmhocWlxTlBz?=
 =?utf-8?B?SWM2OVFvSXZoamF1c0hZcnFhaForajZ0ZmxNRUkwbnlCaW5hM2M2NC8vUG5i?=
 =?utf-8?B?d2ZORnd2eHNwQlhSL01IeTRQbE1nM2ZvMThtMi9tUUovWFd3Mi9lYlArdXlO?=
 =?utf-8?B?Sll5ZVZuMCsvODcydi8zaU52Z1JoelBnYWVwdFZLWm5UUFNJYXNRS0dFTFBJ?=
 =?utf-8?B?RW1VaWZYVTNUdW1QK2xjQytidlYyaDJhalFWcDZoNlk4UERiUGZ4aDhWbXJP?=
 =?utf-8?B?RjFBdDBpS3ZpY3dsQUhBOUxyYnREVEIyZ0kxQ3NYZC83dWZUZ1lwZ2dvMGZD?=
 =?utf-8?B?V2w1QkFrLzNaRWgzMFYrVDJIcVF4N2psMnJiZGFSR0ZKVDFRYVpoODdYcDhW?=
 =?utf-8?B?TW5VeEYveDFJTUp4T0h1c0dUL05LZWN4ajk0UGNZQlN6YzVMTWlqOU0zVGM5?=
 =?utf-8?B?bWpQUkM5VTFyczhZdGlPc3VMbGcwdnpTSHpIYnRQNlRiYzY5WkJRdmdmMGR3?=
 =?utf-8?B?bTBJZUFxbHpNcElnUGtDOEtqc20yYlRHWU5TVy9qelp4d2MwV3lyNUZtTXQ0?=
 =?utf-8?B?ZEwvcDJ0WS9GOG5XOHN6eFRoQVdkYWJQazVjQmNUTWVIU3pPUEt4djI4RnhZ?=
 =?utf-8?B?d0NJd1IybDc3Sm4wT1NoM1VveDBNREEyelc4QTdPcUM1QmN0dUpxZFRhV2pG?=
 =?utf-8?B?Smp4eTFhWlU0azVodzgwT2lxRDg3Z3BlaW00Wmhjc3l1Q0dNR2htNmdCVjJa?=
 =?utf-8?B?NzBTbmhiM3BZZ1Y4WGVydzU4TlRvbDdwUmZTSnFmODBVVCsrbUc3UkZTT1Fk?=
 =?utf-8?B?Q1Bvc1Fad3RBdUZFV2ZwVDZZRExWWTJkYUlkcWVScmZaL1IrY1JzL2lsVUY5?=
 =?utf-8?Q?56MhO3t2S2Ii0dh5RoafD/LOe?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9347606-2e87-4f95-b076-08de1104cbf1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 00:49:03.4189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pFALlyRHkzDXk/VPPXzrO24OtQZLT9hJLXJQ9Ef6vxwO4YMzKbBhwoyzfc9w8LdcxBdWHLyTMq7R24x++TLe+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8027
Cc: Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>,
 Udit Kumar <u-kumar1@ti.com>, Alice Guo <alice.guo@nxp.com>,
 Andrew Davis <afd@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
 Judith Mendez <jm@ti.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ryan Eatmon <reatmon@ti.com>, Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH v3 02/12] remoteproc: Add imx_rproc driver to
 support NXP i.MX8MP/N
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

Support i.MX8MP/N with start/stop/device_to_virt/is_running/load
implemented. The device static configuration is mostly reused from
Linux Kernel with adapation to U-Boot dm_rproc_ops.
The booting method:
 - load mmc 2:2 0x90000000 /lib/firmware/imx8mp_m7_DDR_rpmsg_lite_str_echo_
   rtos.elf
 - rproc load 0 0x90000000 ${filesize}
 - rproc start 0

Reviewed-by: Ye Li <ye.li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 MAINTAINERS                    |   1 +
 drivers/remoteproc/Kconfig     |   7 ++
 drivers/remoteproc/Makefile    |   1 +
 drivers/remoteproc/imx_rproc.c | 233 +++++++++++++++++++++++++++++++++++++++++
 drivers/remoteproc/imx_rproc.h |  56 ++++++++++
 5 files changed, 298 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 671903605d17a78b88d83ddb7e01b78115b553e7..9070df85335919ab2db73bb0668869d64051f964 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -319,6 +319,7 @@ F:	board/freescale/common/
 F:	common/spl/spl_imx_container.c
 F:	doc/imx/
 F:	drivers/mailbox/imx-mailbox.c
+F:	drivers/remoteproc/imx*
 F:	drivers/serial/serial_mxc.c
 F:	include/imx_container.h
 
diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index e9f19a694332bf255c0144467264193873dd6384..8056f210abc895ee0e4866679090cc47cce9e7ae 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -33,6 +33,13 @@ config REMOTEPROC_ADI_SC5XX
 	  Say 'y' here to add support for loading code onto SHARC cores in
 	  an ADSP-SC5xx SoC from Analog Devices
 
+config REMOTEPROC_IMX
+	bool "Support for NXP i.MX remoteproc"
+	select REMOTEPROC
+	depends on DM && MACH_IMX && OF_CONTROL
+	help
+	  Say 'y' here to add support for i.MX remoteproc.
+
 config REMOTEPROC_RENESAS_APMU
 	bool "Support for Renesas R-Car Gen4 APMU start of CR52 processor"
 	select REMOTEPROC
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index 47bd57c7890d9b14cc53da59616ed59ea2eba47b..7ea8023c50bb8ca34cd142260a9cafa8040c5560 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_$(PHASE_)REMOTEPROC) += rproc-uclass.o rproc-elf-loader.o
 # Remote proc drivers - Please keep this list alphabetically sorted.
 obj-$(CONFIG_K3_SYSTEM_CONTROLLER) += k3_system_controller.o
 obj-$(CONFIG_REMOTEPROC_ADI_SC5XX) += adi_sc5xx_rproc.o
+obj-$(CONFIG_REMOTEPROC_IMX) += imx_rproc.o
 obj-$(CONFIG_REMOTEPROC_RENESAS_APMU) += renesas_apmu.o
 obj-$(CONFIG_REMOTEPROC_SANDBOX) += sandbox_testproc.o
 obj-$(CONFIG_REMOTEPROC_STM32_COPRO) += stm32_copro.o
diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
new file mode 100644
index 0000000000000000000000000000000000000000..1b2ef5005e3a2f2cc1254e953b0bcb7a58063f5a
--- /dev/null
+++ b/drivers/remoteproc/imx_rproc.c
@@ -0,0 +1,233 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <asm/io.h>
+#include <dm.h>
+#include <errno.h>
+#include <dm/device_compat.h>
+#include <linux/arm-smccc.h>
+#include <linux/types.h>
+#include <remoteproc.h>
+
+#include "imx_rproc.h"
+
+#define IMX_RPROC_MEM_MAX		32
+
+#define IMX_SIP_RPROC			0xC2000005
+#define IMX_SIP_RPROC_START		0x00
+#define IMX_SIP_RPROC_STARTED		0x01
+#define IMX_SIP_RPROC_STOP		0x02
+
+struct imx_rproc {
+	const struct imx_rproc_dcfg	*dcfg;
+};
+
+/* att flags: lower 16 bits specifying core, higher 16 bits for flags  */
+/* M4 own area. Can be mapped at probe */
+#define ATT_OWN         BIT(31)
+#define ATT_IOMEM       BIT(30)
+
+static int imx_rproc_arm_smc_start(struct udevice *dev)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_START, 0, 0, 0, 0, 0, 0, &res);
+
+	return res.a0;
+}
+
+static int imx_rproc_start(struct udevice *dev)
+{
+	struct imx_rproc *priv = dev_get_priv(dev);
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	int ret;
+
+	if (!dcfg->ops || !dcfg->ops->start)
+		return -EOPNOTSUPP;
+
+	ret = dcfg->ops->start(dev);
+	if (ret)
+		dev_err(dev, "Failed to enable remote core!\n");
+
+	return ret;
+}
+
+static int imx_rproc_arm_smc_stop(struct udevice *dev)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_STOP, 0, 0, 0, 0, 0, 0, &res);
+	if (res.a1)
+		dev_info(dev, "Not in wfi, force stopped\n");
+
+	return res.a0;
+}
+
+static int imx_rproc_stop(struct udevice *dev)
+{
+	struct imx_rproc *priv = dev_get_priv(dev);
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	int ret;
+
+	if (!dcfg->ops || !dcfg->ops->stop)
+		return -EOPNOTSUPP;
+
+	ret = dcfg->ops->stop(dev);
+	if (ret)
+		dev_err(dev, "Failed to stop remote core\n");
+
+	return ret;
+}
+
+static int imx_rproc_arm_smc_is_running(struct udevice *dev)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_STARTED, 0, 0, 0, 0, 0, 0, &res);
+	if (res.a0)
+		return 0;
+
+	return 1;
+}
+
+static int imx_rproc_is_running(struct udevice *dev)
+{
+	struct imx_rproc *priv = dev_get_priv(dev);
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+
+	if (!dcfg->ops || !dcfg->ops->is_running)
+		return 0;
+
+	return dcfg->ops->is_running(dev);
+}
+
+static int imx_rproc_init(struct udevice *dev)
+{
+	return 0;
+}
+
+static int imx_rproc_da_to_sys(struct udevice *dev, u64 da, size_t len, u64 *sys, bool *is_iomem)
+{
+	struct imx_rproc *priv = dev_get_priv(dev);
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	int i;
+
+	/* parse address translation table */
+	for (i = 0; i < dcfg->att_size; i++) {
+		const struct imx_rproc_att *att = &dcfg->att[i];
+
+		if (da >= att->da && da + len < att->da + att->size) {
+			unsigned int offset = da - att->da;
+
+			*sys = att->sa + offset;
+
+			if (is_iomem)
+				*is_iomem = att->flags & ATT_IOMEM;
+
+			return 0;
+		}
+	}
+
+	dev_err(dev, "Translation failed: da = 0x%llx len = 0x%zx\n", da, len);
+
+	return -ENOENT;
+}
+
+static void *imx_rproc_device_to_virt(struct udevice *dev, ulong da, ulong size, bool *is_iomem)
+{
+	u64 sys;
+
+	if (imx_rproc_da_to_sys(dev, da, size, &sys, is_iomem))
+		return NULL;
+
+	dev_dbg(dev, "da = 0x%lx len = 0x%lx sys = 0x%llx\n", da, size, sys);
+
+	return phys_to_virt(sys);
+}
+
+static int imx_rproc_load(struct udevice *dev, ulong addr, ulong size)
+{
+	return rproc_elf_load_image(dev, addr, size);
+}
+
+static const struct dm_rproc_ops imx_rproc_ops = {
+	.init = imx_rproc_init,
+	.start = imx_rproc_start,
+	.stop = imx_rproc_stop,
+	.load = imx_rproc_load,
+	.device_to_virt = imx_rproc_device_to_virt,
+	.is_running = imx_rproc_is_running,
+};
+
+static int imx_rproc_probe(struct udevice *dev)
+{
+	struct imx_rproc *priv = dev_get_priv(dev);
+	struct imx_rproc_dcfg *dcfg = (struct imx_rproc_dcfg *)dev_get_driver_data(dev);
+	ofnode node;
+
+	node = dev_ofnode(dev);
+
+	priv->dcfg = dcfg;
+
+	return 0;
+}
+
+static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
+	/* dev addr , sys addr  , size	    , flags */
+	/* ITCM   */
+	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN | ATT_IOMEM },
+	/* OCRAM_S */
+	{ 0x00180000, 0x00180000, 0x00009000, 0 },
+	/* OCRAM */
+	{ 0x00900000, 0x00900000, 0x00020000, 0 },
+	/* OCRAM */
+	{ 0x00920000, 0x00920000, 0x00020000, 0 },
+	/* OCRAM */
+	{ 0x00940000, 0x00940000, 0x00050000, 0 },
+	/* QSPI Code - alias */
+	{ 0x08000000, 0x08000000, 0x08000000, 0 },
+	/* DDR (Code) - alias */
+	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
+	/* DTCM */
+	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN | ATT_IOMEM },
+	/* OCRAM_S - alias */
+	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
+	/* OCRAM */
+	{ 0x20200000, 0x00900000, 0x00020000, ATT_OWN },
+	/* OCRAM */
+	{ 0x20220000, 0x00920000, 0x00020000, ATT_OWN },
+	/* OCRAM */
+	{ 0x20240000, 0x00940000, 0x00040000, ATT_OWN },
+	/* DDR (Data) */
+	{ 0x40000000, 0x40000000, 0x80000000, 0 },
+};
+
+static const struct imx_rproc_plat_ops imx_rproc_ops_arm_smc = {
+	.start		= imx_rproc_arm_smc_start,
+	.stop		= imx_rproc_arm_smc_stop,
+	.is_running	= imx_rproc_arm_smc_is_running,
+};
+
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
+	.att		= imx_rproc_att_imx8mn,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
+	.method		= IMX_RPROC_SMC,
+	.ops		= &imx_rproc_ops_arm_smc,
+};
+
+static const struct udevice_id imx_rproc_ids[] = {
+	{ .compatible = "fsl,imx8mn-cm7", .data = (ulong)&imx_rproc_cfg_imx8mn, },
+	{ .compatible = "fsl,imx8mp-cm7", .data = (ulong)&imx_rproc_cfg_imx8mn, },
+	{}
+};
+
+U_BOOT_DRIVER(imx_rproc) = {
+	.name = "imx_rproc",
+	.of_match = imx_rproc_ids,
+	.id = UCLASS_REMOTEPROC,
+	.ops = &imx_rproc_ops,
+	.probe = imx_rproc_probe,
+	.priv_auto = sizeof(struct imx_rproc),
+};
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
new file mode 100644
index 0000000000000000000000000000000000000000..7a82dc4a195b44cd4b2d5ce5767c2688dde69ac7
--- /dev/null
+++ b/drivers/remoteproc/imx_rproc.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2017 Pengutronix, Oleksij Rempel <kernel@pengutronix.de>
+ * Copyright 2021 NXP
+ */
+
+#ifndef _IMX_RPROC_H
+#define _IMX_RPROC_H
+
+/* address translation table */
+struct imx_rproc_att {
+	u32 da;	/* device address (From Cortex M4 view)*/
+	u32 sa;	/* system bus address */
+	u32 size; /* size of reg range */
+	int flags;
+};
+
+/* Remote core start/stop method */
+enum imx_rproc_method {
+	IMX_RPROC_NONE,
+	/* Through syscon regmap */
+	IMX_RPROC_MMIO,
+	/* Through ARM SMCCC */
+	IMX_RPROC_SMC,
+	/* Through System Control Unit API */
+	IMX_RPROC_SCU_API,
+	/* Through Reset Controller API */
+	IMX_RPROC_RESET_CONTROLLER,
+	/* Through System Manager */
+	IMX_RPROC_SM,
+};
+
+/* dcfg flags */
+#define IMX_RPROC_NEED_SYSTEM_OFF	BIT(0)
+
+struct imx_rproc_plat_ops {
+	int (*start)(struct udevice *dev);
+	int (*stop)(struct udevice *dev);
+	int (*is_running)(struct udevice *dev);
+};
+
+struct imx_rproc_dcfg {
+	u32				src_reg;
+	u32				src_mask;
+	u32				src_start;
+	u32				src_stop;
+	u32				gpr_reg;
+	u32				gpr_wait;
+	const struct imx_rproc_att	*att;
+	size_t				att_size;
+	enum imx_rproc_method		method;
+	u32				flags;
+	const struct imx_rproc_plat_ops	*ops;
+};
+
+#endif /* _IMX_RPROC_H */

-- 
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
