Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B290C3069C
	for <lists+uboot-stm32@lfdr.de>; Tue, 04 Nov 2025 11:06:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D941DC62ED5;
	Tue,  4 Nov 2025 10:06:23 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012049.outbound.protection.outlook.com [52.101.66.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54C41C030AF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 10:06:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nmURBFgbgr6S22nfQEPkrvhzohpvKj6z/QnWDtSm8rvoP41j2lpOhVF3ynvxlLL2aBOWVnK0BYT/tn6Dq4Hunwz2BV0EJpF0hAMyfPyVhkjrxlrSPn/snVSQcI+LiVoFU3UKzIg/O3PheCcS8g47TuWYfHOgSTmBUeBps2urtraT5EdUfa1j8jzE/oLfZyuRvoNCx9NVXZPrziIE4XzxPkse+M38Leey9ikU/n2Do4HMwOhtHTY+cf2T0DeDVaVsJsqPWXHlfacPRoYme6L7Cy2VOaIT7hFkNMqdCXcPmJ9gm6Iuw9tgWjq1OcBq/SwjK8OjBLZDp56H5Eeaktoxnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLtXibpNx0V2A21AHKAhXP3EkWia1J0VVSpEO8vD/0c=;
 b=dMpLRdN2Ltb1vLpNU9ASdhiEy4krGWX8hsUDcRtDIQo/w2lWzwMdHPdpBmbowVYKriU0Avx7NUfLHgJQkwfsMo95RrLCJSzeAAn7pSVn4PyPYJrSiQhAa2nieBhf6wKkiTdCsybTL1dD93ikPNjeJDCVTrtNPgk12MCRhlyLrO/fuZNtoFddTal9q5BkdjcBhRJ/jASp0zOMGS4/IC5SpCkXoc+XCNyoDewYLMMrqzZGTSwhxj+d7H24bfx6ktMUdiy1ZO/6ZXEe/An+iLyeZiENG28nwR5lLJHuWVQTsJZJJXbVhD0t7oYQ3NTbnlAph1yiI9ii53J4lye5se3efA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLtXibpNx0V2A21AHKAhXP3EkWia1J0VVSpEO8vD/0c=;
 b=DrvwxJFbGwA5NQrWqArEV7eKgiEMDu1VWXU5BJn04nDf6y3mX6XkNO09GgNMqBNAL2OkmOambG9q9qMm7kXFJLRxPADCT8bpvF1mxkj1FJ6DgfSRHAq4ifcvjQl4g78bpf2b/WVInnNiSLpQk/uIyjln2Jpkw7uaL1TzR2mHkTb/WsLWZ7hbLlCucNX6+a1Ovg6d7yJdWIfyBiQq3HZMInvdqvAR7cjhkfwbs9c2HNY2MJXhgbuK7v7NgMfHzT/ke8/cWWFH9hy9OBJFuaTcQK/wKBNgD9E9SRb9UP4s7+ZpCE4EKzy4VRtSFAGX7Cr3PPXDSt4UUhzsim8wXiXlNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS5PR04MB9969.eurprd04.prod.outlook.com (2603:10a6:20b:67c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 10:06:20 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.006; Tue, 4 Nov 2025
 10:06:20 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Tue, 04 Nov 2025 18:05:50 +0800
Message-Id: <20251104-imx-rproc-v4-v4-1-8bbc7b886737@nxp.com>
References: <20251104-imx-rproc-v4-v4-0-8bbc7b886737@nxp.com>
In-Reply-To: <20251104-imx-rproc-v4-v4-0-8bbc7b886737@nxp.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Stefano Babic <sbabic@nabladev.com>, Fabio Estevam <festevam@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762250765; l=12181;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=iONshCQZOduFE6mT9fhgYhb3LsEal0iitw7nV0hqbzI=;
 b=bUxfFY2f4YOxNXmiAcV/9XH4/IHS6SgCduc4XXY/eUlmiScJ6oiACoXSz7gzeTWcGpYQtZdoF
 1RSOnH5GtRNCKDXXxl2PW+b+IDS1QpXjUYi0+fnQ4PZdI7Drb54jcvo
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS5PR04MB9969:EE_
X-MS-Office365-Filtering-Correlation-Id: bdc17517-b074-49a1-b927-08de1b89cd76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|7416014|376014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGtrb2ZubTZTR053UHcwRU1GMnRBek1ja3ovajA2QTArZVhmMzREUmYxVlkv?=
 =?utf-8?B?Y2tDL3BiUHRuaWJsT21Sd2ZKYWt6Nis0VzRSSEdmbG5sWklQN3ZwSGZUbjVs?=
 =?utf-8?B?ZjdDVzdneVNwdUJaM0c4aGRGOHRSSUI0SzJJSDVrUWFHcEt0eWt3S0xvVW56?=
 =?utf-8?B?MW9mSWswNVRHeklnb2I1L29lWXhiSmIvN3A5UTVCQndnSlZ5OGltSmNuS2Ur?=
 =?utf-8?B?ZXQ1em1qY3cxWlVwV0VqQWMyZXVJRUVpWUFUTmZBSHZFQTdlZm5zUEN5dUNY?=
 =?utf-8?B?ZWxSSnQ5d21sd05qSm1EWVRJRnMrb3FtYlRjSWpCbHFXVDVqZGJWY3ZiVjVu?=
 =?utf-8?B?T01xaHBkNjhyZUZ6WjUrcWdDUHNJNytRNVFRbzZkcXE5UHFhYUxOOWhzaysv?=
 =?utf-8?B?dVFKQWtYSlR1elorMUNKMXdNTXQvNEFIM0ZGY2JPQnVnV1VjK3N5Qmw3dERk?=
 =?utf-8?B?aFdZZ2xJa1lkM05sQWtPOXUxQmRwOTRQSzdPWmNvS0ovSkJFMzFISi9wR2RX?=
 =?utf-8?B?M2tpZGpYUWVrZ3lXcGtuUm5GeDl4SXJReDV6VVdoTzUzZTNqdXNYRTI0VnZm?=
 =?utf-8?B?OVYyWVpoQjlKNDAvbldiSDBrcjhLbXk0cXVReG9heHB4eFFZOXl2U2pZUW5h?=
 =?utf-8?B?RnhhZ1o3QjVUV2NxdDdkT3RiaXAxaklxNFNLNXlaeHVHclVOZG8ydmtJMUJJ?=
 =?utf-8?B?S1ZRbkxGTno4OW5oRnE4S20rdXd4QW9HWVBqSzU3YlF6YitUU2NzSkdYNmZy?=
 =?utf-8?B?NmxVYlpTbHR2S1E3ODVSR3d0SXpBMW1tVGdkUzlKRG13RGIvY0p6MkZRejZn?=
 =?utf-8?B?bHF1V1BHZzEzRjJXUktaMnVmc2JKNWFzVnVMK1dHWFBzUGpwcDVVMzZnVGg4?=
 =?utf-8?B?VmFCZldZc3FDRlU2YjJQK2Vrd01LNEtYZXRTQ0laZ3YyTUZCcUx4Z3ZHWEF4?=
 =?utf-8?B?TmkxM3BFM0dMREp3b2I1TUNRcFNuNUR2cXlERlFKa00ycWJKaXM1TmpFTmhk?=
 =?utf-8?B?enF5aU9BUWZHOVdub2g0QllmSlVLZDhXUmg5N3Q5QjVQZ0sybHVZbWpNRDVT?=
 =?utf-8?B?KzZ6ZThmdkdJNWhYVXhQWHJUN3QvUFM3QVlMNzN2TlRTRk5XelNsbE42K21h?=
 =?utf-8?B?TVcraWloZ09oRWhBV1JrUkpyNzZDTHBaeXpGNG5ySlM1aW1SQVlIeDRlR05l?=
 =?utf-8?B?ckIvUkRpY1RlSC9tYjArcmR6ckZJcE5XTGNMSE5ZbEQ4cU9helN1NUlmTlpN?=
 =?utf-8?B?OHkrT1UyRW1STXBKRkRqL0Y4MS9raTBzbjFxQkU2alNaV0N6L3RiM2FRcDcv?=
 =?utf-8?B?cG9ZanljYXZNRGg5ZS80b2FTSWFGUUZlRzFsajM3d1liN3IremFTTWpWWEVy?=
 =?utf-8?B?VExVejdHOXpKZkhrcWpTYit1VmliNXNtS3VnMi9hSnhxa2JrbVl3WjM2T00v?=
 =?utf-8?B?K0V0WFRFbUdoRkdXaS9scngwV1kwaGVHYThjdm5WUzdXcUhFZ3I5NVBXSXA0?=
 =?utf-8?B?SkpZbmViUmpuemxmNWY1cjltZGFTTHRneXdsWmJmK01oWUlqSXFRcjlTNkRT?=
 =?utf-8?B?NE1haUNjUVZPSEE3ZVUzL2lyU2pCZEU3bUNueWROZnBBak44NzFhRmtEZlNI?=
 =?utf-8?B?bmU2QTZoZjZCakVGWU5Ha2ZjRE9wMTdzc08zb1AxZnBsaCtuOW5qSk4xbE9T?=
 =?utf-8?B?TVMybFpadThCMlk3MlFSOGYwQ2Zxa0JIZXYzejN3WDB2WWJLRFAwWnpxd2xR?=
 =?utf-8?B?VnBzbFJUWHROT1VvZHE5ZXo3Ky9hTTZjS1VHT2t0enN2UnczdmVYQnNHT3J5?=
 =?utf-8?B?SHE1c3pVT0IxakNjcWIwY0pmSGhDVU1lMnhHNFhmaHpOZi9IdnRxOHpWOGNH?=
 =?utf-8?B?UDNoTitzRERjekErODZoRnJpZWhuQUJuQjJkZHJzcHdWM1BTQzF0YTgxVW9n?=
 =?utf-8?B?a3dWNnUzTjRnUnMwdzZPS1pHV0NkTndwTHhvZks1c0x2SFV2YUFiUkF0M3h5?=
 =?utf-8?B?b293bk9mcmhxenhERld0RHgreEhkbUFyWVZFYmphcTk5bkNIaTBmeG4wQ0ZE?=
 =?utf-8?Q?nM60Oa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXJFUWhMRmNRT0FwRm1VbUVnb0xzdzdRZVhxcWtLQnFlZzNmWnE5RnpRZTU1?=
 =?utf-8?B?WnJlVGt0Qzc1dHppZUgvR3lOWTlOcm50bFRQV1Mvc3BETDVUZEdPN0NTdVJw?=
 =?utf-8?B?Qlg2Z3N4UXRjV1hHcVY4Ylc0cm9RMGpRRGFZellrSUdjdTFPUDZISklhaUl6?=
 =?utf-8?B?RThZVEdYa3pPdTZGMmhsMXpJbGpnOUFsczJTZGgxNzZ3aE4zS0dacld3UWtz?=
 =?utf-8?B?ODl1bnBtVUV0Q1daeXJ5ZTVSQklQL3RrR0NJNUFrZ2N4UkR5SHZDWDR1WjhT?=
 =?utf-8?B?ejVqT3dkbkV4TUpwZmQwODRDdVhsMDBRTTdjVFVrbm5pMFNQaENqbnNGRSt5?=
 =?utf-8?B?N21DcmNEQXNsTlg1OUZCM1NlOG1XNUxxZ1pmeExwM0hmVTJJN0FUV0ZyK2pB?=
 =?utf-8?B?Z0phTzNPTFIyc1VrYTNhNVZjdnJ5NTFOSTNVNS8yUC9oUGo3Zm5xM3FkUkxW?=
 =?utf-8?B?MkQxMnZFRjFHWmtzckgveVdHMm40aTVsbWpMcG1FRG5YdjYzK29IcVFQSVph?=
 =?utf-8?B?aVR5NVRpRXpJUGU1alp6MXBISENnYkZwdmsvR3kzUi9KU3RZVjY1ZW1tL0ZC?=
 =?utf-8?B?RXVxd1JDYm5CcTFsOXk5bkZwQlJNY1RTUUdTVTVOS3d3OVpaSHZiNlBycGZP?=
 =?utf-8?B?NGdMNS80bVlib0R5VklyVG51UW4xWGx2MkUwYzdUaHFSenRuWDZSNjdsSU9E?=
 =?utf-8?B?YXV2NzlEa2czc0ZhNHNqZklsVzV4bmtSWk9iQ0cvSDI2SE9yNkVQS0tqQTVQ?=
 =?utf-8?B?SUNEZldjL0xSTjZMNlpVUDdvSHE2anh5a0RTOGoyRW9MSTRjTFhxQ2w2SGtN?=
 =?utf-8?B?R1ZaTk9pdzkzU1RNeW5MNTFjanpBcVVXZ0E1ekl6SWd1Nkl0Y2pZNzRERkJ2?=
 =?utf-8?B?cHBPT2gvaHl5dXRpQ2R1K29iM0xTTys3ZlJpVDBVZHYvY0pucmhtbkF0Tmgw?=
 =?utf-8?B?cUZmMlFoRHJ6dzlkOVI3UllVOTlvMENaMTBCdFptYW50RWcyRCtEZ2V6WnZL?=
 =?utf-8?B?K1RHVzdiRWhTK2pZYnk4UFh4SUlKSkJlTitxM2tnYnFQQW1oRFdFWUV4RklP?=
 =?utf-8?B?clQ3ZG9yYUhuU254RFVFbW90ZXVKU0ZybHVlVHVlc1BRMk93cjlEcmdnWi9S?=
 =?utf-8?B?TTVZZExsNkR0clhMNlJpbEwvTDd2a1kzSWxKLzdjY2RMaVB2T0lsQ01HSVlR?=
 =?utf-8?B?Rk9TZWVlT2NaWkFldjVYNEZHQzVLZHF6MnJCT3hTRzJkQk5WcEpXa2ZtQkRM?=
 =?utf-8?B?a3BybGtCM2RpQzVibWhRRVVwNHRLWVFUbERXMTA1NG13Rm1FRkdQWXpXendC?=
 =?utf-8?B?MW1pRFE2a2FyRmxBNkFOL2tBcFhJbG9XekkrV29nM1lNbHhPTFBpcUY0Wmhq?=
 =?utf-8?B?SWxzVHlzS2hJUndyM21hZEkzTVQydU9yVkpla1hrNjVMQmNyTjhlb3lnUWpi?=
 =?utf-8?B?K3B4VDJQaXppK2VRVm1oeXpHL0xyeU9HNFJjVUkzSGRBdFN5eEY5OEwwZ3Qr?=
 =?utf-8?B?MWo5bng3alY3dENyeEZyaUNVZ1JvQ1hCbkk4alVxNlRXM21YZTJkQmxZMkJ0?=
 =?utf-8?B?K3d1NXlHTFQ2eHBGNGF1andoSGg0MGVoK3pMb0ZVcHVSbDdXaVluYUYybWwy?=
 =?utf-8?B?MmhxS3BYbVAwSHNMQUZqd1AvNWUzMjNVazI2OHZhZUo2aUxtZ2dzYWh3bHlS?=
 =?utf-8?B?Z2ZpeTFBUXVzWmNiTmV5dVZBZ1lGQUNhM1U2MC9ZZDNkN1ZpUE1OampnT0Ey?=
 =?utf-8?B?SEJ0akc4WWpWMnF6VkYzNU1CakFUWi9ZMTdyTkd2Z3NhOUhjM0JIN0pDV2cv?=
 =?utf-8?B?a1hwTmxNaWk0WlRYMG9aMTRrZDNwdDVQL2JoT2w0M3ZUSDBtOHJoWmRJUnZT?=
 =?utf-8?B?WVJtWjRvM1BiTDNnaFhpcVVvekxOdmozcUR6cEx6R3FSY09JRjRvdFJ2ZzNk?=
 =?utf-8?B?RVdpeGJyTGk2eUUvTFVzSWx4eSsvcTZYZkovekJiMytUUFY5ZE11YklzN1h6?=
 =?utf-8?B?aEtjTzlILyt6Mk43L0dwYVJBdk1mdjRmNjE2SUhZZ3VUOVpaUzQxeithcVov?=
 =?utf-8?B?VmsvckEwcWNFSG55bDZLSzdVUVZLTHJRUGVQc0J0a3k4VFdpZ3gzNkQzdEM3?=
 =?utf-8?Q?Izek49WsBOUC1jeaLyBkoMGGH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdc17517-b074-49a1-b927-08de1b89cd76
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 10:06:20.6597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SyOby+suq4OhLpQIEMqWw9zlsQocIS2rzCzFSFLNv/w92mb3TnoBZp5oVc2SOL22YYvUk5URNgL3wKE+Vt57Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9969
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Udit Kumar <u-kumar1@ti.com>, Andrew Davis <afd@ti.com>,
 Beleswar Padhi <b-padhi@ti.com>, Judith Mendez <jm@ti.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Ryan Eatmon <reatmon@ti.com>,
 Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH v4 01/12] remoteproc: Extend device_to_virt
 with a is_iomem parameter
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

Some areas needs to be initialized by using memcpy_toio and memset_io.
Following Linux Kernel commit: 40df0a91b2a5 ("remoteproc: add is_iomem to
da_to_va"), add this to U-Boot.

Reviewed-by: Ye Li <ye.li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/renesas_apmu.c     |  3 +-
 drivers/remoteproc/rproc-elf-loader.c | 95 +++++++++++++++++++++++------------
 drivers/remoteproc/sandbox_testproc.c |  3 +-
 drivers/remoteproc/stm32_copro.c      |  3 +-
 drivers/remoteproc/ti_k3_dsp_rproc.c  |  2 +-
 drivers/remoteproc/ti_k3_m4_rproc.c   |  2 +-
 drivers/remoteproc/ti_k3_r5f_rproc.c  |  2 +-
 include/remoteproc.h                  |  3 +-
 8 files changed, 75 insertions(+), 38 deletions(-)

diff --git a/drivers/remoteproc/renesas_apmu.c b/drivers/remoteproc/renesas_apmu.c
index 1a50cd3289bc40de23f23630f2b591fba2241dbb..91586a99e0dacaff7d9cb5ecd1ea6e4489659521 100644
--- a/drivers/remoteproc/renesas_apmu.c
+++ b/drivers/remoteproc/renesas_apmu.c
@@ -170,11 +170,12 @@ static int renesas_apmu_rproc_init(struct udevice *dev)
  * @dev:	corresponding remote processor device
  * @da:		device address
  * @size:	Size of the memory region @da is pointing to
+ * @is_iomem:	optional pointer filled in to indicate if @da is iomapped memory
  *
  * Return: converted virtual address
  */
 static void *renesas_apmu_rproc_device_to_virt(struct udevice *dev, ulong da,
-					       ulong size)
+					       ulong size, bool *is_iomem)
 {
 	/*
 	 * The Cortex R52 and A76 share the same address space,
diff --git a/drivers/remoteproc/rproc-elf-loader.c b/drivers/remoteproc/rproc-elf-loader.c
index 0b3941b7798d3971cbe982d3c3d080a717fcef65..83d70c2fb5447065927a7507a653213ca9448002 100644
--- a/drivers/remoteproc/rproc-elf-loader.c
+++ b/drivers/remoteproc/rproc-elf-loader.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
 /*
  * Copyright (C) 2019, STMicroelectronics - All Rights Reserved
+ * Copyright 2025 NXP
  */
 #include <cpu_func.h>
 #include <dm.h>
@@ -9,6 +10,7 @@
 #include <mapmem.h>
 #include <remoteproc.h>
 #include <asm/cache.h>
+#include <asm/io.h>
 #include <dm/device_compat.h>
 #include <linux/compat.h>
 #include <linux/printk.h>
@@ -181,27 +183,38 @@ int rproc_elf32_load_image(struct udevice *dev, unsigned long addr, ulong size)
 	for (i = 0; i < ehdr->e_phnum; i++, phdr++) {
 		void *dst = (void *)(uintptr_t)phdr->p_paddr;
 		void *src = (void *)addr + phdr->p_offset;
+		bool is_iomem = false;
 		ulong dst_addr;
 
-		if (phdr->p_type != PT_LOAD)
+		if (phdr->p_type != PT_LOAD || !phdr->p_memsz)
 			continue;
 
 		if (ops->device_to_virt)
 			dst = ops->device_to_virt(dev, (ulong)dst,
-						  phdr->p_memsz);
+						  phdr->p_memsz, &is_iomem);
 
 		dev_dbg(dev, "Loading phdr %i to 0x%p (%i bytes)\n",
 			i, dst, phdr->p_filesz);
-		if (phdr->p_filesz)
-			memcpy(dst, src, phdr->p_filesz);
-		if (phdr->p_filesz != phdr->p_memsz)
-			memset(dst + phdr->p_filesz, 0x00,
-			       phdr->p_memsz - phdr->p_filesz);
+		if (phdr->p_filesz) {
+			if (is_iomem)
+				memcpy_toio(dst, src, phdr->p_filesz);
+			else
+				memcpy(dst, src, phdr->p_filesz);
+		}
+		if (phdr->p_filesz != phdr->p_memsz) {
+			if (is_iomem)
+				memset_io(dst + phdr->p_filesz, 0x00,
+					  phdr->p_memsz - phdr->p_filesz);
+			else
+				memset(dst + phdr->p_filesz, 0x00,
+				       phdr->p_memsz - phdr->p_filesz);
+		}
 		dst_addr = map_to_sysmem(dst);
-		flush_cache(rounddown(dst_addr, ARCH_DMA_MINALIGN),
-			    roundup(dst_addr + phdr->p_filesz,
-				    ARCH_DMA_MINALIGN) -
-			    rounddown(dst_addr, ARCH_DMA_MINALIGN));
+		if (!is_iomem) {
+			flush_cache(rounddown(dst_addr, ARCH_DMA_MINALIGN),
+				    roundup(dst_addr + phdr->p_filesz, ARCH_DMA_MINALIGN) -
+				    rounddown(dst_addr, ARCH_DMA_MINALIGN));
+		}
 	}
 
 	return 0;
@@ -230,6 +243,7 @@ int rproc_elf64_load_image(struct udevice *dev, ulong addr, ulong size)
 		memsz = phdr->p_memsz;
 		filesz = phdr->p_filesz;
 		offset = phdr->p_offset;
+		bool is_iomem = false;
 
 		if (phdr->p_type != PT_LOAD)
 			continue;
@@ -239,7 +253,7 @@ int rproc_elf64_load_image(struct udevice *dev, ulong addr, ulong size)
 
 		ptr = (void *)(uintptr_t)da;
 		if (ops->device_to_virt) {
-			ptr = ops->device_to_virt(dev, da, phdr->p_memsz);
+			ptr = ops->device_to_virt(dev, da, phdr->p_memsz, &is_iomem);
 			if (!ptr) {
 				dev_err(dev, "bad da 0x%llx mem 0x%llx\n", da,
 					memsz);
@@ -248,14 +262,24 @@ int rproc_elf64_load_image(struct udevice *dev, ulong addr, ulong size)
 			}
 		}
 
-		if (filesz)
-			memcpy(ptr, (void *)addr + offset, filesz);
-		if (filesz != memsz)
-			memset(ptr + filesz, 0x00, memsz - filesz);
+		if (filesz) {
+			if (is_iomem)
+				memcpy_toio(ptr, (void *)addr + offset, filesz);
+			else
+				memcpy(ptr, (void *)addr + offset, filesz);
+		}
+		if (filesz != memsz) {
+			if (is_iomem)
+				memset_io(ptr + filesz, 0x00, memsz - filesz);
+			else
+				memset(ptr + filesz, 0x00, memsz - filesz);
+		}
 
-		flush_cache(rounddown((ulong)ptr, ARCH_DMA_MINALIGN),
-			    roundup((ulong)ptr + filesz, ARCH_DMA_MINALIGN) -
-			    rounddown((ulong)ptr, ARCH_DMA_MINALIGN));
+		if (!is_iomem) {
+			flush_cache(rounddown((ulong)ptr, ARCH_DMA_MINALIGN),
+				    roundup((ulong)ptr + filesz, ARCH_DMA_MINALIGN) -
+				    rounddown((ulong)ptr, ARCH_DMA_MINALIGN));
+		}
 	}
 
 	return ret;
