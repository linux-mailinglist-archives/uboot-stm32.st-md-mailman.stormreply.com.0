Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C12BE1F30
	for <lists+uboot-stm32@lfdr.de>; Thu, 16 Oct 2025 09:38:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C2E9C5719D;
	Thu, 16 Oct 2025 07:38:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80324C05856
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Oct 2025 07:38:35 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G7cDwD028578;
 Thu, 16 Oct 2025 09:38:17 +0200
Received: from duzpr83cu001.outbound.protection.outlook.com
 (mail-northeuropeazon11012060.outbound.protection.outlook.com [52.101.66.60])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49qfe6eyh3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Oct 2025 09:38:17 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gJH3DS3wDnrMdK2TbYOOFnPHLWtaIZ86NT1SRzbBlozV2TT+uZlK0sOkOXd0b+dE6D8UZE1OZwfP0wwtf2JfardmOUsUIFzJuG6HYPG6ZaaM8OH7ni8BCfYO1SfZcrPsI3dpySZj0u+js7FLPiGqvuMC1ij8JbfZTtaw3Rbano53UdbLCWB9pUHPOjZVG70XYrefLGdXoZGHOr5gQru9vWRzT3WMvB2FCK02x98TZFmhnJMhl3VWwCSqkcEjpoKa9aWGCGtxBVATK7GFHbfHicJ0eZHiIxxLgTY+5quHwNj9URtvWuXpT1mO+nSjhiuJnxSJrsvLFg0aXjut3EXwqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPizwdCIbC/1vsFQNNE+2YoeYHScKQuwG3uODagwfGQ=;
 b=NCJAy8YGM+4Nei4UeiQSF/8oKicaYKsC7ZItPKx53EXMmIprc7DsoTEzWOKUZOisH0q1n7ebHGRyvDTwWEIxqrf90iesLgwzqGihQ4f6+UnC9SjM4QazwPXpWmlfCAfRtGNrcJGZIXBjBC9YoT/QRLbgIA+qdcJS0CN33E+5ySLYK6w4KXP4I2TUde/yUJXs1fGkOMGrd/eV+wigiDPPWF8FJW3jssRZDNB4B5Up0h9kCLheQyby9GM/VjCFsJoaVNukJzFPNojnCr6hLSPsXWddU8HRftyaHpLpdICCu13uGfXx2P++S5bKli6xazKiuwg1a9lGHCu0MxZsuIU7Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.41) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPizwdCIbC/1vsFQNNE+2YoeYHScKQuwG3uODagwfGQ=;
 b=IVHqrkQjWqNDfw3gHBzT67nPHWoQl49G/vBhkZc8ntu//vn0VHmy/oyL1ySlCwqcn+6KY5Wa2HvPgZiYlajRWzH1hgdq1rYmA74HDBqfeNHvK2NrCI3uj7hDM3M9MdfiVStQDXaiyAzIF6xdLLGkZA/AQllVZAUKuRwP/K9GFIpXlTOwBzgAYzZ67SYGKeAezvf9DRFrrLhbBEZk3FbCV83TdaDFqJVDh+fbj2218//N4IH2Tzzu/N/wnByTtHNhZTzZZOvQplsFkeBDSiaBzoAtESIs+j3B53c+UGI24VWlgWu1MQsO3otb3FshgGOM/xN0LRsm7SsB3h9ios1kIQ==
Received: from DUZPR01CA0096.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::19) by VI0PR10MB8306.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:231::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 07:38:14 +0000
Received: from DU2PEPF00028D13.eurprd03.prod.outlook.com
 (2603:10a6:10:4bb:cafe::9d) by DUZPR01CA0096.outlook.office365.com
 (2603:10a6:10:4bb::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.12 via Frontend Transport; Thu,
 16 Oct 2025 07:38:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.41)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.41 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.41; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.41) by
 DU2PEPF00028D13.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Thu, 16 Oct 2025 07:38:13 +0000
