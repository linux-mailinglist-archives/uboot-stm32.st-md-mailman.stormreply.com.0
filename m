Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F70BC5937A
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Nov 2025 18:40:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8926C628D4;
	Thu, 13 Nov 2025 17:40:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 954A2C628B7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Nov 2025 17:40:37 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADHYVqK524367; Thu, 13 Nov 2025 18:40:35 +0100
Received: from duzpr83cu001.outbound.protection.outlook.com
 (mail-northeuropeazon11012053.outbound.protection.outlook.com [52.101.66.53])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adc9sa08e-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 13 Nov 2025 18:40:35 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bRm4jBl1lwuc1n3gRtOCK7YvXUcYolLeb6h0EeJzuIhWYzfctrn96ShLRD6CcryQnVBktSV0uPO0vXotsCfzsFXERKWTpXa29HkzISS+NhvAI/9RWNK3f2FGvBoadvx1DYxDlAQ+O8jWH4/MOJNZz7wbPUpIV/DfXIVv+bQTjsT/swMgCjD25Vf9FnQRxRjHVD1oqJxh9k1h54YJQYGE4YWvJ+CdCfPwHQbd9O8ylpU9A4XxBakk5sMDk+DcXI9lbI/s2ZJbegu7TxiUI04xqGcvArw+jS5xz0wobykWqLKqXP6RgFHIf5hhZQ1KBaph755QFsdo2/6gWOrNeuaoww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRkUgqizc8FT9iAQjnToEzkFzDOjn1ORF/s9bHo++W4=;
 b=Sl6mEsk49hO60vQKlqomE0BJEaCb2xzbkltc0cyzpHDOVFJqGIopBaS3PS3ndNb9fYdeJ8xI6ImXmcHkVBj0BmJKRGK2ioMH4QDvDNLy5pjushfTJh+rvqUcYUGwrDAEvuOoFYGygb8sRI/RhKtjQz8/4uSwdoaRPmNXiIUffaWWmkdKXQszSYyLIWRaNZ7+ejAqJL+psudcE7zcb1LCGnZs7fF/TAwpBTOKCMsn0xtmOKJT483SiijUS9Y47kjXoslM8FwpwSY70CgV338ymDlmd8lc2b+1kq2GXF/qvTyHGdeAnbMVJwuZyPpxfE00wizQbyLzZr6vFWdMwM6HEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRkUgqizc8FT9iAQjnToEzkFzDOjn1ORF/s9bHo++W4=;
 b=R6mcnZYI69yEfRwkf2d6dgMJ+KDgwrZi8oWMnJTH/JJBA6xTjmKGQh1+km96hr4wuvd4TNq+7+MMb8SWeto1AFHbusFMfzwe70fuVth++fOBm4mnTx9HhvlEKFUGTfAuB6d4v5HCWXRklNgTmAaCfbIBYndCtqee2tIw+V8jDt+7/vklQWlpsM8ZwKX290RAPR+aWt/LcBJmrqWTZuQtB7WZ/vUH+947QY0kdlcFZ93JYR8l88Hj+EhdbujzZ75NCZfZiE5007NBxe7TXG5+T7PEM8tg0P1BzGvP4pFNE6rkf7R00lnNhPeE6WQLESLiNMPWhRNpFAt3VcWphnbcuA==
Received: from AS9P194CA0005.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::13)
 by DU0PR10MB6873.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:47e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 17:40:32 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:20b:46d:cafe::2d) by AS9P194CA0005.outlook.office365.com
 (2603:10a6:20b:46d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 17:40:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 17:40:31 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 13 Nov
 2025 18:40:43 +0100
Received: from [10.48.87.108] (10.48.87.108) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 13 Nov
 2025 18:40:30 +0100
Message-ID: <5376b470-3115-45c5-8851-e8572d33935c@foss.st.com>
Date: Thu, 13 Nov 2025 18:40:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20251017121852.109561-1-patrice.chotard@foss.st.com>
 <20251017121852.109561-4-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20251017121852.109561-4-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.108]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019B:EE_|DU0PR10MB6873:EE_
