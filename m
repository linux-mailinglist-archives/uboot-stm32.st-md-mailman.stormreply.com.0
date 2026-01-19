Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDFAD3A9B0
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 Jan 2026 14:00:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF81EC87ED8;
	Mon, 19 Jan 2026 13:00:06 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DAB9DC87ED4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 13:00:05 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60JCtm36259851; Mon, 19 Jan 2026 14:00:01 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com
 (mail-francesouthazon11011068.outbound.protection.outlook.com
 [40.107.130.68])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4brp8qbn2c-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 19 Jan 2026 14:00:01 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pi+S968kz/yAk25iR7CCItaLjt/rK0U5V+RMFvjXtFNRh59xPDaRs4yD71xVVCJ8yBLYNk8shGEZDYNT6mA2Q4mjcM3m6M6LdgcLS/69ceLalMS2UxRW/Afb4WZgFAryc3FUd1s7I5MHhssyyzp8K6qURuTwkiJY40HWZK9N6K3QddFaK4K+Oc8t8h8/YeCzxA28blmSZr3MiWPk+p9iSqUoQUN3R396u72cm/raZCHfvl0gzenyXu8YQUxyZuBPBdKMzJXalI6CCX2am0DO1NzIh5Dw8spFdNG6LhEoLrcb9KOfs1a6esoF3v4jdRBwNcjCqKL/K9MAZgeebJ7o+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WL7b6t0dNiBH55uG+n+5776HDo2NtGD0ksKJD/h+gTw=;
 b=D7eqOL1Kk6/w3UJFaKIMJ+Ka7od6uKJecwaOWU+CaCmi/uJvobrNzjsJ4KgjiC1TXi13hNyR03gk3KZ3tvZL8u5xNlg3CVyG3ar8HfNGhQJlZa5dvo3pmLj+7H7Lg5CfpqYkvEKbU9t9AlTkk7ter8pB+h6DcMSGu/WU/eciyKgujMeB/F1JS0XJxD+KT0BIiUHHmIlrbCiLoFIXh2hr84o0WH9OwIYDUflOPj6duTd04SvK6TUadcTk+TmT5SHRsVScgKLy2OZ5dS3lbSaVDdFjynLJu4NSpW8d4qPiDrHbxIx6G/iM1uFuC5lOkjbwZVEISJpFykVk+h5yZGOrkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WL7b6t0dNiBH55uG+n+5776HDo2NtGD0ksKJD/h+gTw=;
 b=NL3Fy7VFeQ6LL1Lmq0MToc88bEgBDLSB0XAHK3koND9pGc/xwLOtC/ugy1Xfj+ILrH9iU6WjuZWZYnZSpaoVM04uTRSKXSqe+j3Stj8T91neRQVUOmSkHHqVxTvIBbUr+S828z9jul0GTJeRrtynLakfqnspxvawGTUV5B4TcDHRAO4gNSNgNb2YZ0kx9Q1iCT6sfzaKYe551ro/GuNwNnXrWByZk9LD/9le8y4asdt9GM4KJ4WhJXOMhaTAkKcZyqcaBU7B1IfxiEAIBwvuBL2Dj5EjmL6MPJrxqVepe3n79OynjS3uFt37BWtnwlvNVfIaJlIuFJnqA48RxOOsNQ==
Received: from DU7P194CA0013.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::29)
 by AS1PR10MB7936.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:471::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 12:59:56 +0000