Received: from EQNDAG1NODE4.st.com (10.75.129.133) by smtpO365.st.com
 (10.250.44.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 16 Oct
 2025 09:41:17 +0200
Received: from [10.48.87.93] (10.48.87.93) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 16 Oct
 2025 09:38:00 +0200
Message-ID: <b9ca4251-560e-4169-ba78-7bf3c9f9b1ff@foss.st.com>
Date: Thu, 16 Oct 2025 09:37:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Goodbody <andrew.goodbody@linaro.org>, <u-boot-amlogic@groups.io>, 
 <u-boot@lists.denx.de>, Paul Barker <paul@pbarker.dev>,
 <uboot-snps-arc@synopsys.com>, Dai Okamura <okamura.dai@socionext.com>,
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>,
 <adsp-linux@analog.com>, <uboot-stm32@st-md-mailman.stormreply.com>
References: <20251015-clk_ops-v1-0-5f80f827407e@linaro.org>
 <20251015-clk_ops-v1-23-5f80f827407e@linaro.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20251015-clk_ops-v1-23-5f80f827407e@linaro.org>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D13:EE_|VI0PR10MB8306:EE_
X-MS-Office365-Filtering-Correlation-Id: e9e72914-541c-4b81-d097-08de0c86f6e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|82310400026|1800799024|36860700013|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2RDekRzUTJPTlE4am9LZ1dQaDZYZ2w3OTNoWWV0dEhuaVlhNnJFRDVnY2FG?=
 =?utf-8?B?eGRaUmkxWFJxQm1xemVXR2c2TWo5dzNZQmo5VlRqN0J4VTYyRUNmRzZTWllU?=
 =?utf-8?B?YTczK3lNVms3NkFXclhXNWl3MTBZSXhZY0RVRVYzWkhZcWw1WEg3eGhVSmRH?=
 =?utf-8?B?Z3ZzTTNjM1dobTVrQVZWTWsvcXN2UURUMXUzbmpYVlc0ekU5eDBSOWNFQlJt?=
 =?utf-8?B?NHhxMW5QMXh6RkRQNUZQb25aWGlrb1BIUFY2NElKWWR3bFRzQUN4R2g3bWFQ?=
 =?utf-8?B?Z3JzMG96R1dxYUdEM3JPbXU2M2lTbExINmx0bjBwU3BJd0t3Z21leW4yRU9X?=
 =?utf-8?B?cXJrWU5ZTkRwekREK0hldWgwUVg2eDlXbW9CYWVpWEdkWVVrL1psRXZMZjhu?=
 =?utf-8?B?ODVWWjBCMENEYmlLR2FuOHo2K2FyR25Fc2x6TExSNmpjUy9IVFFLQkE4YWNJ?=
 =?utf-8?B?SWZhV2l2NkxhbjU5a1dZRHVtMnFad3E0dVcxNkpVV2MrUTN2bjgzVjJRUFh6?=
 =?utf-8?B?RHZJYmhHWm0vMStscnI2YXZLUVVnVnFPbDlSRWc4Z0NrenkxeUpPSlFPaEFK?=
 =?utf-8?B?RUFhLzFEdDMvK2xHTXluck9mZzZxVmMwaXZ2a1J0bExyTFNIbW5nekJUSnAw?=
 =?utf-8?B?b1dKRjRsayt6SmFpSExQS0RhZmVSRzU1cGZHSDBQMy9pZVBtb0dIclJWWU5o?=
 =?utf-8?B?MVpFSVlLZDRVbmtoNnAwbWduTVpkaWc2U0orQ0E4MGJZLy9TRm5wSERRN0JR?=
 =?utf-8?B?NnVJTmM3c3NGcDJnZGlxemFLTlphOTM3akxmS0RSZjE5cnJkWTcxNEZ3dTE4?=
 =?utf-8?B?NXZDM0loRmM4czkyVGEvWkh4Tkt3YlpuYmRqUm9ET3B4VmRxeWJ4K2Vxcnc3?=
 =?utf-8?B?bzBoLzRTaWc0aVMrZi83dThhQUlCVmFzVkdHVXo2R0hKZVljMmVyTS9INXI1?=
 =?utf-8?B?ZVcyaVBQSUtXUWFEUFNYSHlTK1Z0VmFna1FGN1gzWG9lMkZpUVl6TkRJYVE2?=
 =?utf-8?B?dUphYXA0eGpqbW5zdGVlbGdsYktsRUlOY3ZodkpjUE9wbzM0YmkrMHQzY3Iw?=
 =?utf-8?B?NnJpeWFVVmRMYW5WVnJSODg2RmFYK1BwM0FDMlorU2psV01uV3NiNWRTMFJ2?=
 =?utf-8?B?UmtoRnJOVGtDZHo4WjhKbzZTVEdiSmN3dlJyTEZFK0VGSm9OSUI0bWlkZTE5?=
 =?utf-8?B?eEp0L0ZWTktXZUdNR1ZRYnA5clQ5MGgvWUxlMXpDME5lQS9zeDQ3YTFsUmdH?=
 =?utf-8?B?NDUveVJmeUNEQUwrdzlzRjZmajFCSHlzKzJ1ckltMWxhdHY5RkI2b2U2YzE3?=
 =?utf-8?B?bXFvL2JyTXZVQVZQbTRvUmpXRkxMVGwxYXJOemRFc1pMeXhwU0F6YTBobGIw?=
 =?utf-8?B?VEM1TnFjWnBkQURnS2FwR2ZvTlp3YldKMUk0bXJteldpdWtvTHJ3MUhDeDVl?=
 =?utf-8?B?Z2pqWkM2Wm00dTlUWEZsdWJSa3YwM2hsdVFMdU5CNS82cW16aVdBU0grenJN?=
 =?utf-8?B?djlFTWVRSkwvSlNFUFlhbkVQbDRmRUlNNFlKSS9jWTY4ZHp1MTRBeDFqZUhG?=
 =?utf-8?B?cklCZXB1allNUnIzSzEwdHRCYkxhTTltVXc5OWhnTnUzV3g5K1JkdFdWMDVZ?=
 =?utf-8?B?TTVNTzVVSm1acithRlVhMEJpSDFjY3BNQ202aGFJZjRwaE94ZjBuNWoyeXRk?=
 =?utf-8?B?TGpiZC9HazQ3Yk9ydnh2MXlyMllmRENQY2VyRnp1aVZ2aFpmdUpqYjdOMGdY?=
 =?utf-8?B?OFhVVFlPM3U3emQ4NjBIVkZiNjBTNmxDVlp3SWMrZ0piRHM3QkNMTTEwTEIw?=
 =?utf-8?B?RHJhemNpU0VnVlNoWWlRbU1TNlZtemVyRlZjbjJ6RDkyT1ZqU2taOGRPUEIz?=
 =?utf-8?B?RGx4RWh4ZHZQVGlJVy9MUHVkeFpSQ3RCOWFMTFRsUDJCbC85RmRPclBNeXc0?=
 =?utf-8?B?aW9GQ1IzWjNDRHlOMVN2R3paRFpLZzV3VGlQZE0rb1ZUdjZOWHJaS3luYkl1?=
 =?utf-8?B?UW85YzRDTzBSQ0J6QS9tV0FwZlF0UEZnckw5clI1NWhtTHVxbHpyWmhyNVZV?=
 =?utf-8?B?aU9hOCtsWkRDMnRIR3RUeTczbWJxcmRyZmFsd09iNC9vS1I3UHpGc2kxSFR4?=
 =?utf-8?Q?5OkWhe6PPCifVhYRouy7FJNpM?=
X-Forefront-Antispam-Report: CIP:164.130.1.41; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 07:38:13.9436 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9e72914-541c-4b81-d097-08de0c86f6e2
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.41];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D13.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8306
X-Proofpoint-GUID: 8017bXk8vbfV0whoic0ohVC8TOJe25TX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX3TB6IMFoj7na
 1OWL3xAA6crgxJ1bY3Q+fNIQswCwqjhhwRvXz7BBlzc7B6L80DInDiiNxiRZB6jKKf29zMJli9T
 1BMS4X8RXqHdrTckhSxUsNuiFb8d+Caz7SzGUb/Okf5rmUnlAgRESHgSG4vT4vdmO7FJ9I+CKoF
 6NG7V25d5ZudqpbbgjiOOl7E0VVobh2SWfMluS2EFT8Dl/UlOy0/HSY0MlySbk5yvKNs99+APRr
 N6pZpnX11kRmxod+U59f/agoNKCy5Fkmu0Us+GMA4kBjxEmmB7v3AJd4E7nw6/f70NH8bdn71gm
 Vi5jz0Hg5jh/03CIT3mtUbUfyT/qe9RZIRXhmpzOyIHEyXW8yhAIK8M0Yuz0Eb5xpuQtRRa+OAs
 JPKFuLXbEUeGjaAwRx/Tuflm5D/wlA==
