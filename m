Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9682B84A9C
	for <lists+uboot-stm32@lfdr.de>; Thu, 18 Sep 2025 14:49:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CE8EC3F942;
	Thu, 18 Sep 2025 12:49:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C76BC3F940
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Sep 2025 12:49:17 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IC0kiC002541;
 Thu, 18 Sep 2025 14:49:16 +0200
Received: from as8pr04cu009.outbound.protection.outlook.com
 (mail-westeuropeazon11011070.outbound.protection.outlook.com [52.101.70.70])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 497fxh0tcn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Sep 2025 14:49:16 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X6Epu1MR+HLF7JR2WfCnXes7aL71dV8sJGYDCNeg6dbzzCApKVGYdfNlSOuP3UXvCzgmEzGVI7HgCaQAGs8Afla1ZMraC6weL3/LH72N6WqdZJ/uCiBUFuBCHs2cCixpeGix47e5e/87hbYDmjUzFiFD2UpoxtlYCoGExastcIwJpCYz6aL6TlNqge7iZiVxE9A07g0RhJG5Pr7NP6nwyvg7ZUTb1yygM/mU7AvIbD81rJknPHWlpsV8US4miA4KWb0sfyOHYV5OLUwzmBD6jsKAeGVz8mCwixNCZZyVsXE7gK7fO85k80IFWOwy7/DPzZDBzLm7AOosLYXKuJ0lpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rUTRCjQBKHDM0p+crVwzpVavrBlypRwuiUbWz51/WWY=;
 b=G9p+X3FGdh/AS+vDiQKwmEp5xR/TmaoKbOjAqRR4LVasBwKBTRmVz6uCE4uGDbPXCt9g6Q08sVvGfQ074q+umcIwvyHYtWHRWkQfb4385wLCrdQtFUV+6X8dX7Q79bjHoFGAX6ZfFVWhTcNqLDg/ZqymqfU4/7e4RCWznU1BrnvCo9kAOMhBbpxxDwDhOfALCdUboU6hBKRuNxlvLCrwYwyuF5ecxGU7X3d0Hu50lxrZ1Iy7CgwVZX0M7Z8XDtU9wXdyZ3uwmoawHgQvN3zFYN2YE5+0Ku8eHb6z4zG84DBq8tswG+G2MGIQceRfXLzh42Sjc5rkXQVpFSxU+gHpFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rUTRCjQBKHDM0p+crVwzpVavrBlypRwuiUbWz51/WWY=;
 b=ah6J+CDI7a6DTEUb+sp7pdwwZ+JDIjdffjpuAiTd6PZqNeuvx4BLxwtuhIcm1dSjrlKDks5Jn5SbzR58BswCAcHPB4PH7VkvciQTVcDRksWaEyVDx/zGLt9/b0vzR754gQZgMeZfgMxpWEFrTKZ/mLdWsNf/I6ObCUfhXge2vfPnJFwNbDksokLRczzHwPhaJSgPUWrpeyhilwMZvzF3xBYyhrb3V14AGYXlSkaj4HgQPJT/xd80Uzhbne0e5sPxb/+mkm33ZDQroF+t5ORYH8EjltUBY8MQhyZSxXa3BKcsVvO1dqGwe6AzmIiCMBrAa+wXsfwlfsNgXoUlgI/RTw==
Received: from DB8PR04CA0003.eurprd04.prod.outlook.com (2603:10a6:10:110::13)
 by DB9PR10MB5618.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:30d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 12:49:12 +0000
