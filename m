Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE17B554E4
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Sep 2025 18:45:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE69CC3087B;
	Fri, 12 Sep 2025 16:45:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F44AC32EA8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Sep 2025 16:45:36 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58CGWJRO032223;
 Fri, 12 Sep 2025 18:45:25 +0200
Received: from duzpr83cu001.outbound.protection.outlook.com
 (mail-northeuropeazon11012052.outbound.protection.outlook.com [52.101.66.52])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4929f1ar44-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Sep 2025 18:45:25 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tv9f7CDXBgBMcJWV8z8fUp9bkIN6Mo3be4BCOQFmAxpNQ+7mkI+92H3Ov4hLFCmUxD8QgPkBGBwMHb1xl/FCNJIiw+8zJGDBJmUeDQUXwxdhNrnpSAwJ/I2PMr7A5dRSEFipA7WLQNRM8+ewRkOTPGJaJBfiFsmhuvmx4EN7nm7zP7rcq3NNkg3ole43QHCz4HPsyhTcY62XpIxpUQSJlxeQ+1qRrbhejHa24AV3upjoclD1bZ8RCIZZrJ4U1H5QKF7ZlYQVeFqSHydgBfyaMfFL6R4IU8q2Ou0/XrYS+056GR9zax0Nd0zhYEhHCxjaAIx9V6pe7QOuPJanLg7nLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l2VXlMwOKPg634kyYiz4U3uSPdADJdOrDfX8zJqCYWw=;
 b=rqEW+F0pgoM85adU2M0sMBPksB03A5bXhE/h31thjFvzR8lpUaj0tLI4WNbYbvAC0Kld7UX6bk+QovMnheDRMRWsrxAQt3hbtxiZLVQ9to7iJN6WbJX0MLciFMzIkT6DwPp4MTxM/6Tzxy6SIbhwsCefy/EldVUxJdIKaCcCjNQo9iOlQGtbZnDM3J2bg4nlTYLCs2exoPC3SyHQv+slYCwEt2i8IdotZ5oBcmrqa1p9/M3PvOjnwgj6wM8kQOCN0Ve6DEpYELkVoEpJcbNlDs0zofz5SWHl+tXGdBq008AWV1bqpBtrIQJ0hvUTprw2z+AifLTTX90+tzKUqU+QfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l2VXlMwOKPg634kyYiz4U3uSPdADJdOrDfX8zJqCYWw=;
 b=YSDqflC2B+PH4IWT10W2+/G7SPUmOZwo61QvWkdXTMI2eKQsQON7Izi+soCI/8bD3uLU5KZo3YuZAbtqOsUxBP6ESVbbwBb4hHn/UgyepPtwDy7rwBo4O+9PKbl5KwVPOpNswCS5N+/cliAtQQww8ja6lM26nEj7DWoApSOadECHiojUdyTFhbFFHPJBjdh7ZnvIbken9MoJUk3rVAlEjCVxoRkG7MNLYYHeE7J8Yk/NPu+rX7JG7VN/QXKsLauFR1Nufge7e+LCykZD9WyCXG653sD+YyTG+6hgeihe8yG2wjy6Vy/vlmy+9WwmdScFYa9Pcm1jaDWfiZN5kBMGig==
Received: from AS4P192CA0018.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::7)
 by VI0PR10MB8426.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:235::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 16:45:06 +0000
