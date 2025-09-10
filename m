Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8350B51AFF
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Sep 2025 17:10:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25599C35E00;
	Wed, 10 Sep 2025 15:10:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6003C36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 15:10:44 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AED4V7023986;
 Wed, 10 Sep 2025 17:10:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 PRrhntBm+h3JqdleymB+joo8CMm8vdb7YJ3y/HiXR1s=; b=QMO3zqSz/btDE34Q
 OGa/drEE67M7z8XtcaXtVFuxHdV+iIm5ztD8gg2waP5KIq3RlfDbTJGkC8pwWYWw
 LZ+6T6r95Mxm2J5tJtZcIhzf4bvWFc6rGdKEWw4aL0nRzhYavf3KANlRQYiNeZwQ
 VQqx0ucx6uftEy2LkKIrFjw70GjdkEtlLzaSGNdf5raangfKELg4zCFv4hlQCgKP
 XdClhF4RpkO4yHQX2734kiaw6gGJ1q+jckba0OrgPiV7MxKoxiCi7MtfBuU1ojCG
 ZnF/VjIUzHMXR6pV65544qaVUohwUfowFfJZYL6tEGjgxOmijiI8uHbtj3zI67W8
 O1T5DQ==
Received: from as8pr04cu009.outbound.protection.outlook.com
 (mail-westeuropeazon11011071.outbound.protection.outlook.com [52.101.70.71])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4929f100mh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Sep 2025 17:10:41 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hcK23gL7U+6WEmd0HoCW3xSC/WplfvuG9DcjhZW+m8CAJ0cNiNNhhrXZgMdKB0c4XbaOI+T7kPj/IiuYPM68nLhV/rD63zCNxmvdcx2Y4cpwBaiZ540QwCWmDodaxlHRv09KiZaMxnomGMsNBdC/vch5Jjrmcyczyvetl4jj0uDHy3pZoPCPenBH5quTQ2ROhME3Ac/dtIa5LM16EHffmBnUQ4Aee03qj3v8YlH5jL055W7fjGYso5XFZU4f/af5uG43wcJ6vq8tQ59zDLcc91xuTpypoq1YQvN4ielbb+zDddxkNiawh3RZzmXbafctPP4AQ3wAoW/B9tiZnknlfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRrhntBm+h3JqdleymB+joo8CMm8vdb7YJ3y/HiXR1s=;
 b=ljRHI7jWuw4ZQSUnEYUndfscEK5nJuUgtTUgLe+DwF63f51DRJZr6MzQ01/sLjgGo+l2GWBHc8wa3yc6gupZMZN57n9QwmJD6d1hQ3vXRUg5c7+FRF5YD3iJxadBKv6Gl8HcROpTuubcfvOGvUDHv/eeCkLQLLtVz78K5NI6F2sbOQxMpMDmQjJrItZceymsMTS+N3k5g+GTZGD8Eyi93kdrcDAbNEIfW9FFQwcdh80H1YCIB6gn20A0f6AjTB/LG+h3L0F0IAci80VEtTP2XNBkZz5qTHNyjlYS2FuNUIe3hCb4M6A6UtgthBJnzdHtDUiRsG+avrhR2BMT/Zg/1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRrhntBm+h3JqdleymB+joo8CMm8vdb7YJ3y/HiXR1s=;
 b=c68zm5BOP0FLrcNPxoS4P9d80RKDfTdv33WO5Ogfs0JCYgvJeHxDztx8KLh9Hx43K554yzY7fV3x02gC2i7ESoo2bdiwflrAykot7kQFS4bxTHFs6TQULmd2oPft8+SAH/v/jO9BxKdxWScAk6c1ZCyG/XInGr/XkFsmOxfB5n0=
Received: from AS4PR09CA0011.eurprd09.prod.outlook.com (2603:10a6:20b:5e0::13)
 by AM7PR10MB3511.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:132::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Wed, 10 Sep
 2025 15:10:38 +0000