Received: from DU2PEPF00028CFF.eurprd03.prod.outlook.com
 (2603:10a6:10:553:cafe::aa) by DU7P194CA0013.outlook.office365.com
 (2603:10a6:10:553::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Mon,
 19 Jan 2026 12:59:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028CFF.mail.protection.outlook.com (10.167.242.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 19 Jan 2026 12:59:55 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 19 Jan
 2026 14:01:23 +0100
Received: from [10.48.87.244] (10.48.87.244) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 19 Jan
 2026 13:59:54 +0100
Message-ID: <82b9a728-ac40-4891-b926-42c60bebaeae@foss.st.com>
Date: Mon, 19 Jan 2026 13:59:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260116-add_bootph_all_for_ltdc-v1-1-de4dc0ae1115@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20260116-add_bootph_all_for_ltdc-v1-1-de4dc0ae1115@foss.st.com>
X-Originating-IP: [10.48.87.244]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFF:EE_|AS1PR10MB7936:EE_
X-MS-Office365-Filtering-Correlation-Id: d371986b-233a-48d5-589a-08de575aa4bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UnhOVjFaNEllVHVEd3NBNWNDV2phd1FGM1hHMmZrd3Q3cC9PaFpTMU5qdzYy?=
 =?utf-8?B?VjBoVGlOY3V6aVdTUnNBb1hKYjFHMERpaXVhVHcxWWV6SGlzWHNnWGpsMVhR?=
 =?utf-8?B?dk8yeFVDekxERXhKaGtGeGdBdGMwVFV6TjUyZ3l6MStDREhLSmt0MkJjL3Ju?=
 =?utf-8?B?RGl2Mi84YXExbVNGbkx6bUZIdWNaakR6N3YrZkNVREdxV09pTHFJZlMvZFJE?=
 =?utf-8?B?Qm9RWWN5QnFVUUhhbE5XSDZOVWh0REdtMm1kcHRRSVBONnJtbUtrQ3hKdzJO?=
 =?utf-8?B?VDMyTWEzRGVPdjNDWWcxcmpZRUpnUTRwcVlUSHhVMXlWdlI3VW9mRTRybTJx?=
 =?utf-8?B?UWk3VzlYbTBzeXM3NUliNWtzdUdpK0J2ZjQ5Njh0cnZkb1pML1hSRVlXSU82?=
 =?utf-8?B?Y1B2M1U4ZmEyaDVYU1ZEZEQrM3AydVZQbnBNR2ZISzNsb0djdnppS1A1WU9m?=
 =?utf-8?B?RUlnM0Y1T1o4QUdyOXV6dEMvM28rNkZUa3RqYTJTeWpvT2FqdDRGQll2bVRt?=
 =?utf-8?B?Sm9iSlBDQzVhTnpGVVpxdktUWkJTRjMwdGJjR1dLZkdyNWRiV0RUUTFLdmpa?=
 =?utf-8?B?UEIyckV0MlNDU1Q2TS9vSEp1SEg5dlJ4dW9uNDRZZ1Q5bTdxWnpxcHhSeVpW?=
 =?utf-8?B?cGtrMWt0STlUa3FlVW9PU2gvcEhFRTJMRVVaM0tpM0dLUi9kMDhCcjZNVThq?=
 =?utf-8?B?V0xjRjJwMFFOQXRDZlZkSDF3YUxOUHRoMHNYdUdaYmdmUS9YUk9BSXFQbjhR?=
 =?utf-8?B?Uk01WFptZmUySDVRV3NGeDJ0UDgzY1lrdzNHMFJiYVEzYkNzWHB1UkR6SXZO?=
 =?utf-8?B?SlZ1eVl2NkpMZkk1T2MrTmxHdHVqbzNXTWdCeWUrNmlsQkUvODFhY0t5SnAy?=
 =?utf-8?B?MkF6RjZLaHYrOFplMWtFY1A5cVVHNFZsZ1FhbjlnNDI1WkZzSTY3SDJCOSt0?=
 =?utf-8?B?T3FBQStUY1NSWE1LdmF6eTlwalpDeVFHWmVWdnNJUVVka0dLOTk5b1U4RGN2?=
 =?utf-8?B?cXhwKzVEZVYwSVVyclkveDF1K0pLZy9WUzdXelFDZ21SUVp2T294RVNlZWZN?=
 =?utf-8?B?YWVGMmlSVHh1M2NOejQwZlQyb0tFUzZEN0xaMFZUamFTODlWNGRxMVdMOVhP?=
 =?utf-8?B?VXFGTFNndmdCUGYvS1JaS0l0R3d1ZTVwb0x5ODFaMWpkQ1VvMVRYY2lzdDZo?=
 =?utf-8?B?VTRKQmdxUzhMR21Yc2Jud0JtOVgzak13dzdqaHNrcnlsUkZyYzZjZGZFa1lF?=
 =?utf-8?B?ZlEzZjRRdUo3TXpwbTc5V1AwYm9YSjNDdmpXNENTYyt6S0JRUHBhaGw2WXJP?=
 =?utf-8?B?ditvYjczQmRhYzhFWSt6L0lPVUczdWN2TGRLd2lrRmZtMU1LcUpYUkRJcDlO?=
 =?utf-8?B?dWJESjJuSTNoZzJ1aGpFaVBGMWpVdkJVT0dEN2tKaGVGRTI4MFVXU1FoR09X?=
 =?utf-8?B?OUJ1MFNMc0JHOXpJcmMyZEdLb3JiOWdnTlBjVE11Z2UyMzlQUWNpM3hzajEy?=
 =?utf-8?B?Q0twcjlSblRQQ2tCdVNNcmxYOWpDTzJud2VrUFpxcnM4Sk9UbXdtalcrazRh?=
 =?utf-8?B?VlY4YXlqcUFxSFFZWWhTbFBlWUNGa2w5VE04ZXRTU2FnWUxibmVrSXBtZEFy?=
 =?utf-8?B?Z0Yvb3FzdldMeEUrSDlFUURpR2JsQTdiODdneDlGZjlIYXpkeUFlV3Y4bjQ4?=
 =?utf-8?B?ckpFSXlNZEhXbU1nYXFESlFPSmxOeXZ4YmVOc2dURG5UYk9oSk5yQlFxLzdi?=
 =?utf-8?B?QUVUMTVjaFZkT2t1QThzcWs0K1VCZDhWeTg1VmkxMFVCQzFKUWJDdzd4QUNL?=
 =?utf-8?B?a3JORUFCenBOL2VHWVhidW9mK3pJZHNQNXFnZjlLc3JwUTlqNHNrZFdYbFdW?=
 =?utf-8?B?VEdEa3YzME9vTWZvNVNIeU9hTWtnZittWkFXd3JJZ0dtMnNhRC9JL1R0dERD?=
 =?utf-8?B?a0lYTkYwallFbk9zYzJOaG1wc0NjdHpnSEJseDNhTWFlMjNaS3lrdm1Td21Y?=
 =?utf-8?B?MmQyeUFhNWY2dlJIK3VOM1pQdXBWNFpLWllGOXI2SGVNamdYeFFmbEFDa2RQ?=
 =?utf-8?B?WHl0Rlp5VXZlTUZ3d3Z3UWJDbEdsQnU2TFpyZlNsTHU0K1BkZTE1WVRtVDlY?=
 =?utf-8?B?cXRScWRwODRpYmlwWUErNnhJRkkyZ2xFM2dJN05ERzVGTzAxYnVudkFXNm1L?=
 =?utf-8?B?SjRqVm1ZNTVXb3pSbzBQbFZYVDI2TWw4RWlBSi9vZS9qdW5ra3V4bG8wQlV4?=
 =?utf-8?B?eENTazRlZ2lFSkpzemU0cjNBMm9RPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 12:59:55.4457 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d371986b-233a-48d5-589a-08de575aa4bb
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028CFF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB7936
X-Authority-Analysis: v=2.4 cv=Hod72kTS c=1 sm=1 tr=0 ts=696e2ad1 cx=c_pps
 a=mz1NlW6HHTSgm2pkSWtY0w==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=vW1nh7Jg1_YA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=iTBm-aEsajPn1wyuNV0A:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: onljYUHREEsonzCVcns0bw0hyDg6LNaU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEwOCBTYWx0ZWRfX3aXTTaQw1cBM
 sbN0v3JTBMb2jYOqoaK8UUawmFbJUiutvucGtuPBRSrfVr+nnSt5HvAZdoOUGv4YJv6/f5ClSNa
 ie5JjctKnRm1P9hKOTdarmb9Atj2jC+7L7U218uYNa6n0V9MdeHqVhl2I1Cp4CjJ+mGp5d8P/1p
 8TfWxzInjOwAsvm7OEkCrMKWYLCgrYJw730jX+FRt3lH937JsJlHDjnNsoJM2DriQ9Dh/TRBbR8
 g2lrTaC/2ka4IOr0k/Tnr/X5Y4xf1RkFOU97fUlBqqtDclL8NCHSO1EIuLINM+fvV0zmx57RbJH
 X/NRhmPVS/wN1CdriL82svzH0KmrNRn84g0JG06HLF8D9ptCdUO7E5tJ2hyZ4Cx28yuDSAcWG1E
 ThcH8HEFUBWvrKO9mByYStnPSoZ3j81RatBPwqEE7/2DHpo9vc4j5F3+VSU4oewHjWLDoPPXJs3
 mUvR8NIo1LIaGeTIpHQ==
X-Proofpoint-GUID: onljYUHREEsonzCVcns0bw0hyDg6LNaU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_03,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190108
Cc: Tom Rini <trini@konsulko.com>, Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: Add bootph-all in ltdc
 node in stm32mp257f-ev1-u-boot
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

Hi

On 1/16/26 20:12, Patrice Chotard wrote:
> Add bootph-all property in ltdc node in stm32mp257f-ev1-u-boot.dtsi
> to fix the following issue :
>
> Video device 'display-controller@48010000' cannot allocate frame buffer
> memory - ensure the device is set up beforen
> stm32_rifsc bus@42080000: display-controller@48010000 failed to bind on
> bus (-28)
> stm32_rifsc bus@42080000: Some child failed to bind (-28)
> initcall_run_r(): initcall initr_dm() failed
> ERROR ### Please RESET the board ###
>
> Fixes: 29ab19c2bead ("Subtree merge tag 'v6.18-dts' of dts repo [1] into dts/upstream")
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi b/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
> index b70cd8b52ce..c3c9c94f165 100644
> --- a/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
> @@ -52,6 +52,10 @@
>   	};
>   };
>   
> +&ltdc {
> +	bootph-all;
> +};
> +
>   &usart2 {
>   	bootph-all;
>   };
>
> ---
> base-commit: 1da640cc46ad84efb57bb45e02dd6c40265b5488
> change-id: 20260116-add_bootph_all_for_ltdc-c7328f86b162
>
> Best regards,


ok as a temporary solution to allow U-Boot booting,

waiting same patch in Linux device tree and DT syncro.


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
