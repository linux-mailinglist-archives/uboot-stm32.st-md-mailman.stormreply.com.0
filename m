Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D88EB51C6A
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Sep 2025 17:51:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11061C35E2B;
	Wed, 10 Sep 2025 15:51:11 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9C83C36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 15:51:09 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AFoJwx012725;
 Wed, 10 Sep 2025 17:51:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 zcIZuh9ts7o58LTSQqe/kYjHq9Nbr9rOBDuPe0MDulM=; b=51LxhqZAuLpc3JVX
 ht+ih6PMoWQrqTBnig8kVTIjlWx/dZ4M7Naul3kMuZ7CPMhBmBhQJgoLtdFT4SHe
 LcR4bh7LCm6uJXa5vdXkNI9G74ImNMQqX/ImAXOwehdflXRpyP7vrS0HS6iVORNV
 IzOxT1oCPRhGBdjDyjzVZ0GFHhJifVS/mXZPx9wfDD+Q7bllEN6M0rQyiEpWp0E2
 44RLJtvBb6BDaoGKx7St6egmtY8Eu32L/9UoS8rNaHdovCZJnX04qkH7MiNbp8jI
 Tvo8kb/oteSNmPX7gAcjqpOw6XqkdgVLev4a4wZjWjflb/c8GcVdO51Z3ZJszA0w
 VclBNQ==
Received: from am0pr83cu005.outbound.protection.outlook.com
 (mail-westeuropeazon11010020.outbound.protection.outlook.com [52.101.69.20])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 490ywmp7jq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Sep 2025 17:51:08 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EFR71upsYBU4iVXlfgHWc0f3qSccrDUWLQROQ0EMmklmXKbUq5oO+GvOLF4yzoFvXKvbsEHm8ojeFcYe6kOpf+nBvL+YsZi7bmDXz7nO632pANeEs5zw435J0XDdkHfeYOl8V88tKyIbgJ+dXKaevWgbifAmRRbNNYQT/3KrGqpyJ371TvLJh4FK5yiZp+ZR1PYj1owerx+xrjVc+I2umVPIdkScHia/sH0MNimiBWD0KJiptO6YL8bp2Me9r/bA+XRAYmj3cfJDd54n5gOlE6UHkHYbnWloBaSg0IkpIMnz3lzPeVa5OZwbkJVbpB5y1yx1xJDVj45zEt6ye4ox2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zcIZuh9ts7o58LTSQqe/kYjHq9Nbr9rOBDuPe0MDulM=;
 b=UDkB4pCJi4T+/s2vDwTdv+fR5P3NL4hmhNShM5u8KmuYkQvcKRnvsHF4Izi8cUVVGeUyGhlkqEfS0M+88wzl+dyyx0dEgJcnjCLJwt6a4DY2tLXr3NGfFq7E30Enojj71C0xNd0oIsRlimSqTToPtJFex+WZFHo7yuiO2Gc12RTIT+sGi4yaqNHSj2o5gHwHYie3UO1Ddu2EK9Dn9IYXJFAAe89n8AeC/iQUbxTVNvxFG3dztx5JkOPoZM04/1pSRWLxB5c+VRhYzbH/FUB3hv2sk/w6iUUsZpiJHIL2dwf1Fyx3RLQoBSoHLVGLMoy48pjf1twi0AH3HPtcFJabMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zcIZuh9ts7o58LTSQqe/kYjHq9Nbr9rOBDuPe0MDulM=;
 b=fEta23eEDSNTOT3/cWPe7lBP7oIiwNl5GEKIJSUqZvHzb6kWvb9LTV4fbqll05P+sgu3nEe6omLkHotZnbX0azHOPLQh3Wc4k844OMKK2h635dbmjRLAYXNGWI0JV2USA6dBBpeZNU3HC2u1O0jQE+B2HHtOH6aM/5VUfCne7Y4=
Received: from AS9PR06CA0058.eurprd06.prod.outlook.com (2603:10a6:20b:463::32)
 by AM0PR10MB3473.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:151::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 15:51:06 +0000
