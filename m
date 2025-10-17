Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 346E3BE9190
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Oct 2025 16:06:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD49CC597B1;
	Fri, 17 Oct 2025 14:06:04 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5EC9DC597A8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 14:06:03 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HCEPXJ007724;
 Fri, 17 Oct 2025 16:06:00 +0200
Received: from am0pr02cu008.outbound.protection.outlook.com
 (mail-westeuropeazon11013062.outbound.protection.outlook.com [52.101.72.62])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49r26jm39g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Oct 2025 16:05:59 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mP2BQ/+cef2TOF7m8RW924Ea0Y6y/SDvGmr3HSKAW2R9kg6OZh1n2KtTKwwn54C2T1x9btnzror0RbYS83RmUtExdppoH4FNhp9grOpZIE64/Q6aRMLxcAEEbI79QsIar2a6DIXGobrUy2DabUGOWk7O9VE7vu9kO3aoY1bnoEG4Y87IVCSyQFZCpBaxZMy4Vv2o9V2U3PGINrzcBVAg5NOnbYHqwxK62/XIqQA5okTcxM7M/ZqpfVAeUZwPz8lvlXYQFb/TS8cP6Bj0ekTZkkQw6qIITGqJIe/kesX/6qrU+L86QlxnCYabA8uCqVKk0eK8PCiPLw9EhjnbvWRV/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=986xks46m3jKmL6RtAmuBnZl8heePbjEg/8hIBcpXz8=;
 b=gsFDZ9jsXs2DUe+EdX245jpwbGJm9XXpGYkU/jjCD5FLiFtCSHJV9O21Ab4R5kJjbLxQbGlBhYDZDaamOSq2lL8GHlnAmH2hJOmNURTR1G4RahMerBQDuz0qjStbngbsQrEdbC+kDH3gnCcCrE5589V4ZEjAJiNF+oje8AQFbwfyGA+Q/3PMcL2qldcX/0l6M5BLZcF9hXokqQtF6lekdjwCnxbo7g51nR/A8cymhrPoLUqHwI/0Saai2xBglzhBct1caGwAqwbC4LUOZXk/i9MlEd0FVaEf5IVZHwqrxbu5zdEEcpJvQ6IoI4B/g7DBslbq0zMbBnI1uvp4m6saFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.40) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=986xks46m3jKmL6RtAmuBnZl8heePbjEg/8hIBcpXz8=;
 b=mCZvPr+5ARii0qOVCaMB5a60jp3SG4Y71gWt7YmEgAfg4BwPYdms1YeCgmy25igHXz3OIEoP5E1Gv99SLGQO3y3JLDF774fTuDTt3pSnaK2ksJiBjvkOJYfxhbIxrT5CCoeLVCTlYh2jqJP2IADtmJ+pI6Zl75/K4+Sm6NgiIlMjKoSxxlAFfwoniJxEPq9FiTAH+cmvxh7Ta4TclfjEd/5Vlq8SfNmGc97iE4520kqcsF8W74ZBltMEWa33IEU2Qixfuuy90vsOEMeeyCM4i71oY+opClUG9y/W5UOkF5V2gkCE6c5FTtkiYiTbFPQQMRokw7Dgri+hKldRiNZfNA==
Received: from AM4PR05CA0009.eurprd05.prod.outlook.com (2603:10a6:205::22) by
 AS2PR10MB7276.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:604::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Fri, 17 Oct
 2025 14:05:56 +0000
