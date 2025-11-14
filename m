Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32405C5E522
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:48:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF4A7C628DB;
	Fri, 14 Nov 2025 16:48:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 713E7C628DA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:48:21 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEGU70X2721926; Fri, 14 Nov 2025 17:48:17 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com
 (mail-westeuropeazon11011043.outbound.protection.outlook.com [52.101.70.43])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7m3u1f-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:48:16 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P/tPAf5h0yK3r+20lnivkX1Thd5LtpUESj2wDIORe/wMzetMtx/dm8gpg9TBY0H1YFnM3EHm/t0TIAj3IimEeEyq7h6DiKlfHaCpaZZcaaQBQxKWeedTBLJMQK7A0pBcwCocdt8k5tqSwCJhZQlOMfzaFs9AwY9MYICz/X60+3PHQ+G/RBNAKmwSO0b+1xEmObCt8smal2wtIE+JWvr0pAG5b1/1W1oPwGgbvGxh0161qQyiai8NY0OMftc0CpNoNC+4yzIfGBE6q9dwjyqlS5kf6qMpT307EvWdXtsUXkcS8QP9V2fIA/lpLRNpaBSVeOX8HyRus+zofCSHXWNBnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/lzJwag6CldqdUZk1Kd2VCibZevJCDo7YAlQe3ewZM=;
 b=MydI3g0wS3+M8xDELFGDkFpPTh322+bdBRYWLVWAdPNZ4tlt34qpdCZp+pTi+KeAwWEurJK6HNIam7KWSKQKylGpTv8fVq6z4JGF/vD8WYnh09/l+rmNOdJuGUopztlaNDECbDU+g90/necG4tpmCkXWXkk/BNa/U0ISIGrZ0Ye1PvODoAWmA1Rdw+iOxHYndf+cjg+CZQ8Yr6rH9BTJ1Ei94vk4gxNQLO2eaUjd/BX4xQLzjR94+VaHkJ6mT8Oh7tW/KxWTYSuLWxdqfg05BZohrVKf4TvxsDSWxaIKivKiqZEAuwlUR551VhwWLBSs7sWGWXq+fBHmvEymB2903w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/lzJwag6CldqdUZk1Kd2VCibZevJCDo7YAlQe3ewZM=;
 b=fhGyd2AgAsSz7AsUzkCBPKRLz5PSanb/QqGfThF6h3/PWvgl8s3h3CNvXsAAPi3beNz8psSsWyJX4PFN1feUJmWoI+U6MWzRYnWNCleBCyg/etbBfjdK+WN/jWzUTjo4CQAVHRleuJ6H0DFVN/6kIWAEcE2T3lXEAU5c+n9u/PXYpRZgWAeKYvsiUQt3J3zO9CvioGmnFWuY4Hdzri/HJn9Ses2+VGl4rwEG+5MjwmtLnX6DLADIMKA9PvC2Hyy6GU7xCCIP3E2i2O5eAzg0zCmzOXWUp0fKS1TpGO7O8JL20/2uQ84fDPo+eDDeqpQyUOPCh+pVMKl1J/W9BBDlRQ==
Received: from DU7P195CA0002.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::9) by
 DB8PR10MB3497.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:134::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.17; Fri, 14 Nov 2025 16:48:14 +0000
