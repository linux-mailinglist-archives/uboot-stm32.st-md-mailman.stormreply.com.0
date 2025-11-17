Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3459DC629C9
	for <lists+uboot-stm32@lfdr.de>; Mon, 17 Nov 2025 07:58:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF81DC628B2;
	Mon, 17 Nov 2025 06:58:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D14CC030AF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Nov 2025 06:58:19 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AH6jBUf449362; Mon, 17 Nov 2025 07:58:06 +0100
Received: from db3pr0202cu003.outbound.protection.outlook.com
 (mail-northeuropeazon11010055.outbound.protection.outlook.com [52.101.84.55])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4af3y5361b-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 17 Nov 2025 07:58:06 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBInDBav7+nWY//7yQO5RO4VS2yeXQNg3PxHuXlZ5NwWxTre2qyJ2is/SmjYBDhX2hOShqOL5e36N+s7FhAd/ERqyps/xiRtRTJKzElrdhI5EHF4/6/RuZ3Cr5UEDmzQvkboDDlygPUo9ef/SxM0RaHNk7Fsxb0w5AG2Uouty5C6Ob20ux7ZNG2Fzl9m0KgCrcpyWVEBeO+CjDrROrCdCX8F/hW0w/NT61epY9dPai5qzD7ighOkzjaNgHkSSJhWjOmQ2hG3I2BDJHgA8sYUMsrUH+/EB/FEbDS4fVwXX6fIN/BzjqlY3jbZ4rFtfmw1BUb2vjjoqqFcFfPwbHwsUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivazGoPo0JnoZTKihtP3N3+yg9gTgqJ0nH9sss5L2D0=;
 b=wuB52QDdgsexLF4Uk1elU+W3EDQhnhMM0d1uTQZR8kN6TNtseasviJBbhzMjqQcAUx/b3wPLkaz6yRlkR68m26QLrmIxzUQPKybq5gUnhEbO9LLYDAOl07b/o3GktS69f/ZjEJLhuJ8f1vPnLk6gCSO9NMmubas/LnpMVgrgNI0yu5IU8nDE2mDlBmwKlMN+u38AXoQyJL6+CJIux3feipjBSxLPz1WjXRvUmrtQIOWoJLj1e+jFZ/xWr0pZnKBs6WpPL9FFpbFk+RrNoX4sUojO/1RBNaTXXAuAUVUKJpqEf8DOrVulbr2Zszb9VvMrfCj6PFr/U04Kup3Bg/auWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivazGoPo0JnoZTKihtP3N3+yg9gTgqJ0nH9sss5L2D0=;
 b=BRsB+kLIN2hDQPn+HalQvUB8P8BQ+Q557rPSqSTKZlZxyqa/RL1gP4ZHRtz2ERUboREMIBp8spHtoVepjeim6uRha41/GyMeCUQqZD1/KjI3XnKIoiF67i6a7fyLDNHKI9pEiG3fo3RZvyjFM30EcF/natDkwnn7vRGaLpH45pEKu6oEQ6E/qrzmEcBRySuRBzRgGaWVK/EuKEo1TTCYmyRbJ1lpONmnHUoMyYGG27iKIzBdOrLeciTy31x5m1UMZZG9MPOH0+t3tTQWxY4345bg98VJfAjydsOxEGYihzPKK2fQaONG2ncxGij/oOgpbjlbxgMAmbwNYhj8v2fbgQ==
Received: from DU2PR04CA0178.eurprd04.prod.outlook.com (2603:10a6:10:2b0::33)
 by GV1PR10MB6420.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:80::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 06:58:03 +0000