X-Authority-Analysis: v=2.4 cv=NfvrFmD4 c=1 sm=1 tr=0 ts=68f0a0e9 cx=c_pps
 a=0FIfyxYfePq3aMp09QyktA==:117 a=k+92ZC+kR50ztVuylSZIGA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=8b9GpE9nAAAA:8
 a=2RCSVA8gZ0yXJkrON40A:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
 a=T3LWEMljR5ZiDmsYVIUa:22 a=UhEZJTgQB8St2RibIkdl:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22
 a=QOGEsqRv6VhmHaoFNykA:22
X-Proofpoint-ORIG-GUID: 8017bXk8vbfV0whoic0ohVC8TOJe25TX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0
 phishscore=0 adultscore=0
 clxscore=1011 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018
Cc: Peng Fan <peng.fan@nxp.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Heiko
 Stuebner <heiko@sntech.de>, Liviu Dudau <liviu.dudau@foss.arm.com>, Alice
 Guo <alice.guo@nxp.com>, Stefan Roese <stefan.roese@mailbox.org>,
 Alif Zakuan Yuslaimi <alif.zakuan.yuslaimi@altera.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Utsav Agarwal <utsav.agarwal@analog.com>, Sean Anderson <seanga2@gmail.com>,
 Naresh Kumar Ravulapalli <nareshkumar.ravulapalli@altera.com>,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Marek Vasut <marek.vasut@mailbox.org>, Sam
 Protsenko <semen.protsenko@linaro.org>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
 Minkyu Kang <mk7.kang@samsung.com>, Weijie Gao <weijie.gao@mediatek.com>,
 Lukasz Majewski <lukma@denx.de>, Hal Feng <hal.feng@starfivetech.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Thierry Reding <treding@nvidia.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Arturs Artamonovs <arturs.artamonovs@analog.com>,
 Joseph Chen <chenjh@rock-chips.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Ye Li <ye.li@nxp.com>,
 Tien Fong Chee <tien.fong.chee@altera.com>, Yao Zi <ziyao@disroot.org>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, Jonas Karlman <jonas@kwiboo.se>,
 Sam Shih <sam.shih@mediatek.com>, Elaine Zhang <zhangqing@rock-chips.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, Sumit
 Garg <sumit.garg@kernel.org>, Jonathan Currier <dullfire@yahoo.com>,
 Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 Muhammad Hazim Izzat Zamri <muhammad.hazim.izzat.zamri@altera.com>, Michal
 Simek <michal.simek@amd.com>, Greg Malysa <malysagreg@gmail.com>,
 Heiko Schocher <hs@nabladev.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Leo
 Yu-Chi Liang <ycliang@andestech.com>, Tingting Meng <tingting.meng@altera.com>,
 Ian Roberts <ian.roberts@timesys.com>, Simon Glass <sjg@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Padmarao Begari <padmarao.begari@amd.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 23/24] clk: stm32: Remove negative error
 returns from clk_get_rate
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



