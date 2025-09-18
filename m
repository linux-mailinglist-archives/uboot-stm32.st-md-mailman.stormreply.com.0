Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F35BB8312D
	for <lists+uboot-stm32@lfdr.de>; Thu, 18 Sep 2025 08:01:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A987BC3089D;
	Thu, 18 Sep 2025 06:01:41 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A163DC36B1E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Sep 2025 06:01:39 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I5lqRA006944;
 Thu, 18 Sep 2025 08:01:00 +0200
Received: from osppr02cu001.outbound.protection.outlook.com
 (mail-norwayeastazon11013037.outbound.protection.outlook.com [40.107.159.37])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 497fxhpu5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Sep 2025 08:00:59 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qVXKp2Nf12ggIWltH/IDYWYkyHxBU1uXZVE7ibmfnHtTxP3b7mmf+WF5ARrVID1Xz5W9yQCFyTtpXvjsHp638/kLVGBNWLJ6goYoYLAufSdICOdT/k/YicszaM0NYTRauuoCj/1tk8QBn5gFSM1pN9WRZtksNpN3dLUx/Dz9xpPSHpWKo/lHbbcRJpq+sV6j468QdFddOritWMtitUuQ5eLKmHjMAeSpa9irRhSzpxO40FUInqvFkAMCCPR4Ka+cMlCHprs5AaeZmFHv2MJeHp/FMacY1eeM4ZdFfTFZVUy8iT+AcGEYA6l48nv6Swkviuo/SQJG38zvXg+YL98ddg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8lww97U1so6kavD13ZW90zXHDVMn5+6WOJTeAIFYDLM=;
 b=wG1me6KDgApJN0oCbthZ5TRCvJTYAW6L5vp0YDPa1JU0V22x3bgrr6c8YhUEojsUcxq+wo8GbuCjsHwKXQUIG5QTdSpBCGmo85d/B3FxqdUb4qe52lo32t2VapOOcIt6b0tp5LvyNX9PkIXIY3rNYOUgh1A1VC7s+QMg2ErT1Z6EoLDuQiSXF9SUdh5p1JkB2dGRRMxugnIdfbEtuACYa8OLNxtY0flU8dRF4pruqoY3+J/kmfoqMRoTHkoyvX2MUVdWd/ryzruN41ndJOv4FRzYhygClPBGjj7fQsLir0JcBISw/ZFkLEqnKojWnSt3/M55RWUgiFZOrN7hReQ8Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lww97U1so6kavD13ZW90zXHDVMn5+6WOJTeAIFYDLM=;
 b=AvJErV17onAHxHW/KVEbHyvrFFkhwTIIIDXgnm+OeqmjSHV/dwvIhuVFAxDs6SS/S7rr34TQm4uvdyzj2glug+kJk9/Gi5mu8eOjNZ/Tu+Dcex7jXv9TNIhP5/aH8R8kI8uidiWyQOpPwDd3kLHd18xtoZBfBg95czWDuq7Vl0ATWHa4lu/kRRg7zywKT8InpExTOxPX5nu6tXIzF6fZzuXLJapOJPv6g+Flpy5lEsvSWcTl376fZbxElH2RgKwf0CKUlZIBfpVQiZrAkhdBmVIWmYg+yrf2XCYU7eCZTxjT7+rDEc5IfrYUqHi0cLyws12QV1RjP87E4B59IcboHQ==
Received: from DU2PR04CA0354.eurprd04.prod.outlook.com (2603:10a6:10:2b4::7)
 by AM0PR10MB3553.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:15b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 06:00:57 +0000
