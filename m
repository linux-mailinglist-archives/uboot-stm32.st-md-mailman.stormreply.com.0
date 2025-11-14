Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 434FCC5E52B
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:48:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BFACC628DB;
	Fri, 14 Nov 2025 16:48:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91D29C628DA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:48:35 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEGRpRP2716309; Fri, 14 Nov 2025 17:48:29 +0100
Received: from am0pr83cu005.outbound.protection.outlook.com
 (mail-westeuropeazon11010019.outbound.protection.outlook.com [52.101.69.19])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7m3u2b-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:48:29 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aIdjuZlqegKbLKnCmIojzATis2AURLFbPG6g6W4amp2+obLovIS7kvhg3PafcwiIEKBWtYOvU2/XYi8EcG2I8RWSHUp5sI1xSGUJSXwf4PPL1I7ctzKRdpxhnwBcIZ3WR9taL0as+IZ+vrip5kssKz8mZkN/v65mlnaJg4ociVnSMAZd43YuaoClYhFmFCXfhaFACCIcbF2ElINiQO9/ZoEkn8MP/z2NeB6bSt5UNw0diiTUI0BYwxQDeAGGuMhdRMU2kcpOEFwiS6B+tvNIbSgeauIjZpInoh4Y2JKHSkCW7xPV8aYmIRgwycNpBY9t/i/2ktr2Qffw6KO1qxYm3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I3tZdT3QHx7wJ3K9uaqzvUDLEs+cNVj2vp8yqaPLTa4=;
 b=WoeNcJIliPURvXZLF58ToZtfxjOGN4VuD2vQyZ5CT7P2STPX1Y2VfGnvi77wqi/MiBwvaImY1SuVbM9D1rZ2VovGXSMakoGgNrK3Fn5MHxWkqD5PdUhTTn9MM7x3b9UTiMMf5ZXnNQgOsqA8XrCDIqtaaSKXOk84emsw/yCHvog/9bixi1Re8MziyxnoS6BH2EaBe7/fzQfUyvBVNwt9L3JWc+Ma+zIh+8sroZVWv3t3TjaUToUiKLzrQAGvhuEuQrnHtPx27hkKVrRDqqygJGMaab8zdnLAclJQyECJO4ddYkU0BOj1nkYDwnHVeX0OKGDEvOBwkOPuiVt9ApalCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I3tZdT3QHx7wJ3K9uaqzvUDLEs+cNVj2vp8yqaPLTa4=;
 b=fXWCGeyo+niseMsQmJgIk51Sx3EVbYZOJ5Ly9KXCw5MpbWe1AwHydiBRygISZxbyk4p0tkkXjxcrPzNnn5i8gQ8yoCioz9afu/oBHcaRUiHxO382X0kCepxMufJR3HproVBQ2CjxEMUvwz8b+yzOkQHgKonDkQdWEJYpmV3D0YboX5xUcICoCNievObpsSaaEzUwVkMpUMWU1H1dhmgZm39PCjxfRR7ZChL78koCXWj3mNJpdo2ojwluSkkQC2r7SmIbS4ERHQRw4RmmXc+yiys5UJS95zXzrXhJpSodxIgD/c619s8H1wgc3bOtOOIzwRii8Jt/l8o3PaWbJxUhew==
Received: from DB9PR06CA0009.eurprd06.prod.outlook.com (2603:10a6:10:1db::14)
 by AS8PR10MB6078.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:535::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Fri, 14 Nov
 2025 16:48:24 +0000