@@ -381,6 +405,7 @@ int rproc_elf32_load_rsc_table(struct udevice *dev, ulong fw_addr,
 	Elf32_Shdr *shdr;
 	void *src, *dst;
 	ulong dst_addr;
+	bool is_iomem = false;
 
 	shdr = rproc_elf32_find_rsc_table(dev, fw_addr, fw_size);
 	if (!shdr)
@@ -394,18 +419,22 @@ int rproc_elf32_load_rsc_table(struct udevice *dev, ulong fw_addr,
 
 	src = (void *)fw_addr + shdr->sh_offset;
 	if (ops->device_to_virt)
-		dst = (void *)ops->device_to_virt(dev, *rsc_addr, *rsc_size);
+		dst = (void *)ops->device_to_virt(dev, *rsc_addr, *rsc_size, &is_iomem);
 	else
 		dst = (void *)rsc_addr;
 
 	dev_dbg(dev, "Loading resource table to 0x%8lx (%ld bytes)\n",
 		(ulong)dst, *rsc_size);
 
-	memcpy(dst, src, *rsc_size);
-	dst_addr = map_to_sysmem(dst);
-	flush_cache(rounddown(dst_addr, ARCH_DMA_MINALIGN),
-		    roundup(dst_addr + *rsc_size, ARCH_DMA_MINALIGN) -
-		    rounddown(dst_addr, ARCH_DMA_MINALIGN));
+	if (is_iomem) {
+		memcpy_toio(dst, src, *rsc_size);
+	} else {
+		memcpy(dst, src, *rsc_size);
+		dst_addr = map_to_sysmem(dst);
+		flush_cache(rounddown(dst_addr, ARCH_DMA_MINALIGN),
+			    roundup(dst_addr + *rsc_size, ARCH_DMA_MINALIGN) -
+			    rounddown(dst_addr, ARCH_DMA_MINALIGN));
+	}
 
 	return 0;
 }
@@ -490,6 +519,7 @@ int rproc_elf64_load_rsc_table(struct udevice *dev, ulong fw_addr,
 	const struct dm_rproc_ops *ops;
 	Elf64_Shdr *shdr;
 	void *src, *dst;
+	bool is_iomem = false;
 
 	shdr = rproc_elf64_find_rsc_table(dev, fw_addr, fw_size);
 	if (!shdr)
@@ -503,18 +533,21 @@ int rproc_elf64_load_rsc_table(struct udevice *dev, ulong fw_addr,
 
 	src = (void *)fw_addr + shdr->sh_offset;
 	if (ops->device_to_virt)
-		dst = (void *)ops->device_to_virt(dev, *rsc_addr, *rsc_size);
+		dst = (void *)ops->device_to_virt(dev, *rsc_addr, *rsc_size, &is_iomem);
 	else
 		dst = (void *)rsc_addr;
 
 	dev_dbg(dev, "Loading resource table to 0x%8lx (%ld bytes)\n",
 		(ulong)dst, *rsc_size);
 
-	memcpy(dst, src, *rsc_size);
-	flush_cache(rounddown((unsigned long)dst, ARCH_DMA_MINALIGN),
-		    roundup((unsigned long)dst + *rsc_size,
-			    ARCH_DMA_MINALIGN) -
-		    rounddown((unsigned long)dst, ARCH_DMA_MINALIGN));
+	if (is_iomem) {
+		memcpy_toio(dst, src, *rsc_size);
+	} else {
+		memcpy(dst, src, *rsc_size);
+		flush_cache(rounddown((unsigned long)dst, ARCH_DMA_MINALIGN),
+			    roundup((unsigned long)dst + *rsc_size, ARCH_DMA_MINALIGN) -
+			    rounddown((unsigned long)dst, ARCH_DMA_MINALIGN));
+	}
 
 	return 0;
 }
diff --git a/drivers/remoteproc/sandbox_testproc.c b/drivers/remoteproc/sandbox_testproc.c
index ad575a7c10fdb399c77f4f01b8167a8ae71574a2..7ed38e8656c5f8d653e4aa32316a3cf7dbd7a767 100644
--- a/drivers/remoteproc/sandbox_testproc.c
+++ b/drivers/remoteproc/sandbox_testproc.c
@@ -308,10 +308,11 @@ static int sandbox_testproc_ping(struct udevice *dev)
  * @dev:	device to operate upon
  * @da:		device address
  * @size:	Size of the memory region @da is pointing to
+ * @is_iomem:	optional pointer filled in to indicate if @da is iomapped memory
  * Return: converted virtual address
  */
 static void *sandbox_testproc_device_to_virt(struct udevice *dev, ulong da,
-					     ulong size)
+					     ulong size, bool *is_iomem)
 {
 	u64 paddr;
 
diff --git a/drivers/remoteproc/stm32_copro.c b/drivers/remoteproc/stm32_copro.c
index f45da9a68ac6eaeef0c5a563785a2b9433430b7e..bf721e78bb36f52ee55a776dc7b6b45a89858fbd 100644
--- a/drivers/remoteproc/stm32_copro.c
+++ b/drivers/remoteproc/stm32_copro.c
@@ -61,10 +61,11 @@ static int stm32_copro_probe(struct udevice *dev)
  * @dev:	corresponding STM32 remote processor device
  * @da:		device address
  * @size:	Size of the memory region @da is pointing to
+ * @is_iomem:	optional pointer filled in to indicate if @da is iomapped memory
  * Return: converted virtual address
  */
 static void *stm32_copro_device_to_virt(struct udevice *dev, ulong da,
-					ulong size)
+					ulong size, bool *is_iomem)
 {
 	fdt32_t in_addr = cpu_to_be32(da), end_addr;
 	u64 paddr;
diff --git a/drivers/remoteproc/ti_k3_dsp_rproc.c b/drivers/remoteproc/ti_k3_dsp_rproc.c
index 5a7d63772830cf064e28042ebb6726f058cb8876..9275e1b241de7f13ddda08b27288cc32d7d95725 100644
--- a/drivers/remoteproc/ti_k3_dsp_rproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_rproc.c
@@ -261,7 +261,7 @@ static int k3_dsp_reset(struct udevice *dev)
 	return 0;
 }
 
-static void *k3_dsp_da_to_va(struct udevice *dev, ulong da, ulong len)
+static void *k3_dsp_da_to_va(struct udevice *dev, ulong da, ulong len, bool *is_iomem)
 {
 	struct k3_dsp_privdata *dsp = dev_get_priv(dev);
 	phys_addr_t bus_addr, dev_addr;
diff --git a/drivers/remoteproc/ti_k3_m4_rproc.c b/drivers/remoteproc/ti_k3_m4_rproc.c
index 31b9de7157936fcaf13eaabaa2e1e65ecad31738..f358788f07f0511ac75460bdd4417f3ca482b87e 100644
--- a/drivers/remoteproc/ti_k3_m4_rproc.c
+++ b/drivers/remoteproc/ti_k3_m4_rproc.c
@@ -181,7 +181,7 @@ static int k3_m4_stop(struct udevice *dev)
 	return 0;
 }
 
-static void *k3_m4_da_to_va(struct udevice *dev, ulong da, ulong len)
+static void *k3_m4_da_to_va(struct udevice *dev, ulong da, ulong len, bool *is_iomem)
 {
 	struct k3_m4_privdata *m4 = dev_get_priv(dev);
 	phys_addr_t bus_addr, dev_addr;
diff --git a/drivers/remoteproc/ti_k3_r5f_rproc.c b/drivers/remoteproc/ti_k3_r5f_rproc.c
index 48401bc6eb67b0d0bf673b8db033f9165353e495..c738607c10925c33d6f5a614d8ada2da0c5ecb2e 100644
--- a/drivers/remoteproc/ti_k3_r5f_rproc.c
+++ b/drivers/remoteproc/ti_k3_r5f_rproc.c
@@ -534,7 +534,7 @@ proc_release:
 	return ret;
 }
 
-static void *k3_r5f_da_to_va(struct udevice *dev, ulong da, ulong size)
+static void *k3_r5f_da_to_va(struct udevice *dev, ulong da, ulong size, bool *is_iomem)
 {
 	struct k3_r5f_core *core = dev_get_priv(dev);
 	void __iomem *va = NULL;
diff --git a/include/remoteproc.h b/include/remoteproc.h
index 6f8068e14967571eea18522b70fa272697610a41..9adc3d17d8f773b0c01f3952fcc846fad7337861 100644
--- a/include/remoteproc.h
+++ b/include/remoteproc.h
@@ -495,9 +495,10 @@ struct dm_rproc_ops {
 	 * @dev:	Remote proc device
 	 * @da:		Device address
 	 * @size:	Size of the memory region @da is pointing to
+	 * @is_iomem:	optional pointer filled in to indicate if @da is iomapped memory
 	 * @return virtual address.
 	 */
-	void * (*device_to_virt)(struct udevice *dev, ulong da, ulong size);
+	void * (*device_to_virt)(struct udevice *dev, ulong da, ulong size, bool *is_iomem);
 	int (*add_res)(struct udevice *dev,
 		       struct rproc_mem_entry *mapping);
 	void * (*alloc_mem)(struct udevice *dev, unsigned long len,

-- 
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