Received: from AM3PEPF0000A796.eurprd04.prod.outlook.com
 (2603:10a6:205:0:cafe::4b) by AM4PR05CA0009.outlook.office365.com
 (2603:10a6:205::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.12 via Frontend Transport; Fri,
 17 Oct 2025 14:05:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.40)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.40 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.40; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.40) by
 AM3PEPF0000A796.mail.protection.outlook.com (10.167.16.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 17 Oct 2025 14:05:56 +0000
Received: from EQNDAG1NODE4.st.com (10.75.129.133) by smtpO365.st.com
 (10.250.44.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 17 Oct
 2025 16:06:02 +0200
Received: from [10.252.15.38] (10.252.15.38) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 17 Oct
 2025 16:05:52 +0200
Message-ID: <cc4f506f-0cf5-484a-a0d8-a2fdebdd4cc6@foss.st.com>
Date: Fri, 17 Oct 2025 16:05:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <u-boot@lists.denx.de>
References: <20251017124727.165192-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20251017124727.165192-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.252.15.38]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A796:EE_|AS2PR10MB7276:EE_
X-MS-Office365-Filtering-Correlation-Id: 86508180-6258-49ba-e67e-08de0d864ae6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3RvOFptVnlwdmVyOC9oU2ovLzRRMGFEQkl6a20yTU9BSXB0ZDlsWHNWV1N5?=
 =?utf-8?B?b3BGUW5lSmJOaGxCcTVDWE5nZ0UvRU1DdjUrbC9YYzFid09HSkhVQU85ZHl6?=
 =?utf-8?B?YkZJRTZsdkdnTjUwNFZuWWNSOW9nR0ZqL3pYZGFsN1pRSHVTOFIxRzduZ2dp?=
 =?utf-8?B?SlgyZk9JTGlONDhyZFJ4UlgxZkx4M3p5bm5HZTZzSlBLOGoyaVZSY2R2cDRM?=
 =?utf-8?B?ZnFSZ2kwaTJYYkJld3RmWHVnNlJtdndUeG1RcURHaDRwR1d1SlZ3TjJ5MktH?=
 =?utf-8?B?a0RVSlltVTJKNGVoYmdqcFVaSDRYcW5UMUJxaHJXYTkrMERxbUl1eGV5MzJq?=
 =?utf-8?B?di9Vd3JGVVBtWHNZZk1adUxRR3k5WmQwRWNiWUx4VmtGZzU1R3daZDNsMXNX?=
 =?utf-8?B?N0pUUjM4TGttNVpmby8zZE95Uys5emtwTDFtbmNOQU0yZkExQzhKT3BnU3Nl?=
 =?utf-8?B?bklpSHF3R2dtdjMxUzNhd1l3bEhUZysyMi9nbWV6b2VhMTVtOGswTEp0VTdV?=
 =?utf-8?B?R1V2QVUwTytPZ2pLQVg5ZVFQdExjMmlCVE9QL2F2QzhETENpd3dJZDQ3Y28y?=
 =?utf-8?B?ZnFpaExvSUExS25LZFhrVjRBK0NWUHI1QS9GWlc3SVJxK1JkREEwcTRFdVUv?=
 =?utf-8?B?QUYxSFY2R1pTL0dLQzVWRE5RNjhvcmQvMkxjSGIrRWhrMzJTL0ZuR2ZaRGda?=
 =?utf-8?B?a3FvRGx2RG0zSWx3REJCSm54VjVZK1NqcEFoMEhZMHo5bHEyWkM3VXZtRUxq?=
 =?utf-8?B?U3gvSlJwL21lMENVbjZZMy9yMUhrQjZ4ZjlJS1MrVUZJdTV0NWh6d3dmZDhS?=
 =?utf-8?B?QlNUK0RRS2wvK0crV1BzMlEwU0hNN3MwWmQvM3hYQUx0dXlvRStzdTc4UVFQ?=
 =?utf-8?B?bGR6MmVCTmwzN0xWUVpQVThleVYvRTRKekVieERFLzM2SEN3VkorNWJWNWY0?=
 =?utf-8?B?Zm0ybEoxVXpwWG1HZVVsWk95MkhTUWp5S1Q3RVNLQ1dPdEJyblRSZGNRV1JT?=
 =?utf-8?B?Nit5RktIT1dYc3ZpWGRFaWkyWTZXMUR1dkNKZzRIbUY1bWJpT1A4T3A3c3hh?=
 =?utf-8?B?MU11YVVrQ0NJSUtteERwUERyZGswS0NYR2w5VWtWZ3dydnhHK2FZdXZsdUlu?=
 =?utf-8?B?a0xHWTBOdHM4dTFvZGNraTJJOUVRM1dFWkFDOThQZmtESzZBUzBYODVralpH?=
 =?utf-8?B?TXlGWVR0dmx2c2RCSG5mYkVWL2dLOHNWN1pKRi9WNDhFWTlJQlVqVmdvamRB?=
 =?utf-8?B?bWN1U045ZG5SRUFxblNTUzNwZ0JiUUdyYnp5cnVlU3FUZDA4bUs4QXV5ME12?=
 =?utf-8?B?UXRXbGl4ZUdQUmhISTdLa3M1UkZMamtwSFJQVUFCY3NNQ3VUT1FxREs1eUsv?=
 =?utf-8?B?Z2o4RG1DTUhWZGMzNUNvQXloQUVXSDNadjBkOTBYajJzdVZTK3RYMGFNYVN1?=
 =?utf-8?B?dEFYbGh5SUdEK0VNSG1FODhmS01KOHNYM1pyaDBtYVZwWXJTMDdrMjJwWG1L?=
 =?utf-8?B?eGVPcFlNK0RUWGF6Y3B4cjc4RHpZL1NsVlpFSUZGVk5Tb0NPeFgzL2NCNity?=
 =?utf-8?B?MU1UcyttMzFmdTc2WW02Z28xeUU0UDlUSUU3ZFZZRXdmcEdOUzRkcklnV01K?=
 =?utf-8?B?OVFnalorMVBPbmo4cEpOYUx4M2hKSXU1YTBJSkN2Z0M0MCtxT1h5S3hURGFL?=
 =?utf-8?B?S3dvNmpJUkpVZVlpZVZWRXJjZm9zU2ZjOHg5cWNHS0lwMlo4YmlNejFQOXBW?=
 =?utf-8?B?L2ZDZVVPNDluTU51ZEhnR1hDVGJRci9TWlBQUFNSaHJYeDkvUGNBTTh0d1pw?=
 =?utf-8?B?NDk5MEN4eDllbk01dDJZQWwyWXBTRWtTN1lPUmVEL0VabnFjdDBJaGZOV1Bh?=
 =?utf-8?B?amtxRkJ0RmwxZUN2U3FBVzdvWm1IVDFmVkJEYldNNENwa1pGdjlvNlAzN0M3?=
 =?utf-8?B?SkpDZkhtdEFNbmI2dHJNcDZTT3VaL1dwTW1jeEJPUzQ1aUJyays2ek1Da2Qy?=
 =?utf-8?B?K09yVWloWXdFT2xnL3VyeEdjSEtkNEZ4SmJHMDJrOThDNDAxKytHZTJ4eHNs?=
 =?utf-8?B?WU54dithS1B3dkppbzh5a1R0T09EcWFXdzA5TmpRcDZBL041bSs5U2pZWDNM?=
 =?utf-8?Q?xBCY=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.40; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 14:05:56.5466 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86508180-6258-49ba-e67e-08de0d864ae6
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.40];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A796.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7276
X-Proofpoint-ORIG-GUID: CHfT7_8yGED5Lue5ebX6ZSL6VM5q8x4d
X-Proofpoint-GUID: CHfT7_8yGED5Lue5ebX6ZSL6VM5q8x4d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEyMDAwMiBTYWx0ZWRfXyNXoJqkbb6pr
 Qh1hHif47G/PzT+q8TQNOP+6F5ALC618VcyVSC4uHzvzogAo2sZ1NMdJsVRNOYHX4FaYFIbWsi0
 u4pUt98rjuiXdVhN+FG+4920JoBpmvVsm/HSyhdEuIAUe0dvCKWqO0NNhneZ6CPxLWMUtYidJBK
 MwGfCqMSP7rVaqEXs5QtBQdErjeLI23L/JJSgFRIZtQVsmRLeVHo6zgNoUcJj9Z6WdrPAI4UqyL
 KqSJsFeRsJUV5+2nXO0NNIBhW83dg3F9TLZwYKx1JYAprQFstgFF7BDtD12scGZb59RaWoy8A1L
 gU0Bi1m4REKFmb7BN0YblOXId+ZxIKYFGPwBii91swPSVbD7m/QpwON2TsZzioP5zKrjGVGQuTR
 6n8/qBOEd8HKJjSe6H2J7F6/M3wSnQ==