Received: from AM2PEPF0001C713.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e0:cafe::7a) by AS4PR09CA0011.outlook.office365.com
 (2603:10a6:20b:5e0::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.16 via Frontend Transport; Wed,
 10 Sep 2025 15:10:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AM2PEPF0001C713.mail.protection.outlook.com (10.167.16.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 15:10:38 +0000
Received: from SHFDAG1NODE3.st.com (10.75.129.71) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 10 Sep
 2025 16:58:28 +0200
Received: from [10.48.87.108] (10.48.87.108) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 10 Sep
 2025 17:05:36 +0200
Message-ID: <41ad7824-fdae-4a05-b57a-59b66e55d0a8@foss.st.com>
Date: Wed, 10 Sep 2025 17:05:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20250808151154.472860-1-patrice.chotard@foss.st.com>
 <20250808151154.472860-2-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20250808151154.472860-2-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.108]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C713:EE_|AM7PR10MB3511:EE_
X-MS-Office365-Filtering-Correlation-Id: f7a00a7d-bfd7-4c7d-947d-08ddf07c336f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1hpaW5mNzJ5K3R0NkJwSVUyZ3lmZnJMeU5BSnlIemZ6TkZYVVNhak9EL1la?=
 =?utf-8?B?dVN2YWV1TGVsRk5VN0dTUUZES01WQkNQMnFQTVhqT2JLN0toNFFnSHRSVGxS?=
 =?utf-8?B?azUzNGd2UHp4MUFsL2pCaGZRS0dLL2QzMWUycENpSWY0Mm5mVFdHYlNqNUVn?=
 =?utf-8?B?TDBwdk1JaW16RUVjcFRoUncwQWZJdWd3WnJpYnp5RzAyT2RWU3FGejBlTDNv?=
 =?utf-8?B?dUg0VjJybjhURXdITFdSdXh3Y2FQZjRMTitnSXcxcExBSFZjYTZXOVM3aWQ1?=
 =?utf-8?B?eE1UODdFazhXWXYrL2lDTkVKa1VMSzc2WDdDTmxtUldMNTZONy9KYVNOUzVj?=
 =?utf-8?B?a1JUU3dCV2RFZm5nd2EvcnNuR29MMm5zdjJTdE8wVTEvd1ZsY3RZaGg4emJS?=
 =?utf-8?B?YS9EeFJIVDl0SndDZFk0V0FQSm5LbGdZMlBBaEF6eG01ZEpXWSsyaWVWd2g3?=
 =?utf-8?B?UUlVMUF6VUEyL0NycWYyUGNUQzFzWVdCYWRrZW9VakV6cmpCZm5XMHZ6dDJy?=
 =?utf-8?B?SE90SFVsV3JvdTF1SnhIMDNXSTZJRk84Z0xHNHZlT3NEcC85QXFjZ25KZ2w5?=
 =?utf-8?B?cjFJSEhydDc3VnFIU0s3ajZGOEdKS1VIRFg3Nld1dEhsa0l0eUFTSzFTRkE0?=
 =?utf-8?B?aWxYMjcwSnB1MFA1MnAvazVpZjMzTnZGMFlib0tpYlZtSEVDTkVLNHM0d2ZT?=
 =?utf-8?B?aE9KM2psU0RURnZZQitNblpTeE5YTlhHaitXRDhrdHJBV3hpd3VVcWFXL0Fw?=
 =?utf-8?B?OFVDeXBhUXAxSCtwblRvUzEzbHVvYmg5bU5xYUNxM1JtenVCQ2tPSE5ubXdB?=
 =?utf-8?B?ZEcvN2I5SlN1ejlOeU85eXVzUjJFMm02dVVpZGI3dTFzTlYzOHo3VWR2SXVa?=
 =?utf-8?B?WC92TEFTaS8xTjdlUzgyejA5M1RoT3FvWG1iSUU2QUpwOXB1ZUpsOUluN2tk?=
 =?utf-8?B?UkhWWnRwODEydjErL0trRHVSTENhUGFUVzB4aVBSNFd1eFJrckV1cGwxT203?=
 =?utf-8?B?OHR0ck5IRkhtaTB4TWFBelJOTEdBYmhqOXVQbVlpV0lKL3hLT05aOEhWazZp?=
 =?utf-8?B?RjJRUkh3MHRvNjJDWVpFb1BjcmFrRGF2NUJPd3hSZFJKUlJWY2ovbTVobXJR?=
 =?utf-8?B?cjM0OU5iVGZ4eU41cW9jTE0yYy9sNnNERmpBbERYTUtoU1UrbmUyZi9HNFBt?=
 =?utf-8?B?RXA1SUdpVE1mNkdNcExZNDl6Z1BhYVIreEovZjA2ejlJR0RzQlMyK0ZoTjlw?=
 =?utf-8?B?N21GRmV3Mzc4d05KT2czdG52STRJVzJaVTc4cDNTZ2ZHMElrT21iS2ZCK2NY?=
 =?utf-8?B?b1VHNXZWUXJQaExhV2lBSENIa0RKNUY2Y3hieHF3Wk8zRzYxNFhORnpmeVU5?=
 =?utf-8?B?MEhhNEVpOTFja2FCd0FFcVdKT3IzM1lkUk1KSGg0aXcxTmg2Yi9BQ1N0TmND?=
 =?utf-8?B?RWMzTVVOSmtuOXdFbThURkVSNzdGemV3UTM5SjBRZTdodVlFZ0kvVG5pOUl0?=
 =?utf-8?B?bzVSYVZtUFRyVDA5UnFDWGdFSjQzS28wZGkzUGFIVWhVSXF1aUZQSTZhYlBz?=
 =?utf-8?B?NU1yMHJBTEduY3JXZmxtUGp1dkJsRFJwQ3dpQlhuR2R3dGhjTEdpQS9aU0Jq?=
 =?utf-8?B?TFdGbWUxNnJ1UkNiYUJLMzNoOFZqQStWL2N5ZzFZK0pkc0NtWUMrZGpKY05G?=
 =?utf-8?B?N1VwUy9GeC9nSGE4MjQ4QWQ1cUpnRThUajJDcjR5MlNwL2xRMFdEbUFRZk1K?=
 =?utf-8?B?bVlOMmNleEwrdHhMU1FtQ0pLTXhpYWVMTm5PRWYremNQR09JR0NtWWo3M0l3?=
 =?utf-8?B?eWF1QllwRzViV0lrNU9zRFRkczZmWlgxVGFrNTFrTDlqcU85ZnB6Sm5IRlRB?=
 =?utf-8?B?eWVZNWc0SFpOQXJmaFpobHlkUVFkWklaM1lDWG4yWFdkNlc0TzU1NDBpSmZz?=
 =?utf-8?B?WnRXVmk1OUkxaEtDTVZYMUpDOVZUemRza3lhWm1kb2RTZ2pWNURjM2lqRHBN?=
 =?utf-8?B?elVzMW1qZW9xaFIvSEE3S2J3SlBjM3N6SjBOVDRST2lLUkZrOXlKWGdFRXZy?=
 =?utf-8?Q?0EFzex?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 15:10:38.5121 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a00a7d-bfd7-4c7d-947d-08ddf07c336f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C713.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3511
X-Authority-Analysis: v=2.4 cv=MrlS63ae c=1 sm=1 tr=0 ts=68c194f1 cx=c_pps
 a=V2UHYC5GuLnLN4/Q0HMQeA==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=q6CKDgr7omsA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=8b9GpE9nAAAA:8
 a=Cf1N0SxhkViBRtZR7CYA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: NV0ZvLVYPQ6y9tT3tRfsasBHL48gf-i3
X-Proofpoint-ORIG-GUID: NV0ZvLVYPQ6y9tT3tRfsasBHL48gf-i3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA5MDAwMCBTYWx0ZWRfX8mO9Qn1w/qDf
 rqv9x4a5IrGm1zF89zusNoMIn++UAC7yc/ExCHYrkF+hc+ZyJI6H+LgFCAGfFT2FT64MOzYiYqb
 JJex3lQoqd5EJDQWWS5SuQahIKm0+MYTmJZEsQV+qTjk33vMGspaBkfmiqWN9BTAHgCHx+ipQTJ
 TunNQGzmQUv7lY4yCh3IByEco4qIBHPhgLx8bpRGlW1Ktftq+RXziPC1e7b16Dago0PmwGqqgJ6
 27JFaLAXTYsafHuIR1/lUbvIOSQJVn1uHg4kCn3WndZHmUmnXfkRaLAbNCDxyMA5UjZd7P1avPz
 93CnyJueDR7eTFJXqdR4/ienlGeP5wElvhocCsWqxV+jR44Vi93IiDxf4Y6qD+Lz757JXLBZc4K
 fyaNOoCL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_02,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 priorityscore=1501
 clxscore=1011 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 malwarescore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509090000
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 1/5] ioport: Add resource check helpers
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