Received: from AM4PEPF00027A60.eurprd04.prod.outlook.com
 (2603:10a6:20b:463:cafe::cd) by AS9PR06CA0058.outlook.office365.com
 (2603:10a6:20b:463::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Wed,
 10 Sep 2025 15:51:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AM4PEPF00027A60.mail.protection.outlook.com (10.167.16.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 15:51:05 +0000
Received: from SHFDAG1NODE3.st.com (10.75.129.71) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 10 Sep
 2025 17:43:56 +0200
Received: from [10.48.87.108] (10.48.87.108) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 10 Sep
 2025 17:51:04 +0200
Message-ID: <c92402a0-2cf3-4002-bee0-99253c14e879@foss.st.com>
Date: Wed, 10 Sep 2025 17:51:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20250808140358.53164-1-patrice.chotard@foss.st.com>
 <20250808140358.53164-2-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20250808140358.53164-2-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.108]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A60:EE_|AM0PR10MB3473:EE_
X-MS-Office365-Filtering-Correlation-Id: f1f642b1-23a4-4743-e93c-08ddf081da09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDBTdkJ0K1Zka3J6Z2c0Nk5iK2RPcE1hWmNwV3h0cHh3WUlDbytlRUo5eW9J?=
 =?utf-8?B?U2VCcXpUbGI3SnZwYU5vYzkxTmlCQ1d3NTRzekljMXg3bnVoSjBuNmJ4UE9P?=
 =?utf-8?B?NjY4b0FyU1FscWhYa3IrV050Q3hKS3dteHNiUitXZzJ0TzRqSmdOYkVzNVRT?=
 =?utf-8?B?Y0FxdjlZRW4yYncyOVAzcTcxRHJGNEZDellNWjRHU1Erd1cvbmFCM29DR3Mv?=
 =?utf-8?B?dmg0bWhYL1g0VlI4Q0JqSzlWb3k2eWNuTlZLdW1NbXlldFZiUlJHRXBlWmYv?=
 =?utf-8?B?cGJZTjBaVlpNVnJoMUlVWlNkY2RoRjdjRDRHZStpVUsrOCtQSklNYW1GeXh1?=
 =?utf-8?B?OTl5bjVMMGU2M0dPZ0ZiL1hoR1FYam96NGRuellZQW1XaC94UHFEaWVucS8v?=
 =?utf-8?B?cExQQzkzZ3RJajBXeFU2M3F1Sm55TUNxZ0p4UCtrODZ6ZGdQMG1ybnBOU0Fw?=
 =?utf-8?B?SE8zTkhNUUtQTzQ3UDRjQnV0TDVsVEt5amtzc2lGL2JHbXN5VjhEcGVzbTdM?=
 =?utf-8?B?MVM1K3R6aHNtTnN1RElla3BTMlgzdlhTVXk4VlBtYkgxQUo2Q3RDdVU0TEph?=
 =?utf-8?B?WnlLcEtkVFVxM0VDZUtHN3MzSTBnL0FGbzRmM2wzd0hmRy9IRXBkTmJ2RjMx?=
 =?utf-8?B?VzVQTnY4YldPbTFhbjMwU215b3dwQjRJUEZodUtFR2U1aFN1QWJzLzhDZTJP?=
 =?utf-8?B?NWdreXJWNmhQU0wzSGF0MzFXS3lTMDBSQVc2N01CU2I5ZkNWbnVmSmhOdCsr?=
 =?utf-8?B?eG5WV1Z3aEFVMzU3MFBDNkR4ZTNYT0dNenlna1Zxd3N2cFd4ck1BMkh5L3Bi?=
 =?utf-8?B?R1c4bDdVd24xMXFoRlVsdkRBNEMvRktMdjZxSThWNmo2STZVb1V2Y1FMMGFO?=
 =?utf-8?B?eDU2VmxvbE52ZFZLaGFmSEtWdU52b3NLWWkzWDNqczg5M2pxcnZtQ1hYQzVE?=
 =?utf-8?B?ZlNkUCsvcFJlalNSNDl3T2pLUXZPQlVicU1JOS84RzJKcVZOdTdWYUVUWjZw?=
 =?utf-8?B?ZEFuUFg5bE1SZFZxdWdGaUJ0QmRpVStidGp3Vk1TMHlOQTJvak5WMXR5MXh0?=
 =?utf-8?B?Q2ovbDd0M3g2N3VzUE11bGlrTjd0elJRRW1Kc09oeHR3TGFWUmNkVklGaXNM?=
 =?utf-8?B?YkZ2Vy9PcEhpb1VPZFNNVFFKbjZnTFVJUjFsMFh3QnJyN0xEU2JsUjZJMGR3?=
 =?utf-8?B?SFE5QTVrcXFTcXRHU2pRTUlReXhvQnltdDgweXRKbHBlYXRPdHNqRnVMdzRN?=
 =?utf-8?B?R0dUMzVCRXNjdFJudUF2SFpoaTFQUEpZNEY5T0Jva3pucHZyakxvV2hhYjNZ?=
 =?utf-8?B?SGxWRlZ2SkRydSs2S0t4UmNKRytwZDZyVTRtYmdMbTJaTitiR1Z1RzFwdTgx?=
 =?utf-8?B?QU1JZUJKVnhkazU5L2s2YmRGK3owdFgxUkJFdlc3eWF5T0xXc3hJN3pRcElH?=
 =?utf-8?B?eDR6b3MvTnZOMXAyUzIxTG1WdXFQTGQ2OUgvRE8rRlpsVkd0Y2NxYWJaV3RB?=
 =?utf-8?B?ZktGWFVNam9BNmdkWlF6U0FtNDU1WEdCQktjY2o3d245bmkxWXVUamU1SjZi?=
 =?utf-8?B?Y3FFVll3WDl3SHprWEJBRTdhcHo4b1RCaWI1RDVQbVRWTkdMNEM2eTgrM3VW?=
 =?utf-8?B?SHdaaHZac0tLVUs0NlJTZ240UnBYODUvakU3SXduZCtMZ2dkNU5JaU53clZ5?=
 =?utf-8?B?ZUZqVVUwYTNKbUJCSmtOVmZVcHhkdXlOQjN3NVNTRll3U3hlaSsrN1FIVGFR?=
 =?utf-8?B?RzJ1YlZLNncwLy9kWHRCZTc0d1hncEVYSms5NS9veDhacHg2MkhDbnlOQUxi?=
 =?utf-8?B?eTUyTi94UjZGOFpkd201LzFRa0gyK0xzeW9hRWcyMWVuK2FRUDdEZCtpU2ZL?=
 =?utf-8?B?NWI5TXgvUG1Xb0RVa3lXUytOY24vRnE0bWRtMy9xa0E0eWx3b21ieldOdndv?=
 =?utf-8?B?WkthMXBXZ3JUc1JlcFpLbDRrSlhjalNqZ3E0ck16RmZpZ0tiOWNHUVZvZEpZ?=
 =?utf-8?B?ak1qR3M1bHh4ZmpkbzdQZUJuTW50UWNrNWVrb3cxRkZNZkt2UlBrcGk3bWt2?=
 =?utf-8?Q?uLzQDC?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 15:51:05.5127 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f642b1-23a4-4743-e93c-08ddf081da09
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3473
X-Authority-Analysis: v=2.4 cv=OaqYDgTY c=1 sm=1 tr=0 ts=68c19e6c cx=c_pps
 a=dZNRamlC49a2syOZXmJYPQ==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=q6CKDgr7omsA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=8b9GpE9nAAAA:8
 a=ZZpkiiTLAYeyZqwPR2wA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: GXU--jPfuqXFJ9G7Uw_pIdSutGU5f7yS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA3MDAwNiBTYWx0ZWRfX1+d1Vh6m+H92
 SVKjq1v7XBXkzVEuyLa21zVGwRgeQtCoww8tQWExv/M4skJ444KklOzAdFuZRBVvylUX8x1D4vz
 VorwOPJUVsUht1d9QYdowWlNsw+kH0lQe1DNcy84N/bylUdrIJAD6/I9nVheYzuqCm+lpbIyWRV
 f+5DNIRcE7nKt0AE3rdWKlAaGafFW28HzfEjm8u4X5H0Ayrkf4CFuKUPhMifFS9HVbh+cnxC0Il
 +UiPVX9MOZwXaoZDh2it4RLfrssnhgfZbPXM5oayrsWGzs46C90X5Jtk4mxl7Gkx0rwnGFLIhoP
 I0y1FS+tNiTQ0rWx6pQdgCxj2Wy2H3a66zOMXaLTm1D++3JHHf7t43LP3ueGJyocEJLiUUR+WCm
 TIvkt+Ey
X-Proofpoint-GUID: GXU--jPfuqXFJ9G7Uw_pIdSutGU5f7yS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_02,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 clxscore=1015
 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509070006
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] ARM: stm32mp: fix RIFSC semaphores
	acquisition
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