X-MS-Office365-Filtering-Correlation-Id: 9328044d-3a97-43b0-0917-08de22dbbe29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qm5kdVJTcnFheTBrODZjMkNBNFMxbEs4NG0rVXg2T05kdmMwWXpicUhGbzYy?=
 =?utf-8?B?ZEpQOFJ3RmkrUWtUeExPU2VvMzZMb2QzdVdjSkc4Mld5SGdPditoYUt0dWNh?=
 =?utf-8?B?TkRPVG5UU0tSNm8rQ1VWQ0lTOGxoYTB5cHpiMHlYNkhabXFQbXpXV2IzRjZO?=
 =?utf-8?B?N091VVMwZXQxODUxTVhwSTR2cjNkZ0VVNGhRVUdsTDFqSDNndFRPVVVoUkdF?=
 =?utf-8?B?dnpPQjhVczg5cEhHcVZZdkhIRDRYZEQxaVJTeVhJYlJIbWJVbmFTVS9Yb3Ix?=
 =?utf-8?B?WEV2SGVRMzlkMTRUMXVWOFowcnRDbUNwcmtFazl5bG15M0tzQ0dqSzdiM2hR?=
 =?utf-8?B?a3FGNUZTUndIRG16UHUxNWNnMW9iSHJXVmhzNVFIc1doTFlGbEFEa0NSdTYr?=
 =?utf-8?B?cnVIUHBCN2Q3alBIekJzOENEbTNWVVBMRVhpUXpVbXNGMXlxZE1WRDJtYmRF?=
 =?utf-8?B?R2hkVnRTVmpkYUtkMUtIdzFIL2cyQ1pTdWtiU3d3ZmdtYnJMRGorQ1dlb0k3?=
 =?utf-8?B?VTBEbFh4WXlrRHB4eVNHVi8zdDNRTVluajFaNjVNekVLUmhVbHFUdFBEZGx1?=
 =?utf-8?B?ZXVPVDNUdWlleVk2WmVBRVhCdFByRVBTQ29HZ2JZTTdzZTR6c3J5R0V3QlRH?=
 =?utf-8?B?S1BldFk2UllaMytuMng4SHVLR3Y1U3NqUUpYQW5QVmJyTFRpSmVkRmJ4U3Nz?=
 =?utf-8?B?NExjSmdaMjdjNkZzOWRvZmdnMGtVQ0xHWHlWUFk4QXRsL1ZSYnUydDhhKzhU?=
 =?utf-8?B?dnk0ZkFxdXJ0UU90SW5DbnpBYko0WTNmRHFlRXJVdUpsaC9OOTc1NXQxL0tn?=
 =?utf-8?B?V1k4WEh5YTBvakFRb0dTZkJKRmdqczVqSjVWRllkZDNNSVZoYkJ4U3Frazdt?=
 =?utf-8?B?ay96c1ViZnB1YlpJTjRCa3lPMjJubVVKQy9pTTJsY3pFaTd2UkJiSXZha3RI?=
 =?utf-8?B?OVZvbUlTbTF1M3lSanE2MnhESFpia080U01oY2JLRTlsN3lrc1puOFo5TFpV?=
 =?utf-8?B?NHJ1dVQwSVJDNmFHLzEzM01DcFNPMURpS2ZpM1FEY09wQ0t4a2t1KzV5aHR3?=
 =?utf-8?B?ckpqTUJ6WHNoM0RNK055TU00R1VvK2pzWHpGbGFDM2drMG9ueDA2dGxSNnJ5?=
 =?utf-8?B?TzRxQjYzTXRFWVk1WWQ5UU16VjdlQ2VsMCtsK0lCekxYSnl1L3Z6cWFHdFRE?=
 =?utf-8?B?ZEh4Wi9YVjhvTnd3YzBYZlRGTjhNeG45MndOVVcyVXZPWFFadXJaUDVPSURx?=
 =?utf-8?B?MDUyei9yZXJYTmcwYjNnWk9aazV3aXRsd01xc2I3eUsrZ05lQVUvNUZaOXd3?=
 =?utf-8?B?U3h1U1pGVTRvNDZiR2JGNC9tV2tJcDk4bU1HZS9udUJaOW1TbnRzZzRDYlRs?=
 =?utf-8?B?bFhFSDMwc0twMzNXVlNpTjlhRkI2VWYxMUUwOE1IalNWdkRRSUloTkMyb3Qw?=
 =?utf-8?B?cVZBTmdIRk9IbkZKUFVnVW50WWR2ZjA3K21OaWMrdlh4VW1zbWt0R2J2ZjFS?=
 =?utf-8?B?OUFPMVQxWlc3Yk1CSmk0YmFSOXZPVW1xb0xuVTNEY1h2UnltQXhxN28yckFs?=
 =?utf-8?B?S2Y4ZlVsYXNld0I5bWZmTzdNWXllaWE5Q01OcmU5UjgyNkRhZlhRYTVmOHBW?=
 =?utf-8?B?SElKek5mZFFqeW5jV3lBaGI4VzJWS05PVEUzM1gyUms5NEJUWHJMaEhuYjFj?=
 =?utf-8?B?eG93TDJsTHpBcVBJWnRWY1BhYUFUVjRxNDdMckJmQTlnRWh6MEJWZjhsZTN0?=
 =?utf-8?B?dUhnQ2NLYXZqTmNnZnZWbkQ3ejRHdmExN1pzM09FZzhyL3JJTXV0ck1vbHFa?=
 =?utf-8?B?aGxSd056dEtFd2ZKb21iR3FSMHVrSGZIUHEzVVhkSGdRY053aVV2Ulk5Wm1P?=
 =?utf-8?B?dTNzSW54QTRRT01iQTFyQ0lRbXI1MDVlR0hPbnVScEt4SGhxWnBpUWpUd09O?=
 =?utf-8?B?WWkzVHA3OTZORmFoejk5V3BrQ3FDcVd3d3VidDYxL243akFTaXlIRzRmeE5m?=
 =?utf-8?B?OEtZODZmdEIwUDZ6ZzF4SkZVbGM1MHc2UUxGQzhLRnZ5WlkzQnNRZlFrc21H?=
 =?utf-8?B?VDRpQTJFMWdYY3hhM0lmQ296b0FFci9MOHVZT21JT2IvYk9lbThOcDdsNmV4?=
 =?utf-8?Q?ZGkI=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 17:40:31.5932 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9328044d-3a97-43b0-0917-08de22dbbe29
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6873
X-Proofpoint-GUID: XPoq343cbGrboTHC5W3XeEvm8h0VAMT7
X-Authority-Analysis: v=2.4 cv=M/FA6iws c=1 sm=1 tr=0 ts=69161813 cx=c_pps
 a=CYtskvn99kYiF2UsZkebvg==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=q6CKDgr7omsA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=QSejWefRWs_1lVe0ePYA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDEzNyBTYWx0ZWRfX/YGnqMsAlobj
 N8o07szdOJwHLOQGfJ4U9l0K+94wXlDgLbgbh+C+PNR7tSu9rW25/CR4Bjeu5/Xn/FWkkIAq9kZ
 EAnfl9ZsXGMlYKwH6Jbv/hgyhK3njvmBlIadCqsB/dqubFmdU0MiA3QtDRlHehWSkJT9bC9LVzD
 uT/d4o7rbPzb54BiP5FjsdhVdBRjVgEE4ibwlGz/hs1usaYXBRmPD1HlDPjtS5qRIW/IMLhf3Hf
 8PZYnN+kOardKJRO9sF451lUBTDKuG7fQIgTeHj6Mu8DnqM77SpXoNC7pBjqRxMTrN0Tz1IOL5F
 5A1XMHzYKNCmyd1TryDEM7hKz82CZ3fDjeQLp9r8/++Ij8PNUVzhkN9dPPHSvhVZi8w9hJfGZTK
 RZSAbATikbPVb9qPeLXNjHRtxZsoZA==
X-Proofpoint-ORIG-GUID: XPoq343cbGrboTHC5W3XeEvm8h0VAMT7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_03,2025-11-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0
 impostorscore=0 bulkscore=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130137
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 3/5] ARM: dts: Fix "arm,
 smc-id" value for stm32mp25-u-boot.dtsi
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

Hi,

On 10/17/25 14:18, Patrice Chotard wrote:
> OP-TEE "arm,smc-id" is equal to 0xbc000000 but kernel DT has been
> upstream with an incorrect value.
> Fix it temporarily until kernel DT is fixed.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   arch/arm/dts/stm32mp25-u-boot.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/dts/stm32mp25-u-boot.dtsi b/arch/arm/dts/stm32mp25-u-boot.dtsi
> index d9aeeb6d510..ee82a0289e2 100644
> --- a/arch/arm/dts/stm32mp25-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp25-u-boot.dtsi
> @@ -39,6 +39,11 @@
>   	soc@0 {
>   		bootph-all;
>   	};
> +
> +	/* temporary until kernel DT update */
> +	watchdog {
> +		arm,smc-id = <0xbc000000>;
> +	};
>   };
>   
>   &bsec {


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