X-Authority-Analysis: v=2.4 cv=X5Vf6WTe c=1 sm=1 tr=0 ts=68f24d47 cx=c_pps
 a=6VOHUx6P+qOda8AKp8Kesg==:117 a=HHWmdgNZ66UcX3Fjl3KRHg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=gt-GhcMM7esA:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=8b9GpE9nAAAA:8
 a=KcADZbjFQnFhfubdJaQA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510120002
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] ARM: dts: Remove u-boot,
 boot-led from stm32mp257f-ev1-u-boot
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

I forgot an update, will send a new serie

On 10/17/25 14:47, Patrice Chotard wrote:
> Since commit 69542d06920b ("led: update LED boot/activity to new
> property implementation"), "u-boot,led-boot" property is no more
> supported, remove it.
> 
> It will be replace by /options/u-boot to configure LED device as
> described here [1]. /options/u-boot will be added directly in kernel
> device tree.
> 
> [1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/options/u-boot.yaml
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> 
>  arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi b/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
> index 7bbb3e00351..b70cd8b52ce 100644
> --- a/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
> @@ -7,7 +7,6 @@
>  
>  / {
>  	config {
> -		u-boot,boot-led = "led-blue";
>  		u-boot,mmc-env-partition = "u-boot-env";
>  	};
>  };

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