On 8/8/25 16:03, Patrice Chotard wrote:
> From: Gatien Chevallier <gatien.chevallier@foss.st.com>
>
> Fix RIFSC semaphores acquisition by not returning an error when the
> current CID already possess the semaphore. Also fix an incorrect mask
> for the CID value in the SEMCR register.
>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   arch/arm/mach-stm32mp/stm32mp2/rifsc.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-stm32mp/stm32mp2/rifsc.c b/arch/arm/mach-stm32mp/stm32mp2/rifsc.c
> index 50dececf77b..136ed68bba1 100644
> --- a/arch/arm/mach-stm32mp/stm32mp2/rifsc.c
> +++ b/arch/arm/mach-stm32mp/stm32mp2/rifsc.c
> @@ -73,7 +73,8 @@ static int stm32_rif_acquire_semaphore(void *base, u32 id)
>   	void *addr = base + RIFSC_RISC_PER0_SEMCR(id);
>   
>   	/* Check that the semaphore is available */
> -	if (!stm32_rif_is_semaphore_available(base, id))
> +	if (!stm32_rif_is_semaphore_available(base, id) &&
> +	    FIELD_GET(RIFSC_RISC_SCID_MASK, (readl(addr)) != RIF_CID1))
>   		return -EACCES;
>   
>   	setbits_le32(addr, SEMCR_MUTEX);
> @@ -171,7 +172,7 @@ static int rifsc_check_access(void *base, u32 id)
>   			return -EACCES;
>   		}
>   		if (!stm32_rif_is_semaphore_available(base, id) &&
> -		    !(FIELD_GET(RIFSC_RISC_SCID_MASK, sem_reg_value) & BIT(RIF_CID1))) {
> +		    !(FIELD_GET(RIFSC_RISC_SCID_MASK, sem_reg_value) & RIF_CID1)) {
>   			log_debug("Semaphore unavailable for peripheral %d\n", id);
>   			return -EACCES;
>   		}



Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