Received: from DU6PEPF0000B621.eurprd02.prod.outlook.com
 (2603:10a6:10:2b4:cafe::17) by DU2PR04CA0354.outlook.office365.com
 (2603:10a6:10:2b4::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.13 via Frontend Transport; Thu,
 18 Sep 2025 06:00:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DU6PEPF0000B621.mail.protection.outlook.com (10.167.8.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Thu, 18 Sep 2025 06:00:56 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 18 Sep
 2025 07:58:31 +0200
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 18 Sep
 2025 08:00:55 +0200
Message-ID: <44c81e24-81b4-4904-bcb8-d5f9144f3adc@foss.st.com>
Date: Thu, 18 Sep 2025 08:00:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20250808151154.472860-1-patrice.chotard@foss.st.com>
 <827b1b5e-ac74-4710-8424-5bf0390441f6@mailbox.org>
 <9c805dc1-fc95-4d01-99cf-306264fd4b2b@foss.st.com>
 <905b7b4b-a216-4bdc-868b-5b38efb61317@mailbox.org>
 <d7d281a2-69c4-4bc3-8392-dd772f889a18@foss.st.com>
 <7858181b-5558-4249-b9fb-0d17ea5b348a@mailbox.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <7858181b-5558-4249-b9fb-0d17ea5b348a@mailbox.org>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B621:EE_|AM0PR10MB3553:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dcccf4a-8e73-46c3-add0-08ddf678bbfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUg5UWdXcFVYYkRERzB1NHZldWZrcG5FWWJoNERFZS84U3lLYVVtUHRyd3A5?=
 =?utf-8?B?ZnIvRE1RVXppb2dCY3F1d2VseXhPM3phT3QzczBBSFBWL2xBZmhLUDNhZWZH?=
 =?utf-8?B?djF4OTdnbjZka1B5NWtIdDM4ZnlaQ0lMWS9rbWI0ejN3NDQxc2J2aFVxSkdx?=
 =?utf-8?B?NTZuZnE0NGFQSzUzSEtqblVlcVRVVjdqRzZ3QUdLdm0zeDVMOU9tK3U4VTBa?=
 =?utf-8?B?YUkzSWZIaTBCc21CWG0wUllvYW9zc2NUUk0yaXp5WFVmcHFra2Izbm1BU3FG?=
 =?utf-8?B?S2hEZzlEc1lQWWdYdytrckpIZWQ5MWJlYUNlb3drVWRMNEd4bFVaU3QxMDNj?=
 =?utf-8?B?VHE4RStwRUUvRGJCVnhBUEFmR3BtNEg3WXEzZlJsNktrczF1eUxmU2hsWG5I?=
 =?utf-8?B?cnJkVnJ3bDJOSUh4ek9QMUs1R1o5Nkx3cDVWOFdONjNPWCtDWWoyeCtlOUkz?=
 =?utf-8?B?dFFoK3BkL3VSUnlMRHNNTWpTelVaamRyZWpaTGpwbldVbjE5cWRtcWFsbk12?=
 =?utf-8?B?RUxkZWJnLzhrR2pySUllc0M1ZFFsWk1KNjNzaWtlSXNmS2NLZExNbGFxbEFZ?=
 =?utf-8?B?bWV5L05obDN2dTZYYk9MZDhvL2R6RGJ2cTg4Nkp2d3psRkFYbzVwdi9oZC9r?=
 =?utf-8?B?Ykx3dUR4SkZqQ1NoNWJVQXlwckIyWUk0dkR3NGJlcm1TM2JLbnZLcGl1NnUy?=
 =?utf-8?B?TWxLYXhYa29kTFVlbkZJVlYxRGlxZFN0ZHV5OU1DeWxXTXVzSmlZNW5XVDlV?=
 =?utf-8?B?MVdaMWRpbloxeGpSem1lMVBvSzZCelF4eHljMU8zeGwrR1FKdnRoVkN0K1Za?=
 =?utf-8?B?cWdGcmNqT0FjLzZ1UDM3QUFKWW4zUGR5ck9ORnZXODU1ZnNUc2tNNUJ0akN0?=
 =?utf-8?B?d3F1Zmd0UWM2Tmc5S09ueHk0WUdOUUxSa0l3d09oUGVkT211N0NLR1h4dE1i?=
 =?utf-8?B?K3FpZk9XZEpNVEYxRUlSdWp6MzRlNTB2bDJJQ2w1T2VPaDY3MEVOekVXakNT?=
 =?utf-8?B?T3N0VUVic1MrV0xXNEV1K1BjQ01iN2lkQlhHSytLVXhaN2EwaEF0TjE3bU1H?=
 =?utf-8?B?NnppYzJOSlcxd0F5UDVxNDNhK29OS0Z0ZE14ZzJuNHpsZ3Q0WVhaT2hXMVVI?=
 =?utf-8?B?bjF1N0VaVWNacURUblNYRUNvTWphWXV4c1NrTWg4aHdlaXRNd09uaE04SEYv?=
 =?utf-8?B?ZXF0eGNpbTZ6WVB4WUZ2R1lLQncxVnRzUE84UTlIKzdYY212OTJidGhhNTM2?=
 =?utf-8?B?Rk5YblZYZmYvV3JSVVRrdGJTOVRIL1JJNjgvbmtoVlB4R01QNEF6Z2FVSXJj?=
 =?utf-8?B?Z3JKdzdJOXVoVnJhNjA4cndmL0ZFSFNSME16bldDRW10a2Y1dyswdEpxVEIy?=
 =?utf-8?B?Umc3U2RaclYzeXpjV1p1VW1TbHpsa2ZBVFdqK2JrTnF3dHhiL1VXUEVNT3Rj?=
 =?utf-8?B?Tk0ySkRJYnR3MVJoSFd5SjZSdUhSaURUcWt5cjhEQ013dGthQzluQU5CNUdI?=
 =?utf-8?B?QUl3S1JhaTkyWDNuUHNteVZra2RualFGck1RT1Y5SDBNc0s4TnQwQ1o5cy82?=
 =?utf-8?B?NVZQMTJKc3B3ZEFHanpnc2JWMVYwZHFkMUYwQ3BlbXh1WjE3UGRRdTBBekRm?=
 =?utf-8?B?aVZlSGYyNFE5RDhjbVNKUHZGVnlkYVc4aG1oTzhIK2NCYUhwZlZJV0Rkc0Ny?=
 =?utf-8?B?R3dWU2d0UkdKaFlhSEpPbzMyY0c3MXg5bUJqeUEwV1k4M3NrUXBvVDZKeitR?=
 =?utf-8?B?YTMzYWRqM2x1aFo2R0F2NXQ0M0xiK21CK2ZxVUUrT25jVE0rZ3pwV2hPekxr?=
 =?utf-8?B?RlBzS1U5OFRRZE9rdVlwQUlud0dQN3A2ekdyekpQWUM3M2l6SFhnL0huMERi?=
 =?utf-8?B?MVNQRjVrODRjcU1kd2lnSGFLRDMvWUtWUGJmcjBkdnUxQ0ZXQkkwVERXY3dM?=
 =?utf-8?B?eUZOcG1aclNUdUtFUHlSWjlMWUxNblFUemx0ZnNWUmY1aHQ3bmJyd21rU2k4?=
 =?utf-8?B?WXRpWWduZWhNZ1JrTXF5MURPbE90eS9zNVAwdnNCM3ZiNUpGMVo1RDNxL3Jp?=
 =?utf-8?Q?OEbUlC?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 06:00:56.5670 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dcccf4a-8e73-46c3-add0-08ddf678bbfc
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3553
X-Authority-Analysis: v=2.4 cv=K9MiHzWI c=1 sm=1 tr=0 ts=68cba01b cx=c_pps
 a=oZfv9FnKtbB9n5TwrAimtw==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=SAHXIHsbQyQA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=F5yVZlXVWeG0AegO3n4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX8eaOIvIDq/wg
 OPH6X+PiuGT2MMDtMYBuyQO+ES+hMNmMHzvD5YceGYxEZfvPDfqDq0xGmLxDokG6YZVy0saSzME
 ch7245C2AJqBrYDu5p6NVwNM2iAK45F++ZLeslY1DlyNDfh/uJCFKFMpdBVedrCs4SP1wes1x0q
 imW7yZUgC97/Z9DF5mrQiOOEZ8erMQ7IxA6rvF9kw8kkUHKYDmc5+cv1119umwMHb5tPTaNjVKS
 olSNLzSHaAchjZ0URuooPXL9CeULW8MjFUTxsGWYNM1lxluJCs2k6z860N3v85YgxcKIzoiyxAE
 IH08XV5Z1gGsv0Tl5/STRpxGPIKVZ3DGoXwofK6g4B2lzGOlnJ/EeIAJnU/saZ1ugfUAnZ1eiB2
 VxsDQ+8W
X-Proofpoint-ORIG-GUID: 1vUWmsaMWPxD3UanEXo3IFB_e4y40nRN
X-Proofpoint-GUID: 1vUWmsaMWPxD3UanEXo3IFB_e4y40nRN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 clxscore=1011 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
Cc: Tom Rini <trini@konsulko.com>, Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Alexander Dahl <ada@thorsis.com>, Cheick Traore <cheick.traore@foss.st.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Utsav Agarwal <utsav.agarwal@analog.com>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 John Watts <contact@jookia.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Stefan Roese <sr@denx.de>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Subject: Re: [Uboot-stm32] [PATCH 0/5] stm32mp2: Add SPI flashes support
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



On 9/15/25 02:07, Marek Vasut wrote:
> On 8/20/25 3:11 PM, Patrice CHOTARD wrote:
> 
> Hi,
> 
> sorry for the late reply.
> 
>> If you refer to my previous e-mail with the stm32mp257f-ev1 boot log,
>> with the following upstream components:
>>
>> TF-A: v2.13.0-304-g000fe221b8
> 
> It seems this is missing PSCI implementation entirely, right ?

Hi Marek

I got confirmation from Yann that there is not yet PSCI support for STM32MP2.

> 
>> OP-TEE: 4.7.0-26-g847ee2932
> 
> This does not implement SCMI, does it ? Does it need SCPFW or something as an external dependency ?

Currently, in OP-TEE, it misses PMIC driver and SCMI regulator support, it requires also an SCPFW update.

We expect to add it in Q4 2025.

> 
>> U-Boot: v2025.07
>>
>> I am able to boot a STM32MP257f-EV1 board.
> Were you also able to boot further into Linux with this setup ?

Sorry, i was not clear, with this setup, i was able to boot until u-Boot console.

Internally, we boot upstream kernel with downstream bootloaders (TF-A/OP-TEE/U-Boot)

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