On 10/15/25 16:32, Andrew Goodbody wrote:
> clk_get_rate() returns a ulong so do not attempt to pass negative error
> codes through it.
> 
> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
> ---
>  drivers/clk/stm32/clk-stm32-core.c | 4 ++--
>  drivers/clk/stm32/clk-stm32f.c     | 6 +++---
>  drivers/clk/stm32/clk-stm32h7.c    | 4 ++--
>  3 files changed, 7 insertions(+), 7 deletions(-)


Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice

> 
> diff --git a/drivers/clk/stm32/clk-stm32-core.c b/drivers/clk/stm32/clk-stm32-core.c
> index 858f122db1a6db02eadc110a7b3e14192654d8ff..5220d49d4206808734f9838d3e55298cf6b163ab 100644
> --- a/drivers/clk/stm32/clk-stm32-core.c
> +++ b/drivers/clk/stm32/clk-stm32-core.c
> @@ -106,11 +106,11 @@ static ulong stm32_clk_get_rate(struct clk *clk)
>  	struct clk *c = NULL;
>  
>  	if (!clk->id || clk_get_by_id(clk->id, &c))
> -		return -ENOENT;
> +		return 0;
>  
>  	ops = clk_dev_ops(c->dev);
>  	if (!ops->get_rate)
> -		return -ENOSYS;
> +		return 0;
>  
>  	return ops->get_rate(c);
>  }
> diff --git a/drivers/clk/stm32/clk-stm32f.c b/drivers/clk/stm32/clk-stm32f.c
> index fceb3c44b94e4e4f5249ff1bc99c7ae4adba4316..db64139d13d4b3fff74838d9e14ae6c5e61c7941 100644
> --- a/drivers/clk/stm32/clk-stm32f.c
> +++ b/drivers/clk/stm32/clk-stm32f.c
> @@ -310,7 +310,7 @@ static unsigned long stm32_clk_get_pllsai_rate(struct stm32_clk *priv,
>  		break;
>  	default:
>  		log_err("incorrect PLLSAI output %d\n", output);
> -		return -EINVAL;
> +		return 0;
>  	}
>  
>  	return (stm32_clk_get_pllsai_vco_rate(priv) / pll_div_output);
> @@ -414,7 +414,7 @@ static ulong stm32_clk_get_rate(struct clk *clk)
>  		vco = (priv->hse_rate / pllm) * plln;
>  		sysclk = vco / pllp;
>  	} else {
> -		return -EINVAL;
> +		return 0;
>  	}
>  
>  	switch (clk->id) {
> @@ -491,7 +491,7 @@ static ulong stm32_clk_get_rate(struct clk *clk)
>  
>  	default:
>  		dev_err(clk->dev, "clock index %ld out of range\n", clk->id);
> -		return -EINVAL;
> +		return 0;
>  	}
>  }
>  
> diff --git a/drivers/clk/stm32/clk-stm32h7.c b/drivers/clk/stm32/clk-stm32h7.c
> index df82db69738a5d9704592d5cdbec52125c0620a1..eb8fb72976b60c8016408693631470a0e369e8cb 100644
> --- a/drivers/clk/stm32/clk-stm32h7.c
> +++ b/drivers/clk/stm32/clk-stm32h7.c
> @@ -573,7 +573,7 @@ static u32 stm32_get_PLL1_rate(struct stm32_rcc_regs *regs,
>  		break;
>  	}
>  
> -	return -EINVAL;
> +	return 0;
>  }
>  
>  static u32 stm32_get_apb_psc(struct stm32_rcc_regs *regs, enum apb apb)
> @@ -780,7 +780,7 @@ static ulong stm32_clk_get_rate(struct clk *clk)
>  	default:
>  		dev_err(clk->dev, "unexpected gate_offset value (0x%x)\n",
>  			gate_offset);
> -		return -EINVAL;
> +		return 0;
>  		break;
>  	}
>  }
> 

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