Received: from DU6PEPF0000952A.eurprd02.prod.outlook.com
 (2603:10a6:10:2b0:cafe::2d) by DU2PR04CA0178.outlook.office365.com
 (2603:10a6:10:2b0::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 06:58:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF0000952A.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 06:58:03 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 17 Nov
 2025 07:58:16 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 17 Nov
 2025 07:57:52 +0100
Message-ID: <2ec17a02-4711-4a33-aea0-988a13223d49@foss.st.com>
Date: Mon, 17 Nov 2025 07:57:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20251023214733.181352-1-marek.vasut@mailbox.org>
 <98b4222b-c95c-4540-b9c4-6c3791f573b2@foss.st.com>
Content-Language: en-US
In-Reply-To: <98b4222b-c95c-4540-b9c4-6c3791f573b2@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000952A:EE_|GV1PR10MB6420:EE_
X-MS-Office365-Filtering-Correlation-Id: d3e08826-6cd4-4cdd-7d00-08de25a6a71a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vlk5ek5sbC9ZNFhhLy80L1BKSTNoa25hNGhxM3FqcElkc0s5TWEzNVdFYzdT?=
 =?utf-8?B?aEV6ZGdhWVIyREgyY3FJdU55am1UeDZPK3V2UWNyRWhDT3RLTFBtbDVXY1lN?=
 =?utf-8?B?dTJRcUpOaTVMQ3FRa1pGTVZEaVRkM1dlLy9xUHV4YkhSN1JMbUpCVTRqZ2dK?=
 =?utf-8?B?bFV5Q1pLM254cVJ5NW5iSm15MkVoYS9BbW5zdE54Vk5NTDI1aUxka3JiMVRJ?=
 =?utf-8?B?OTRSRWZydEJhdVBwQ0N1MXY1R3JDYW1MUUVudnc1U0xUemVHdlgva2k1M1VX?=
 =?utf-8?B?Y05ZZEVkbHkwZW92RHp0NlVxcWZKM3ZXUE05OHVTeUVtalAzSlFqSTU2VzRQ?=
 =?utf-8?B?QlZsRHdRdnRIaU9BWndINzZOQ1ZiTkVZSDhBcVZ0QzNuRXRoQXlqK0FsVlF5?=
 =?utf-8?B?WGtRNWpRRXhTcCs2SWtDYkNOcVY4NDhyUjdBVWdpQTY4blhjeUZEWnZmODRV?=
 =?utf-8?B?Ym04bXRHY1hWRXNVRTJTS3h2dC9pM2VUS09mLzlRWnNSV3NWTkdEMlhYbXJu?=
 =?utf-8?B?ZEF5RittaVhma2NOQTRKRDh0MUZRcFRvOXdvVWFrZVNVZzNQYUJob0xaTnVt?=
 =?utf-8?B?bjg3NVlFSzRBbnhTZHpPb3BMUnhHWVRnb0ZlTW5NSXJnaG55ODZnODRnM2li?=
 =?utf-8?B?czR3WE9odGM3eXkzaEhFZU9QU0xWVXVkVmpsTldqM1RKNTJpQVoxNDh4WTh0?=
 =?utf-8?B?M2xTaHR0UGI4eVVUM2JEWDRzRnZzQkliUjRYK2ZLWlJuWVhkK3h5K3lKQWNW?=
 =?utf-8?B?UXlkWFgzamVvY0dpbmdRUk50VlcwY1dCOUNseHovV01tWGwxb3duYTduaThK?=
 =?utf-8?B?UjBud0VnTjVKSVhrSGM1TFRuemdISWFFSjduelhoRGplMGRURHY1R05nVlFj?=
 =?utf-8?B?M2ttTEY3OCtGaGFVbEl3bnZjeFBQNWxjaVpKM3h2czdFbG43MW5vSXVlNVpX?=
 =?utf-8?B?UjhFKzB0ODJxZE1PZEhoZmx4aExqRTl4TW0reitES1ZZQ3o4eDVua0p3ZWZu?=
 =?utf-8?B?dW9wODZ2WnpURVM0dVhvWUp6M0UwaVd4N3ZvQWR1Tk1yZ3RyaXg4ZDd1dnpI?=
 =?utf-8?B?MWpnVVB5ZEROS3luZER0L3FmYkIySFFRbjNuV2R1bEpKNUcvZ1ZwUzV4NUpB?=
 =?utf-8?B?ZnlZVTIzTGdkbS9laFlQbDZxc1dscndYVUtRcUVtblk0eWFXc2VKS1pGQVE4?=
 =?utf-8?B?Uk90ZWZ4UTJ3OXl0b04wdlJham8zaXRrYTdUWmdvaHpwTzcxcnFzeklKMCt6?=
 =?utf-8?B?ZWU4T0tyWDdiYXZTeUxSb1k2SHp6SE8xaHJmbnJVR1pZZEU1eTY5bm5sNnpP?=
 =?utf-8?B?OVkvaVZ5ZVpIckNRbkswZ3FBK3FMWXNTalhpb3ZROE5XNS9tQlMvYmp5ZndQ?=
 =?utf-8?B?UTZQUXd6YlUyV0Z5WXd5MmZRZmNFc0lLb1ZudlFOc1BYekhXM2NLRkw3NjFK?=
 =?utf-8?B?MGh2SkQ5alR1ZjRuTjJTUUhTWm56ZGxhaTFERkwvSkh1cnBQK0s5MGZGQ2ox?=
 =?utf-8?B?VTE5K2VtcVBnU2hZdXlrNEFpbHVGSXIvNUhMdm4zS3hJS3pBYXE1NEtZVmVt?=
 =?utf-8?B?REh0M0d0czExTWRUdncyU2J4OTdYUzV1UWZITDVVdmNBNUpURk5iWEYrT2ZP?=
 =?utf-8?B?MnBNaGdrdEFURnlmbkpWM0s3ai9QVkxxYlhsdFB0akI4Uk96YU0rNktISTh4?=
 =?utf-8?B?M1BsSFhUQ0ppYlM5NC9rd2loVGtBSlAxYlYwazdVNXRHTk8ySzlZaWFUelhj?=
 =?utf-8?B?MTYwUGJTc0NFbWN1cm92N05BY01IM2ppREZHZDVuZUlzdTBseHZ0NlYveGVm?=
 =?utf-8?B?aVQwVTZ3dlJjZytSazRnMFBFTzVwNjhsZDJiVnZRS2laVDdRSm15R2ZhcCtz?=
 =?utf-8?B?aE9kUUpFbkt1Mnk2aDVEZ2tBL3VsWW54UDZLK2dxc2JrcEJ2YTlyNXd1Q2ZD?=
 =?utf-8?B?WXpnMzJQKzR2TDJYcEF3SlBaSmwzSGxCNmxPNWwweU96ajd1WnB3Q1Z5enBI?=
 =?utf-8?B?eWZoZjVRVkxMWHc1Mlh3QkVLOFArWWwzSDFTR0g0RldwUkpuSlFESmRuZWpW?=
 =?utf-8?B?TmlpK3l4ZUk1RGkwNDdjTzd6enQ2dUhTZmRMdkV3MXowSUZVdmlHQTl6VG9O?=
 =?utf-8?Q?wwjg=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 06:58:03.0474 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3e08826-6cd4-4cdd-7d00-08de25a6a71a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6420
X-Authority-Analysis: v=2.4 cv=cYzfb3DM c=1 sm=1 tr=0 ts=691ac77e cx=c_pps
 a=kCOSX7cnmHFHTISVRe8GaQ==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=b3CbU_ItAAAA:8 a=8b9GpE9nAAAA:8 a=k-42gJp3AAAA:8
 a=zk4-lHRcAAAA:8 a=phlkwaE_AAAA:8 a=0o9KBZmniUAFvKZgtfEA:9 a=QEXdDO2ut3YA:10
 a=Rv2g8BkzVjQTVhhssdqe:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=uCSXFHLys93vLW5PjgO_:22
 a=7cv85riZL9-k45RWW8P6:22 a=uKTQOUHymn4LaG7oTSIC:22 a=cPQSjfK2_nFv0Q5t_7PE:22
 a=HhbK4dLum7pmb74im6QT:22 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
X-Proofpoint-GUID: 5Dws5bIQ_lpgpXRcqsJXj_vVLZaoKT8P
X-Proofpoint-ORIG-GUID: 5Dws5bIQ_lpgpXRcqsJXj_vVLZaoKT8P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA1NyBTYWx0ZWRfX5ULbFvSx55FP
 4HETTOZiaZvLJhKBrbBpEPt3gAEHiUmbWewYLnQrLVqolnNyyVFd3zVP6y+WVlqd6jbxljFMj5K
 jq8Yv94d+vSgE9KQOB9yugnxJ4D7ztF0AUyfcfXxfvuxtl7QjLOgUQAxXckvUuvU4s6+TlDhyxf
 WQpJXX62/davS6bZMqB1qCGCNn/z6ysSm3gWcpjZoJvGHdxIoLbygBu2QniFg6bzjANamcSr+91
 IE6z02myO3tWZt/g2bQk/KkxUEbz3/PhfhwdOv0ROpmDNlOa7pwc3W+t4PEjZOSBIA3U+v/ztXd
 HmjNbVOa6w4OqnOFjbqZhVVzG0digWMzFJq8/ZweXdGgPYf+V/P/K5fpZXpGbt8T/2QGZdCumO2
 2aFWuUZJjF4Nt7Eo3Z8H0BZeEUltKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170057
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: Keep the reg11 and reg18
 regulators always enabled on STM32MP13xx DHCOR
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



On 10/27/25 17:37, Patrice CHOTARD wrote:
> 
> 
> On 10/23/25 23:47, Marek Vasut wrote:
>> Do not disable reg11 and reg18, disabling these regulators causes
>> the SoC to hang.
>>
>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
>> ---
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Cc: Tom Rini <trini@konsulko.com>
>> Cc: u-boot@dh-electronics.com
>> Cc: u-boot@lists.denx.de
>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>> ---
>>  arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi b/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
>> index 699ba15d6ea..5ca0258e3ff 100644
>> --- a/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
>> +++ b/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
>> @@ -186,6 +186,14 @@
>>  };
>>  #endif
>>  
>> +&reg11 {
>> +	regulator-always-on;
>> +};
>> +
>> +&reg18 {
>> +	regulator-always-on;
>> +};
>> +
>>  &sdmmc1 {
>>  	status = "disabled";
>>  };
> Hi 
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice
Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