Received: from DU2PEPF00028D0C.eurprd03.prod.outlook.com
 (2603:10a6:10:54d:cafe::53) by DU7P195CA0002.outlook.office365.com
 (2603:10a6:10:54d::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 16:48:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D0C.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:48:14 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:48:25 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:48:12 +0100
Message-ID: <4106dbcd-7a7c-4e77-b0d1-c7a4dd69f974@foss.st.com>
Date: Fri, 14 Nov 2025 17:48:11 +0100
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
 <20250904-master-v3-2-b42847884974@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250904-master-v3-2-b42847884974@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0C:EE_|DB8PR10MB3497:EE_
X-MS-Office365-Filtering-Correlation-Id: cfb83ab7-47eb-4475-e4bf-08de239d9aa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVJTWWZtK01MN3gzSDkyL2pId2J4RDIvNVc5TkxCSzJIL0V2bUhnTnNnOXdY?=
 =?utf-8?B?RXhRYy9XOExBcG1zTFlZTFpNeTkrUFB2OXpLdW5XaUhQT0FZUWF5Ym9zcVMz?=
 =?utf-8?B?Y1I5OCtraHhzWmxuVWRUeUNtRCtlTm5qajBkMnNtREtlWG9OSURoUmNqakxV?=
 =?utf-8?B?dFhFZnprYW02WmhOM21SN1JkYW5NbzZaRmwyT2Ezdm1MTCtPSlVid1pCd3FZ?=
 =?utf-8?B?V0t6bFpyTElGMHlQTGVTSzJ5OFhpU2lLellGakFSNThCcE5FQUlxcWFtb2hh?=
 =?utf-8?B?SzlEWGZGbWd6MkxuUVBiZWM5NVhudFJPanVqcHB6MHFsQXdyK3dwTTBXUklG?=
 =?utf-8?B?NXhhNHo2cGo0cm1OT3ExU2Z5dHJ6Z2VyWngyYUtYaUp1YWNLUldGK096S1Jt?=
 =?utf-8?B?Vi8vNUVQSys3S2xDbkxyelkranpKU0xhbmM5dnQzRjBJVUc4Wm1GMDRYQVdm?=
 =?utf-8?B?dHMwbEJTOUZaUlJKWjFCYU1XNi9jSzRSZTlyRDA3V05BUkhmUU5lL3d1ZmQ3?=
 =?utf-8?B?MHZYTWdyV3NDaXZDOW1Vd1BmaFlITDAzOGFZbTFjaEVMU2YwVE5aa05MaTdj?=
 =?utf-8?B?WjVXWW96YUhZRWNXMEtsaUNpdmp5bjdTRzhPMUt6dWpyeWdpd0pTWURaU3FR?=
 =?utf-8?B?VlI2bTFFQ1RSNXpZQm1hN0h1cW5PcmFyc3Q0MVhVLzBXOWdGYUVBOVNXcUNC?=
 =?utf-8?B?MjJaeGdOcnNUQWYzR1N5by9QSjlaaTQvaGZPMVBKUFZzUWNEckFjemZKS3pv?=
 =?utf-8?B?ejJCVFhMamIrZTlpaXNCTS9yaUQ0cndLbGJmdkdsTmd6eVVuVE93MlowdUFC?=
 =?utf-8?B?alBBd1A0VE56eGN6UDZ5TDZEWkF6M3JYOTdXQWlTRTh3VzJEN2tFSWpwSlVq?=
 =?utf-8?B?WVdPRkoxdkcwUGVheUtrSlZyemthWmN4K2pDZ05tbXh0RzM1aVVnRTVndFky?=
 =?utf-8?B?YlVtT1lteEVOb1Z2cnlvY3RoRTFocjYrNUZ1ellKRmdJV2FNQ0E4K0dYbUZH?=
 =?utf-8?B?eFh1SjdSZHVnelhzQlpaM3hObGI0SDhVM09WUlJpK0JEYUJHODZBTG1XS2JU?=
 =?utf-8?B?TEtJVTEvaEdGaU5YOG12S3JFd2tvZ29UWlpySlRMTzBuS2RDNVp5QXhlWmtP?=
 =?utf-8?B?NHZUbmVxNS91cXd6WTRNRVBQc01pWjV4LytVbE9XS0U5dlVJOHVJVWRnWHdJ?=
 =?utf-8?B?c1dtNnhvYlRDZWxqMHlySVd1QWtKZzFHS2YzUmhzQ1ZsdDZyTXEwQlArSWNw?=
 =?utf-8?B?SjF5MjQ2RmJGdnNBc0V3S1ZSOEUxcHA1MEw4S3phekN1c0ZkR0ZaVU9FNVU5?=
 =?utf-8?B?ZWxxanRzTnRCUm94TzM0S3YzTjdibmEzWXIrS09CK3FQckNIUkU1ZDdyQkEx?=
 =?utf-8?B?YTBsSlhtOUlzR2NDejFPcC95cXdFWllMUkZPYllMZ1J3bGdnYndxMGIyZE9h?=
 =?utf-8?B?TFhDWGtXSlZTTkkrQjMwSkNFUEhzcnA4WW5zdjk1aEZLS1dreG9sc0tnek5K?=
 =?utf-8?B?SVNMRElHV3ltU2FsMUJHS3hnNW1JRHY2RUZPVmM0cVFBSFgvVW55V0xJZ0F2?=
 =?utf-8?B?ODFkVC9mVHJ5Qm5MdG12bGFSUWlsSVVrWEEwdjdTQUhwanhzRFRHS2ZHbHJs?=
 =?utf-8?B?NTg5SXVJSjVaU2lXcGFyeDZMaW5Ebk1mU2FnSklBUzdQUlBFOHY2ZkNINlk3?=
 =?utf-8?B?emk3N3lXOHRORWl4VHhyVndlakdEYm1tNTI3TksySlVhaktFMkdGczhYamJ1?=
 =?utf-8?B?dXQ2ZTF2d3ViTDExU3p2TFB4bjk3LzdubjUzS1FydFhUZm4yRXYzK0VzWmov?=
 =?utf-8?B?Skp1RUdoU2JwODB6WVVvVHJoZEJjYXhZT3dtSHl6aU5UcGw1bWlHTm5yMXZo?=
 =?utf-8?B?TUo1dnlRRjUySThjZmVPYWEza3kwY1hhM3doeTAzdStNNnU0OEExNEZCR2NK?=
 =?utf-8?B?T0hFOVUybHo3eEZlRVJzNmZEZHlVVStFb0hKQUtvVUQ0QVhsWTl0YXU5dkt0?=
 =?utf-8?B?bDU2L3NqV1cyb2lRd0YzWjBCSkwrNGJXSldzanRlTlRpUzVGK1ExWkQ5SGNw?=
 =?utf-8?B?Q05ZVWUwRmVrNHBOL0Y0UVhiakZzeGZWUG1hTnpZeWV1YmYrYkV0UmZYN1Vs?=
 =?utf-8?Q?lSCTzJJHtEmbIDkxHmjh+y1yG?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(921020); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:48:14.3615 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb83ab7-47eb-4475-e4bf-08de239d9aa7
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3497
X-Authority-Analysis: v=2.4 cv=AZK83nXG c=1 sm=1 tr=0 ts=69175d50 cx=c_pps
 a=ECbzqkp4a+S0KsFAOAVhYQ==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=qy2ajdmWnIEl2nLCp9wA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: QIn18pAivSzwOgfXFLpHSRkZ0Jl7TBmY
X-Proofpoint-GUID: QIn18pAivSzwOgfXFLpHSRkZ0Jl7TBmY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzNSBTYWx0ZWRfXzygSBuw7hKwo
 aZMoIMkO7+OOISHeBaCP+XLwr6NEEfSZ1zJBUBFiRshc2Ah7TvrJN+tGdTgkEvvRn2ysdfnKU+v
 v56TENmsqgn6JlrJFeXawBa/cMgjrsxkhiE4nT7DPW9X7EimewkEV4CbnuLy1aVd5uH93cDQ2u5
 KqYGUpcmUX38oIiGKw3Iv/qhQr6y3qyMJYEiDmEDk3ZbxjeAUXWfmx+dAq39Ljr1cdpAuA3KSyA
 Z/strDVo0h9Mizi0MB3ntlbdZYESbwrxuULBrqQ/E+9bMxf72JYSIvw7ywAsMBW0Ip5qZatMuOA
 mIHzQ9TVhQ7aO8e7j58kbPhyTvhlLaMf2oESn9uKA/jD6eOHTtO8+UmjrohcGhBpjLQBnAsoqXC
 UIdrI+QwPFUwXOapE2JJB2ziiAIHKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140135
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 2/7] video: simple_panel: add support
 for "panel-lvds" display
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
> Add the compatible "panel-lvds" for simple-panel driver in U-Boot.  In
> Linux this compatible is managed by the driver
> drivers/gpu/drm/panel/panel-lvds.c but in U-Boot the specific LVDS
> features (bus_format/bus_flags) are not supported.
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Reviewed-by: Yannick Fertre <yannick.fertre@foss.st.com>
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  drivers/video/simple_panel.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/video/simple_panel.c b/drivers/video/simple_panel.c
> index b6c5b058b2e967bbbd47ab3c3ce5ca52c7804409..0f23df701bc3c40ea49380bbfa3743ee592d8bd3 100644
> --- a/drivers/video/simple_panel.c
> +++ b/drivers/video/simple_panel.c
> @@ -191,6 +191,7 @@ static const struct mipi_dsi_panel_plat panasonic_vvx10f004b00 = {
>  
>  static const struct udevice_id simple_panel_ids[] = {
>  	{ .compatible = "simple-panel" },
> +	{ .compatible = "panel-lvds" },
>  	{ .compatible = "auo,b133xtn01" },
>  	{ .compatible = "auo,b116xw03" },
>  	{ .compatible = "auo,b133htn01" },
> 
Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