Received: from AMS1EPF00000045.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::3d) by AS4P192CA0018.outlook.office365.com
 (2603:10a6:20b:5e1::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.18 via Frontend Transport; Fri,
 12 Sep 2025 16:45:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AMS1EPF00000045.mail.protection.outlook.com (10.167.16.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Fri, 12 Sep 2025 16:45:05 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 12 Sep
 2025 18:37:58 +0200
Received: from [10.252.28.204] (10.252.28.204) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 12 Sep
 2025 18:45:04 +0200
Message-ID: <dee1514e-9886-4cac-8e85-bf743913978b@foss.st.com>
Date: Fri, 12 Sep 2025 18:45:03 +0200
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
 <20250904-master-v3-5-b42847884974@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250904-master-v3-5-b42847884974@foss.st.com>
X-Originating-IP: [10.252.28.204]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000045:EE_|VI0PR10MB8426:EE_
X-MS-Office365-Filtering-Correlation-Id: c75bc339-40ae-4818-0c8f-08ddf21bba21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bTFqOXNCTzBhSjM1WVdTeXlKcGRrVkdpck5YZFNNb1FkMTl4ZnFjSzR4TVVv?=
 =?utf-8?B?aGNQY0pjVTEvcmpvTUpITlY3TU02L3ZjWkNOeUo3cDIrWTFOR2lKOUNkSWFm?=
 =?utf-8?B?YnRteENKY1Z6MjFEZStmeDN0M1k0bXR6SWdBdVpRKzYvZDdhOHZ6a01iQnJB?=
 =?utf-8?B?ZW9jUkpPM2lIUUJnNlhnRUF6MDJwR0ZHZVgzR1pjTFg4R2NtN25SOGd0K1N5?=
 =?utf-8?B?N21qb092N0x4ZGZRV2xzM2RJYTFpSmpsNVNwZy9zNENlV2hiMWVZWVlXQ3Nw?=
 =?utf-8?B?QzRPSm52VGdyWEhhZ082T3dRK04xMlNnL3Q0bjhWTzkrTGtJYWNUMVpqSVR0?=
 =?utf-8?B?NjBicDZ1M1hyVjZzZTgrNlhuRWZPV1hDanZpcjAwTHQ3QkxXNW5pZGtDa3NH?=
 =?utf-8?B?VkNsNTlVdEY0ck9HaGdSMDlPM2E5dkR3bmEyaVpVdDJMd2ZGVVpaUjJlcXNs?=
 =?utf-8?B?NGRtdEs0SXV0c0x5bWVsT1JaVGhneG5hQXZ4RzNxMlMvS2YwMTBlcUVoSllY?=
 =?utf-8?B?N0VYazhTdU45ZnZCbmE2MHE3dWlzRVBUbGlkdnc4anVVOTU4ZjlPeEFkOHB4?=
 =?utf-8?B?YWsrS2YvT3BGSXMxRWZPSEFBTVFFN01DWHNxeittZEpsK1JDZFBSME9sWWNL?=
 =?utf-8?B?bStud2dzdUtCUGJTR1prNkNOeVJXbzNPeGxGUlhRSFNrVy94U3lZZFE2MEwx?=
 =?utf-8?B?dnllVFBKQThYbmFlNnVsMmFXSGcxMXRRd3VzNnlFRTR4UGtSVkMyRWJsYXRp?=
 =?utf-8?B?NkVPMUlLNU9PbDdzK2wydW9yQUhvNVhmMzUyOWhNb1NnWExId3VsZllyRy80?=
 =?utf-8?B?dkFrbUVhMmRWL1dLdXp6MnN6WXVNQzRWd2w5OEt0ZWViUVljaXp2TDVSMzI4?=
 =?utf-8?B?NSszWDc4d1pIVG41dTRRN0VxY2doU1VCMWwzQk91eHdaV203a2VGS3ZvSVhP?=
 =?utf-8?B?SE54SjY3M1pobG9hcXhOVlRqZzZOeEwxTzRTaEwxcHNiVzJ6RTU4aFpxRVkz?=
 =?utf-8?B?UnNBVmhUMENaMTVIc0lmZWIwdkI5YitaeWFlemNNcFBwRENyY0FUZ3VuVDgx?=
 =?utf-8?B?a1ZjcG5SUEZhRzVPS0NsTnFibzcxZW13aHVHWVlXd05wZ0tCa1EycFBEbjR2?=
 =?utf-8?B?OW54dVcxM0l0cWxBWmJodXBNTDFvZGJLOGJWaS9WOVM4RjI5SjVYQVErYUVS?=
 =?utf-8?B?N1lwSExMbHgyQWhxLy90MHpkbU4rRWh2clpVdTJXZnFjNHdZNEJJZHh4Tk9I?=
 =?utf-8?B?RS9RV3JWanE1TXhuNTQxYysrSTZVc0R1QnJSM3lOV1F5UElRQWlnMkFxZEJG?=
 =?utf-8?B?am5qUFRxRndxcXAvL3VNVWdmT0ZSdmtkWElJYWJJTktMWDByNkk3RVpMN216?=
 =?utf-8?B?TVMvRzRWOTJ0S3NTSzd6VjhtbEFGU0NoMWtRaDJsWHBYZDBvV3crQjZNamI2?=
 =?utf-8?B?c1lIKzkyS1Z4MHdOTE9Va0NxaHBQQ2R2S2tPaGQxOWRiaDlpMHZmeWp2b1R5?=
 =?utf-8?B?aG1WekdtYmtzMWt1ZjVHVlJjWkNoZG56Wk02K1hqS0NxWTVvY29lbmUvcTJV?=
 =?utf-8?B?WFJKU05WcEdhMUhKVXpxWjU5SEQ2QTFVWmplVnZ2TGo1cHIwZ1llbktKdFpX?=
 =?utf-8?B?YnduR2RaY1NESFl2bEp1R3dXSVVaKzFMWFkzZERaNG9vWmlSelpsZnBaY2U3?=
 =?utf-8?B?Y2VDUGxRbHBVMVpCY0t4UmY3MHRDMW9jaEhaUklSQm9NMU1vNE5GRTIyOXR3?=
 =?utf-8?B?ZE1yT0RvdDR1NUl1eWphZzZQenUvVVk0TFZYbDZuTmVUSzZFWC85OFZDeTkx?=
 =?utf-8?B?Z1JESnJSbzJpRHRjcklIekVqRUNINHFGc09rNzFaWG0rNWhsYlRSY2pLWEE5?=
 =?utf-8?B?WU41eVJTRkRzTnlZaFN5eVZ4ZmViWGZrWXNzbWRzZlo5bE9lbUk1M09YTHJj?=
 =?utf-8?B?a2k2RSt2emdDT3lnN2dpUGtCeHNMUW51YTFhN3kxeUxjUndZM2c5Vno4N2dS?=
 =?utf-8?B?L0tjRC85ZWFLTWxMZlRaMXRhK1N0SFdIV3A4V2lpempWdTdGTjFTQWd5bWlY?=
 =?utf-8?B?eFY3KzFuUm9xT3dWUVByM1dtYXY5dzdST3IyZz09?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(921020); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 16:45:05.6296 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c75bc339-40ae-4818-0c8f-08ddf21bba21
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8426
X-Authority-Analysis: v=2.4 cv=MrlS63ae c=1 sm=1 tr=0 ts=68c44e25 cx=c_pps
 a=egrrylluWbB01yBCVLFUOA==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=d2j-ISUXm-8A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=8b9GpE9nAAAA:8
 a=UryeceJsr4wA0q-kvWEA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: Ex3TgYAoByskrpRLqGASL3_B3_G18S2w
X-Proofpoint-ORIG-GUID: Ex3TgYAoByskrpRLqGASL3_B3_G18S2w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA5MDAwMCBTYWx0ZWRfXzicOxkfp6jz/
 eIClk3n3kaLdNaQWRAuiAg6YHtPk0xAV/SnPOShWSV4zklw/5k0bUE/NcW1wlsTjs0Sn/1SwYn9
 tbdyjuVdcOqknNgC74cT24ild29v6fInXP22zrAMHdqw8xeciCWddmuYy0lX4QJgM0PDMF2vVY+
 xQ4KG3FZpM+xjw1xgQaiXCAMdefKyB83K51n3XTlm52tGbOHpdmaT0QpWQRq3ihsJ8EdAkkZSuW
 RTC1uMQV0L844RJuKUFPkyOHUcBopWwAn25EF02vjkhpdOmWCcn5b5791+IJA1aqBpzLOTxb+jV
 GoVg+Z4OGSjiav4JFj5W885OZtJVn5INSk6suyrfl8FtAkeFP9uQwrrMNZjx2RhEbOeHgqwrEk+
 VPgN4bpS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_06,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 priorityscore=1501
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 malwarescore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509090000
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 5/7] video: stm32: ltdc: properly
 search the first available panel
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
> Initially there was only one DSI bridge with one panel attached to this
> device. This explained the call to uclass_first_device_err(UCLASS_PANEL,
> ...) which worked fine at the time.
> 
> Now that multiple bridges and panels, with different technologies, can
> be plugged onto the board this way to get the panel device is outdated.
> 
> The lookup is done is two steps. First we circle through the
> UCLASS_VIDEO_BRIDGE, and once we get one, we search through its
> endpoints until we get a UCLASS_PANEL device available.
> 
> Acked-by: Yannick Fertre <yannick.fertre@foss.st.com>
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  drivers/video/stm32/stm32_ltdc.c | 136 +++++++++++++++++++++++++++++++++++----
>  1 file changed, 125 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/video/stm32/stm32_ltdc.c b/drivers/video/stm32/stm32_ltdc.c
> index efe9a00996eca0301d2a2b82074ba9690a967a73..834bfb625d2d34a44bd8edff1c92af6dec344c20 100644
> --- a/drivers/video/stm32/stm32_ltdc.c
> +++ b/drivers/video/stm32/stm32_ltdc.c
> @@ -17,6 +17,7 @@
>  #include <video_bridge.h>
>  #include <asm/io.h>
>  #include <dm/device-internal.h>
> +#include <dm/uclass-internal.h>
>  #include <dm/device_compat.h>
>  #include <linux/bitops.h>
>  #include <linux/printk.h>
> @@ -495,6 +496,101 @@ static void stm32_ltdc_set_layer1(struct stm32_ltdc_priv *priv, ulong fb_addr)
>  	setbits_le32(priv->regs + LTDC_L1CR, LXCR_LEN);
>  }
>  
> +static int stm32_ltdc_get_remote_device(struct udevice *dev, ofnode ep_node,
> +					enum uclass_id id, struct udevice **remote_dev)
> +{
> +	u32 remote_phandle;
> +	ofnode remote;
> +	int ret = 0;
> +
> +	ret = ofnode_read_u32(ep_node, "remote-endpoint", &remote_phandle);
> +	if (ret) {
> +		dev_err(dev, "%s(%s): Could not find remote-endpoint property\n",
> +			__func__, dev_read_name(dev));
> +		return ret;
> +	}
> +
> +	remote = ofnode_get_by_phandle(remote_phandle);
> +	if (!ofnode_valid(remote))
> +		return -EINVAL;
> +
> +	while (ofnode_valid(remote)) {
> +		remote = ofnode_get_parent(remote);
> +		if (!ofnode_valid(remote)) {
> +			dev_dbg(dev, "%s(%s): no uclass_id %d for remote-endpoint\n",
> +				__func__, dev_read_name(dev), id);
> +			continue;
> +		}
> +
> +		ret = uclass_find_device_by_ofnode(id, remote, remote_dev);
> +		if (*remote_dev && !ret) {
> +			ret = uclass_get_device_by_ofnode(id, remote, remote_dev);
> +			if (ret)
> +				dev_dbg(dev, "%s(%s): failed to get remote device %s\n",
> +					__func__, dev_read_name(dev), dev_read_name(*remote_dev));
> +			break;
> +		}
> +	};
> +
> +	return ret;
> +}
> +
> +static int stm32_ltdc_get_panel(struct udevice *dev, struct udevice **panel)
> +{
> +	ofnode ep_node, node, ports;
> +	int ret = 0;
> +
> +	if (!dev)
> +		return -EINVAL;
> +
> +	ports = ofnode_find_subnode(dev_ofnode(dev), "ports");
> +	if (!ofnode_valid(ports)) {
> +		dev_err(dev, "Remote bridge subnode\n");
> +		return ret;
> +	}
> +
> +	for (node = ofnode_first_subnode(ports);
> +	     ofnode_valid(node);
> +	     node = dev_read_next_subnode(node)) {
> +		ep_node = ofnode_first_subnode(node);
> +		if (!ofnode_valid(ep_node))
> +			continue;
> +
> +		ret = stm32_ltdc_get_remote_device(dev, ep_node, UCLASS_PANEL, panel);
> +	}
> +
> +	/* Sanity check, we can get out of the loop without having a clean ofnode */
> +	if (!(*panel))
> +		ret = -EINVAL;
> +	else
> +		if (!ofnode_valid(dev_ofnode(*panel)))
> +			ret = -EINVAL;
> +
> +	return ret;
> +}
> +
> +static int stm32_ltdc_display_init(struct udevice *dev, ofnode *ep_node,
> +				   struct udevice **panel, struct udevice **bridge)
> +{
> +	int ret;
> +
> +	if (*panel)
> +		return -EINVAL;
> +
> +	if (IS_ENABLED(CONFIG_VIDEO_BRIDGE)) {
> +		ret = stm32_ltdc_get_remote_device(dev, *ep_node, UCLASS_VIDEO_BRIDGE, bridge);
> +		if (ret)
> +			return ret;
> +
> +		ret = stm32_ltdc_get_panel(*bridge, panel);
> +	} else {
> +		/* no bridge, search a panel from display controller node */
> +		ret = stm32_ltdc_get_remote_device(dev, *ep_node, UCLASS_PANEL, panel);
> +	}
> +
> +	return ret;
> +}
> +
>  #if IS_ENABLED(CONFIG_TARGET_STM32F469_DISCOVERY)
>  static int stm32_ltdc_alloc_fb(struct udevice *dev)
>  {
> @@ -532,6 +628,7 @@ static int stm32_ltdc_probe(struct udevice *dev)
>  	struct display_timing timings;
>  	struct clk pclk, bclk;
>  	struct reset_ctl rst;
> +	ofnode node, port;
>  	ulong rate;
>  	int ret;
>  
> @@ -568,7 +665,7 @@ static int stm32_ltdc_probe(struct udevice *dev)
>  	}
>  
>  	priv->hw_version = readl(priv->regs + LTDC_IDR);
> -	debug("%s: LTDC hardware 0x%x\n", __func__, priv->hw_version);
> +	dev_dbg(dev, "%s: LTDC hardware 0x%x\n", __func__, priv->hw_version);
>  
>  	switch (priv->hw_version) {
>  	case HWVER_10200:
> @@ -589,13 +686,35 @@ static int stm32_ltdc_probe(struct udevice *dev)
>  		return -ENODEV;
>  	}
>  
> -	ret = uclass_first_device_err(UCLASS_PANEL, &panel);
> -	if (ret) {
> -		if (ret != -ENODEV)
> -			dev_err(dev, "panel device error %d\n", ret);
> -		return ret;
> +	/*
> +	 * Try all the ports until one working.
> +	 *
> +	 * This is done in two times. First is checks for the
> +	 * UCLASS_VIDEO_BRIDGE available, and then for this bridge
> +	 * it scans for a UCLASS_PANEL.
> +	 */
> +
> +	port = dev_read_subnode(dev, "port");
> +	if (!ofnode_valid(port)) {
> +		dev_err(dev, "%s(%s): 'port' subnode not found\n",
> +			__func__, dev_read_name(dev));
> +		return -EINVAL;
>  	}
>  
> +	for (node = ofnode_first_subnode(port);
> +	     ofnode_valid(node);
> +	     node = dev_read_next_subnode(node)) {
> +		ret = stm32_ltdc_display_init(dev, &node, &panel, &bridge);
> +		if (ret)
> +			dev_dbg(dev, "Device failed ret=%d\n", ret);
> +		else
> +			break;
> +	}
> +
> +	/* Sanity check */
> +	if (ret)
> +		return ret;
> +
>  	ret = panel_get_display_timing(panel, &timings);
>  	if (ret) {
>  		ret = ofnode_decode_display_timing(dev_ofnode(panel),
> @@ -624,11 +743,6 @@ static int stm32_ltdc_probe(struct udevice *dev)
>  	reset_deassert(&rst);
>  
>  	if (IS_ENABLED(CONFIG_VIDEO_BRIDGE)) {
> -		ret = uclass_get_device(UCLASS_VIDEO_BRIDGE, 0, &bridge);
> -		if (ret)
> -			dev_dbg(dev,
> -				"No video bridge, or no backlight on bridge\n");
> -
>  		if (bridge) {
>  			ret = video_bridge_attach(bridge);
>  			if (ret) {
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