Received: from DB5PEPF00014B8A.eurprd02.prod.outlook.com
 (2603:10a6:10:110:cafe::a8) by DB8PR04CA0003.outlook.office365.com
 (2603:10a6:10:110::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.14 via Frontend Transport; Thu,
 18 Sep 2025 12:49:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DB5PEPF00014B8A.mail.protection.outlook.com (10.167.8.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Thu, 18 Sep 2025 12:49:11 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 18 Sep
 2025 14:46:46 +0200
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 18 Sep
 2025 14:49:10 +0200
Message-ID: <0330132e-7937-494d-b940-4b4a65b3b7b6@foss.st.com>
Date: Thu, 18 Sep 2025 14:49:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20250917143100.1.I876db43eb2dfbbd7882ab03bc49ceaab61e912ee@changeid>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250917143100.1.I876db43eb2dfbbd7882ab03bc49ceaab61e912ee@changeid>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8A:EE_|DB9PR10MB5618:EE_
X-MS-Office365-Filtering-Correlation-Id: 22ff9e3e-eb81-40a7-9ba1-08ddf6b1c433
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2c4b3EwK2U0eThuWk1nVU1ndnZYeDVHM2tYZkRqTWxHZERWTzBFUXNzSTMz?=
 =?utf-8?B?REdnMzNUZ25yUlVibUhMZzJuZEdUYVJDbi8vTkQxY2JJbWhRMFJPdnlUd1pF?=
 =?utf-8?B?blFDcDFLa0pXWFp6Q241VDdhbXVsV2ZhU2RQc1dSeXB6VFdsOWhja2g3K0cz?=
 =?utf-8?B?OTJkeEZJOG9tbUpaRWhlRU9TS2ora0Zpenl5RGlmYTFPOXJVcTdMVlA3dDFG?=
 =?utf-8?B?VGhCc1pOR0tpdk1UdkpHd0ZzdjArVDgxMkpHMk1KcEd5TnZuYU9VM1RVQ0Vl?=
 =?utf-8?B?UlR0d0xTSFcwTzhaNzBEU2VzY1l2SG5jZFE1TGR3eGhPaVc4TUtKcWFoR25s?=
 =?utf-8?B?V203ODdvRzh1MHYzcG01azFobktoWnR2ZkFKOTRvcTJKSXNmbFpNaHFnT0tL?=
 =?utf-8?B?MU43elQ5VEtMVHFPYk55VkduUm91TC9zWmkxaG9QK2xNZlZiN3NGUU1mcDMv?=
 =?utf-8?B?WHd6a0JjMlk5QlFsa09RQllUdW5aWXFqTFljSUFvWFVpbi9SRUt0OTMrdkNI?=
 =?utf-8?B?WnlIbWtDZ0hnTmhCbnkvU3dvWElCSTcydG9rTk1BVTh0SGhYeXpxUzhtek9Q?=
 =?utf-8?B?NmFkM0VnUjZOb1JpNWdLOWtXeFBVMVdOV0txNnpFakduci91T0dBczVBOVpz?=
 =?utf-8?B?UHk0OFEzSWc1eUVxUDFiNHlhS1FtK1hJWWQwTEVtZDFxSDVWVm81VkYvam1Q?=
 =?utf-8?B?WmV3THJLQlg3T1MxQUg1emNDNDlyNlVqV2hQdVQ3OW9wN1dKd3R0eEduL3dn?=
 =?utf-8?B?eTNkdnhVYVdwRzNieHd5T1AvUEwrNXcrdWZWTGk3VjRlUDFGblppMEUxSXUy?=
 =?utf-8?B?OWR2TWVoSWVQZ2x4ZjVyYUFFR3p4WGlWUnpXM05jazNETmo4cUNtc0Zza0Uv?=
 =?utf-8?B?ZUp4clJCUnA0THVuTE01L3FDZVVHVmVhU1pjaCtBcWEvTzFnV2Ntdm00ZzhV?=
 =?utf-8?B?Q1p2V2JmZkZEOVVQN3JWTlgxZTZaVmRUNTA2Q2RwRnhqbEJrRFFZN1g1cmJ2?=
 =?utf-8?B?d2FVc0N6ckZEOGY4SC9GcUNRRWw0eGdoVXAwaXZrL2s2bWFtSlY2NjZGdmhT?=
 =?utf-8?B?L2Y4a2hDa3hHaHh5RjhiY00wRm1lanR4TGdXbENIT2hjM3JBMzZKdDEzTVRz?=
 =?utf-8?B?MGZmQ0dqbmE0UGs3WEdiMUY1VUxPSXJGVWJVTUZ2QTlMQitmcjVCNmdyWUpq?=
 =?utf-8?B?cmNTYmxsSXBoU05ESWhDRExtVlZ0TElLQ3lBZE1Kd1RrbVVKWld0NkJvZEh6?=
 =?utf-8?B?M1JIRjlnOU95NzhsSTRZeW9zZnEwM1Y0Ny9Gdkw0Zjhacis1YUpNNWxENXQ5?=
 =?utf-8?B?MXNJcHRUemdxendnRituSURWcE5rUjVZZVFQTkkzVDNic2pBNWNvRUh2TitM?=
 =?utf-8?B?amtFcEYvSHZqYU1PSlloUmJ5SmczWXUrcTZVMTlhMDN1ZCtuL3daakZyZWlN?=
 =?utf-8?B?RFNJSjBibWZZYWQ3Z1RIa2dLSzlFbWJDYmltSC93RkN4dXFaUlU5dDIzdzBW?=
 =?utf-8?B?UStlYUw2YzdYN3czekRpMFN0dkdMTzBYNGdlK0ZCRDlMSFViSmxUbzByQzhO?=
 =?utf-8?B?N3NwWGxmd004cnIxRll6K1dMZ0J1RDk3Ym1kbzZ3MGVFYytMQmlxZThNL2Zm?=
 =?utf-8?B?TXI4NFNHMWppWnRjWUlqVEdrTE1UQXhGeWowaEtmb25UdHZSa3R3UXo5N25L?=
 =?utf-8?B?akJ5YXZsV2o0VUNiVS84TFdjblBsNmVOdThabCtSY1hTSjRGWk4xdzV3dysw?=
 =?utf-8?B?YVpjZG9vUE85ZlRObUp5U1lpbk9zQjBVQ0k4N1hDTUZzeEpWUTdYdkpJTTVD?=
 =?utf-8?B?NVErTDdQN0pvdFAxNFJTTjJkWVllNEN3T1lON0tJSzNmaWdxNDhmZzZtY0pX?=
 =?utf-8?B?cGRDM255UjRYVUJhakxGTGNLQWF0NjhibWRkNElONXhHMHBYcjhJSlo0SVdR?=
 =?utf-8?B?emlob2NSZmQ3Q1YyN1B4cGlVWjV1UEY0OXM0OUhoNXprS2t0dkM5dGx5ZUNv?=
 =?utf-8?B?ditEY2pwVy9HZHZYWjNjcDRIS2tyNENTSndiRmdCeWY1My9jbVRZbVdEU0tU?=
 =?utf-8?Q?+y0d2B?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 12:49:11.5738 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ff9e3e-eb81-40a7-9ba1-08ddf6b1c433
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5618
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX3Vb/sB0sOh06
 K6fe+6HnnCbQVe5Np0ptxn76J3nta2D0Ld4gdEvMw5FPnC29Zww7pTIARigNqKSd6xNnuB9dtov
 2rMJLUkS4o6+i0Sy6izynDAhp9bTe1JbKYyEHGlvbmlwOWXv57xzdP2PpBVCQ4Ea9SJ2H1D4vMB
 RvnlsrmlgdY+E8KkEjDvR+vpAKwKacPPiEwDmDgMbm9O52T+1yLwNVcDgAJQqA8uK6KMwvnnpb0
 XFcCZ3VRNH9kImIaoWzgiQ3jKnnr2pD8t/QLCee+Leor6IjpBaYr0SVRowAMi1XEFIPtdSZPQhd
 zeyheOaoePjvQRLXJMnpArR6P7wctDWWpR/qeizeIbK7jC9eEFPuHyG6ywEm7CEaO6LieH0UUlt
 TdapRnnH
X-Proofpoint-ORIG-GUID: qmAzq0n4TMadUBdHKffLZgP0Ak1YY7fE
X-Authority-Analysis: v=2.4 cv=aJLwqa9m c=1 sm=1 tr=0 ts=68cbffcc cx=c_pps
 a=x3S4GcavUoiRdHPsAlfwbg==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=SAHXIHsbQyQA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=8b9GpE9nAAAA:8
 a=G_Urt8D3EyQmmRm0BhQA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: qmAzq0n4TMadUBdHKffLZgP0Ak1YY7fE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
Cc: CITOOLS <MDG-smet-aci-reviews@list.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Nicolas Le Bayon <nicolas.le.bayon@st.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp2: update register used by BL31
	for boot parameter
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



On 9/17/25 14:31, Patrick Delaunay wrote:
> Use the ARM64 kernel booting register settings, defined in Linux
> documentation Documentation/arch/arm64/booting.rst:
> 
>  x0 = physical address of device tree blob (dtb) in system RAM.
> 
> so kernel can replace U-Boot in FIP without modification of BL31.
> 
> Use x0 for future TF-A version and keep x2 as fallback to be compatible
> with previous version of TF-A BL31.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/stm32mp2/cpu.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/stm32mp2/cpu.c b/arch/arm/mach-stm32mp/stm32mp2/cpu.c
> index c3b87d7f9810..e081dc605b84 100644
> --- a/arch/arm/mach-stm32mp/stm32mp2/cpu.c
> +++ b/arch/arm/mach-stm32mp/stm32mp2/cpu.c
> @@ -92,13 +92,21 @@ uintptr_t get_stm32mp_bl2_dtb(void)
>  }
>  
>  /*
> - * Save the FDT address provided by TF-A in r2 at boot time
> + * Save the FDT address provided by TF-A at boot time
>   * This function is called from start.S
>   */
> -void save_boot_params(unsigned long r0, unsigned long r1, unsigned long r2,
> -		      unsigned long r3)
> +void save_boot_params(unsigned long x0, unsigned long x1, unsigned long x2,
> +		      unsigned long x3)
>  {
> -	nt_fw_dtb = r2;
> +	/* use the ARM64 kernel booting register settings:
> +	 * x0 = physical address of device tree blob (dtb) in system RAM.
> +	 * so kernel can replace U-Boot in FIP wihtout BL31 modification
> +	 * else falback to x2 used in previous TF-A version
> +	 */
> +	if (x0)
> +		nt_fw_dtb = x0;
> +	else
> +		nt_fw_dtb = x2;
>  
>  	save_boot_params_ret();
>  }

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