On 8/8/25 17:11, Patrice Chotard wrote:
> Add resource_overlaps() and resource_contains() helpers.
> Code copied from kernel source.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   include/linux/ioport.h | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/include/linux/ioport.h b/include/linux/ioport.h
> index 85288c3729a..c12a7f70ad7 100644
> --- a/include/linux/ioport.h
> +++ b/include/linux/ioport.h
> @@ -135,6 +135,22 @@ static inline unsigned long resource_type(const struct resource *res)
>   	return res->flags & IORESOURCE_TYPE_BITS;
>   }
>   
> +/* True iff r1 completely contains r2 */
> +static inline bool resource_contains(struct resource *r1, struct resource *r2)
> +{
> +	if (resource_type(r1) != resource_type(r2))
> +		return false;
> +	if (r1->flags & IORESOURCE_UNSET || r2->flags & IORESOURCE_UNSET)
> +		return false;
> +	return r1->start <= r2->start && r1->end >= r2->end;
> +}
> +
> +/* True if any part of r1 overlaps r2 */
> +static inline bool resource_overlaps(struct resource *r1, struct resource *r2)
> +{
> +	return r1->start <= r2->end && r1->end >= r2->start;
> +}
> +
>   /* Convenience shorthand with allocation */
>   #define request_region(start,n,name)	__request_region(&ioport_resource, (start), (n), (name), 0)
>   #define __request_mem_region(start,n,name, excl) __request_region(&iomem_resource, (start), (n), (name), excl)


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