Received: from DU6PEPF00009524.eurprd02.prod.outlook.com
 (2603:10a6:10:1db:cafe::d2) by DB9PR06CA0009.outlook.office365.com
 (2603:10a6:10:1db::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 16:48:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF00009524.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:48:24 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:48:34 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:48:23 +0100
Message-ID: <9eeba163-4a28-4c9b-86a3-c93ad09f9423@foss.st.com>
Date: Fri, 14 Nov 2025 17:48:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Tom Rini
 <trini@konsulko.com>, Kamil Lulko <kamil.lulko@gmail.com>, Dillon Min
 <dillon.minfei@gmail.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>,
 Simon Glass <sjg@chromium.org>, Sumit Garg <sumit.garg@kernel.org>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
References: <20250904-master-v3-0-b42847884974@foss.st.com>
 <20250904-master-v3-7-b42847884974@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250904-master-v3-7-b42847884974@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009524:EE_|AS8PR10MB6078:EE_
X-MS-Office365-Filtering-Correlation-Id: 253ee2ae-911f-4d4f-6c32-08de239da07d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cW5mT25sTU9PeHZlSkJldnRUc0l0R0luZ2tybE52NnNUaE55ZGQ4aXNUQXda?=
 =?utf-8?B?bkYvZ1Bnc1lXRkI2ZksrKzZhNXZNbFBOYzdwV25xSlRUVFhTb2hKY0lDRVoz?=
 =?utf-8?B?Wmo0M0RXcGFJaDBRY2pRbTJlYWJFWHNrRjF1M29oUy9GNVM3dnh2WTAwZGtj?=
 =?utf-8?B?UjhrcWEzMVBSck93eUpQbmMwNjdwcmFKZTdzR0IxeWlCQkRyRkMvSlJoamJP?=
 =?utf-8?B?a1UxSWdPUDJqaGVubHlid2xvVlNkNGhtL1ptOWhzZjZsMEVDdnVlM1ZKL1dq?=
 =?utf-8?B?bjNiOHN1MlpGZHFQME44T0FsMVF0Mzl3b29CaE41eG1aOTJ5OWtpVDJOUlFt?=
 =?utf-8?B?cUVqR1BGQllOMWRNV1liaE1oYThVODVFZW5TK3NSYW5JQ2ZGU09CZjN4d3BV?=
 =?utf-8?B?YmZuaE9EdS8zN3pwbEVmSStVTklGRFZ6Mm9HNUhIMXJDTUtlRlp3ekFGTGVE?=
 =?utf-8?B?ZjBua2tBSTEzOUZjbnF3ejY0bWtGZk9QSkcydTBJMDQ1MitGVndhQ0w2c0lE?=
 =?utf-8?B?Skczc1B5L2xpNzZCL3B5OEFjZEh6THk5aCtpOEhMWTRqbUY1VVRJNGNoU3FQ?=
 =?utf-8?B?elZpK21qT3Q3a1hhd2FCMnl3dGNZR2RkUnZJVEgxMkFCMlU4Z1o3TFhFUThZ?=
 =?utf-8?B?N09QVFVnRktjZGtVNkhIcUI2a2VWZkYwS0J3eUxSb1FwdGR4Vjd5ZXl1QWhP?=
 =?utf-8?B?aGg5OW45amVyRi9IWFc0b296aFdTQ2FvMFlXVUxrWTZ5UFRmdERkNFJYeXNY?=
 =?utf-8?B?WnZqNzRScGdrNWlwSlk0ZDVDS0VEc3pnOWI4UFlMZ21lRjBVS3lvTzZPNkhT?=
 =?utf-8?B?Zmh6L1RhZlJFT1pKSVZxQ1pkakt5UjVyZGxiRGdQZjNKMWY1SXFuUzF2MzRO?=
 =?utf-8?B?NGVyZUpjRHJjb1gvK2xKdjlZT0NiU2c1ays3aVZnM2tUdks2bGM4ZUt5OE1X?=
 =?utf-8?B?MFhxWjdmNU5iMUVvbGxWOVU5OEYwbnp6U2k2cUYzb1dNbVFPcFNpU3ljZnAv?=
 =?utf-8?B?blA3dDl4MFV3azJFWElXd0J6RUJCaFRhNG16bGVXNTA5WWVzNUxBRThsVlow?=
 =?utf-8?B?aXovRW1ROFZvQ2IvMytzQ0hXa1NLSnUxbjJEbkRnTHJEMkFSMTVjRWkvcGFY?=
 =?utf-8?B?eGJrdDY2N3VKeHdEa1Y4bjQrR2daU2U0MzdzT3FGaW5vdExhMmdrZk9yN3dm?=
 =?utf-8?B?RndjZmdFZC9ncjZLRzNOZnhSUWpZZVkzaDRDUmZHb1QvTEk1SVQzMk8yTGI1?=
 =?utf-8?B?ZDVQeHVYWDJacmpFVE84RURFRDMwSVYrYXZobmtSbnBJY0U0WTZwNzJiNVFB?=
 =?utf-8?B?T1FHRkhxQXJOVWVJVFJzTWJmRlF6cHZVdU5PWFpPcmlkeHlTMno1eEx4Vis0?=
 =?utf-8?B?SmZpd3hPN0JaeGloYSs5VXV4ZThHRnFSeHBmT0d5dXduN1BjSElneFZtQkk1?=
 =?utf-8?B?ZkI1STUzeG04MFg2U1lMQ01IYndVSHNLU0pzeWJidnJuK2k1NnFKUWFkSG9w?=
 =?utf-8?B?SHMwcWdMNEpMQ0lOZEF4bERQU1BvK3NIWHl1MmY1WWxyNEtmMGgrZmlueURI?=
 =?utf-8?B?VHc3KzZDOUx0MysxVmcxQ0loNVZTOWFpT0ZheCtsSElNKytiS2VFTjdVM1d2?=
 =?utf-8?B?RTFScTZmb3pCeFhBajZKanNWTjAra2ErWnNnWWZoU0x2b21RQ053eThWUzRm?=
 =?utf-8?B?T1VoQkFITXpaS0pIUWVlUCtQaFF0SlFEd2VGWk03MTFRc0x1UzJvVjUwT0lq?=
 =?utf-8?B?SzJQNTQ4VlkvMGhaWmFXUWRvOEpYVS9ybmR2Y1dRTWlPMU53TktIRHJiNW1w?=
 =?utf-8?B?anJBQ2d2UnBFMWoxSXkwd3hNUGpJcUpIa1RIaEEvbEYzNTdZZjgvNkZ6RVM1?=
 =?utf-8?B?NGdrbDRta29BWWFSR1Fpc3ZYRnl3Skh0RGxZMVlFU09meUYxREd0YzZ0RGk3?=
 =?utf-8?B?K3BjU0FVRThkeE5BZVRRSkV3OXQ5dFZyZG5Oa3JDS2RPUUIyK3ZRNXNSVkkw?=
 =?utf-8?B?VnU3MXNQck0wQTdWenplRGF4VzdoNExLUVo5T1p0aGV0MDZEai9MeDcrVk55?=
 =?utf-8?B?TjhGV0ZSR0FFMkZmSFhES0tXOGxZUi9Xb0htYW9wYVJ6OWdkMklFbnV6RUVN?=
 =?utf-8?Q?b+JxDTqsTOF/EeCWFhkqfjeHf?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(921020); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:48:24.1429 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 253ee2ae-911f-4d4f-6c32-08de239da07d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6078
X-Authority-Analysis: v=2.4 cv=AZK83nXG c=1 sm=1 tr=0 ts=69175d5d cx=c_pps
 a=9kvQxT1kSIQAdUxQFzSV0Q==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=j-IYloMq0J3wxMA6e1IA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: VzpySs6QEa3E7_z5_IzWpD-wA_DvJuO4
X-Proofpoint-GUID: VzpySs6QEa3E7_z5_IzWpD-wA_DvJuO4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzNSBTYWx0ZWRfX25HfssSKstv5
 edSyBqVV3oDiKxadAwu6TjILwiiadCNJSDj6TR05Slek66BEi9+Us/KRiKpnNBvv3iPnenO0v/l
 To/dVm3YiliMLIupgKX7djXfYOvIdq7GIZcTx1A1NF3yAZnwZk1IpoMFfYIJTTVeG+pe5scWgC8
 DvmLKWfb9AVqdfwsHdLg6m3QpBHLLhbGVlR51j29egIDvw7+Kg8tFU/ifvAhu0b6pYzAPPZEzwm
 pnK//H98JsRTy8aFgnpIvuuHD0ntewrcyYP31joaR8I3xU63hDOabzVoRzr1Nws5LqJ1v453mga
 UDnjWodJJvvKb7D8G2NpTLLoo1DeUMhcZitrh1Kmhoz+Id9THKcWTUt8BI2W818GBtOQfwTF/0H
 iQdAOm1g+F33Kt7NZsjgQmsl6oiH4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140135
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 7/7] configs: stm32mp25: enable LVDS
	display support
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



On 9/4/25 14:53, Raphael Gallais-Pou wrote:
> Compile VIDEO_STM32 and VIDEO_STM32_LVDS by default.
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Reviewed-by: Yannick Fertre <yannick.fertre@foss.st.com>
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  configs/stm32mp25_defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/configs/stm32mp25_defconfig b/configs/stm32mp25_defconfig
> index 2b02cd86d6134497151e398eb54230f08d4e6272..e84df4a2a8f52890376f7689b01d3dcab5079ed9 100644
> --- a/configs/stm32mp25_defconfig
> +++ b/configs/stm32mp25_defconfig
> @@ -78,6 +78,9 @@ CONFIG_SERIAL_RX_BUFFER=y
>  CONFIG_SPI=y
>  CONFIG_DM_SPI=y
>  # CONFIG_OPTEE_TA_AVB is not set
> +CONFIG_VIDEO=y
> +CONFIG_VIDEO_STM32=y
> +CONFIG_VIDEO_STM32_LVDS=y
>  CONFIG_WDT=y
>  CONFIG_WDT_STM32MP=y
>  CONFIG_WDT_ARM_SMC=y
> 
Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
