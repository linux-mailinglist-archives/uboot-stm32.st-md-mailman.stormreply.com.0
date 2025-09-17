Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE02B7D015
	for <lists+uboot-stm32@lfdr.de>; Wed, 17 Sep 2025 14:15:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78625C3F954;
	Wed, 17 Sep 2025 07:27:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 459A5C3F92E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Sep 2025 07:27:25 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H7JKJB029007;
 Wed, 17 Sep 2025 09:27:04 +0200
Received: from db3pr0202cu003.outbound.protection.outlook.com
 (mail-northeuropeazon11010061.outbound.protection.outlook.com [52.101.84.61])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 497fxgt5b1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Sep 2025 09:27:04 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oedSVKmkIK7FEVN172fn82NFNqN6bFiZKEML/Ughp+J8imstuZBQVsSQfUYZFoHmq/Ka8/jDexTbnlPOYvaaR3arYj07Ts4jbD7zwPL0FUQHwRMNY+iKmlXoS6/VVDVz5AhEGLHGRDE1JPJYBAqwu1AHnHjSGWjW1PJE1WDpAkDD/3v6TCC1eoll2Gz/7NxHNMDH+uXJ7M3z2sdCJFA7VJALnCgHxH1imqHGtyEUZTxDxYEKL/vWoWmlzhQ8ceg8DAfw+TDJdL+DkwxCign+2PRTTpbT88tnLdqCpYfHDSCMuiX5uwrGZbnGMuJmgFRR9Gcyyn1RhidTDVLv3N467A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQhMjYhAN9diEJQ/b3zCq5JIxBBYgHWAWsFOBqYJQyw=;
 b=JH7qsP6cjHGwJUOW0CsvJk5oBR7iehKTphuTx93fz0+48LbXFvz7yKObSllQcdvFUaClD2RXYaz5J9LTHUTietCatoQbX7SCVtwdObaJkrhQUcEfUgdAPJihexhkiIUHagyAa4esL6iOL1BF9n2YbaO/luXsCwmgR0g8MIFMTxtrpbNP7mUOtp2o6BydvT2Yj2CY/1b0vPnwzAOLwF72RXZ3Vyi2/5yA0TOQJYvYavPgN2l8O9Ejr03CJ13zdABGIEsKgJFZMmtC94pkJCSSgL+7OGPc4DLJlmnOtPSqmZqd78095LhZWTOhf9DGFYyxGbpOvSl7QpbxnCfFtXE7fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQhMjYhAN9diEJQ/b3zCq5JIxBBYgHWAWsFOBqYJQyw=;
 b=jNkNr2mKLU+172g4Cu0bmBC/KIYrDF9G5B4yZI4y+z0oSqo1kI58PsSRVzy42HIOJD/UMDiYJ2bcmvdmiYWNuMqJPRM2QOqV5SPv2B7rp57aYxG+H2iYv/wOvG3jRHk37p4OJt0k38DVb2i3K4Nc2lUtgj8f/1q8z1mYX3b9+79+zm43YDVCKGW4ACPWfgEdEUsiUI7hLJD19pXFxA+QpLn+5GXdfMQHAyqoC0FliaNCI6VhH3zqZUAw2AULr2FZL13Uaptyntp4ViNEfc+Ekz5VqTBtqS9BKiNySFDWv1s0FIjW8CG8D4ATj7UuN97BnumE1bFl0whfxHCrrkHZZw==
Received: from DU7PR01CA0002.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::24) by AS2PR10MB6544.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:55f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Wed, 17 Sep
 2025 07:27:00 +0000
Received: from DU2PEPF00028D03.eurprd03.prod.outlook.com
 (2603:10a6:10:50f:cafe::ae) by DU7PR01CA0002.outlook.office365.com
 (2603:10a6:10:50f::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.13 via Frontend Transport; Wed,
 17 Sep 2025 07:27:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DU2PEPF00028D03.mail.protection.outlook.com (10.167.242.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Wed, 17 Sep 2025 07:26:57 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 17 Sep
 2025 09:19:53 +0200
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 17 Sep
 2025 09:26:56 +0200
Message-ID: <4875df2a-fcd4-4576-8564-37bb3dad4eae@foss.st.com>
Date: Wed, 17 Sep 2025 09:26:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20250906230016.582577-1-marek.vasut@mailbox.org>
 <fc2696fa-04bb-494c-8c48-7cf7eb09d70c@foss.st.com>
Content-Language: en-US
In-Reply-To: <fc2696fa-04bb-494c-8c48-7cf7eb09d70c@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D03:EE_|AS2PR10MB6544:EE_
X-MS-Office365-Filtering-Correlation-Id: ee55103c-6f48-4232-6d74-08ddf5bb95e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1ZCMUZCdDZ0a3BaN1dubWl0NmF4NzhTaEg5bWpuSXVjYm1HMFJraHJydGJu?=
 =?utf-8?B?UWdIazROdFRVRjNUMkdueVYxQmZyUzJvamloZkwxaDZ2ZzN5QzZUMmRESkpn?=
 =?utf-8?B?bDdISWxkN0h3cUlIcnR4Vkxvc0FYU1lta0VqU21iQWt1QitUNTAwVGZHbmxC?=
 =?utf-8?B?cGhGMXJXdVlqWEliOGpHODNnc3VLQUdGZjNCNVl0cUhsazQxb1d0dllkcC84?=
 =?utf-8?B?SGVsSDlRbHRMb1hQdkYrUjF5TFpzN2RYYlRqNWdWZnFFZlExaU92a3FYY1hF?=
 =?utf-8?B?TEJPdVdvMG5zOWdSR1dYN0w2eXJ2RyttcHBENXBoaTJYdERZU2haQXkwZHVp?=
 =?utf-8?B?S2djaEdSV2JZSHQ2cGQ2TWJ0aTdBMzZOSUdjRHdJVlV0NlJURkRTWEhacVIw?=
 =?utf-8?B?OUxwa3F6OXB0S2tTMTZGMWNHS3VXTWQ4Nk8reGhZMVA1VHZvQVRQcWJhRHA3?=
 =?utf-8?B?MmpIWDlPS1JQY0RMM014U2xYZGlrYThsTHpRaU1RdWlkdXdwaytCMUMzYWVD?=
 =?utf-8?B?QkxYUW9xZk1GNSt6MlUreU5MekJ2TnA3Z2tuQnFPQW1ONmhKbC9vczdKdmov?=
 =?utf-8?B?RFpxTW13WjBwTDNqRkZEbk5iaHpDRmorVnB1ZWRwWXJYTndIQmROWUVZdXJn?=
 =?utf-8?B?S3Vmbk53aDQxREM1VG5BMC9FckhMRElHZG9iYUdkUmNJN2Z6dTMzZDRjTndh?=
 =?utf-8?B?YlFpWURMY0tLR3ZSMkhkbkJIM1JMK01DSFZKSTBWSmhSZ3UrdkNTcU5Rek1E?=
 =?utf-8?B?d2VOY0VyTzdNM05weWNCTk9qMFhxZFdzQWJ6NDhwMCtFSmY1cWdkdjRRWlZt?=
 =?utf-8?B?bURPMXF0b0xOZDROYjM3UmdGT1hlcHVHR2VjS05vZjVobDFzRTY2cDdCT25Z?=
 =?utf-8?B?d0hxbjlNZG9SSEtMNjR0eitPYy9FNm8zdFMvVm9COE5lcUMyVWc5QzNxcVFO?=
 =?utf-8?B?Q1pibUlxZFk1UEwvdnhYUHVUNzV2SHQ5M05KTHphbURncXp2RllUakw1QlBO?=
 =?utf-8?B?MzNVaVR0dHZIdUhETFhhK1NkZFpZVUlyYThoL3MyYm5zRHB6UmhiNmE3dG0v?=
 =?utf-8?B?VzVDRkZKYm1LTXlDVyt5aWtkaUJGaU1vOGJJMXdNYzZkNUlmU1NBN2tBcTQ5?=
 =?utf-8?B?T3RncTVZRCtiTU5BOXpxWmM2LzV3U0lsOHpuZ1c2VmdoOHF4c1ZGMGpnZ0Rv?=
 =?utf-8?B?NHFkZnc1S0ltRjB6dkdvdG9VdXdXWXhKTVZZeWRnK0xzU3NLSGJ5UmxWTlhP?=
 =?utf-8?B?UnVPWDB1VEJ5SGJ5TUJkcmZ3QWZOTDBNRzkxNlZYMjUvV0dERVV1bG42Zm4v?=
 =?utf-8?B?c0VtN2VZVU5ZQVUvcFBYRzVHWkpqUzBlcmZ1dEEwdUUrMHdPbnBSamtHRHp5?=
 =?utf-8?B?Unh5emF1YXZOcFhUTFFUZUJOUnJXeXliQXNudE5UdzhRMEZSSk5uZkxEYVg5?=
 =?utf-8?B?YXNBRkluOVVCOUd1cW5PTHlrRGxyV1l4U1hmQVFOR1dYMTY4YXFYUXMraExS?=
 =?utf-8?B?dmJHc0liWG9Fa2hwL1A0ZnZuMFd4NHdZRDY0OG1VTk5IZHN6WW44SHUwS1NE?=
 =?utf-8?B?bUVYVDI0SUIxUVBDM1dsYk5ZMUdKZGZMbWtDQnNUOEpZQ21WRjFPNEtkRGM5?=
 =?utf-8?B?SnVYZDVBVm9sdjFaVXR6b2xtLy80RENKTGZkTm5BOUVsajNHQnhMZFdCWEJi?=
 =?utf-8?B?c2dwZXgwTEhjd0dTSWxiMXdxQjBEREtTVFFoRnVCM1lUTnJsdFJFMW1Vcndj?=
 =?utf-8?B?NG9CUkl6UUFzRzUxTFBXbHp1NHp2Yk1BTTNkRmJVbHBvWmE4Q2ROQzlKNHlF?=
 =?utf-8?B?S0RRWEhKTisybnRGOEoyUlhWVmpuampHK2IvRExPUmJnUGt0dUlpOXBLbzhE?=
 =?utf-8?B?U2sydzJPVTd0MEl2cFJ1VUJWRXl4cUEyV3YyQk9PaklCek0xU0NHTmdvYnBR?=
 =?utf-8?B?NVBlaUhXYmhpU3lleTB2d3lNTWFNWWpDMVdVQ1ZGNWFPalpwdUR6OG1EZjYx?=
 =?utf-8?B?RnBSTlBDRkkydy9GcXZrQlFKRFIwWVdzcFRHUURibExQT3hOa3doS1ZRaTVC?=
 =?utf-8?Q?n0AaTh?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 07:26:57.8003 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee55103c-6f48-4232-6d74-08ddf5bb95e4
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D03.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6544
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXxaVtOlG8fIs4
 ZkmI3je4c83teY/1O1RizQUZYybX7M6/1Y3vDaZbKJnWYEa7c3VVuSMI/7DEPUeUFTVdIs7ihyb
 pZcNH/jWmFNSRyDaAB4ESSVP9uvfnxoWVtgXNVLeHfCX3Ov+0J+gWxIf1RP2Q0o+5D9/EhC3cg9
 q64j7E+Nyt5I4SyHYKXlYPGwxb4EqgfmGe/V+GD5wOxMnWNx990WNUYMy81+lt04neflNA67Swp
 X8nqqxjTqWxfUTKkcvI5VenoSScFEmQoTDHxKp7xNyo3T29mVSlWKFmRW+WoAsdWTKucLFc78FH
 P1DUGZD2VAu9jMB773xiqTD8n/GvEGwWeRcEQD/GRYVZTwmlexvwH9uSSG0uRdwbPhjRevVD2a5
 w8zHDZZK
X-Proofpoint-ORIG-GUID: CNQWf6RxNxCjBP6Y7g31UUjhMgslm_JL
X-Authority-Analysis: v=2.4 cv=aJLwqa9m c=1 sm=1 tr=0 ts=68ca62c8 cx=c_pps
 a=rEC1nn3bwXFCJLmtaBoKug==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=SAHXIHsbQyQA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=b3CbU_ItAAAA:8
 a=8b9GpE9nAAAA:8 a=pGLkceISAAAA:8 a=k-42gJp3AAAA:8 a=phlkwaE_AAAA:8
 a=BOHfuW98QBvT7g6DQ8QA:9 a=QEXdDO2ut3YA:10
 a=Rv2g8BkzVjQTVhhssdqe:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=uCSXFHLys93vLW5PjgO_:22
 a=uKTQOUHymn4LaG7oTSIC:22
X-Proofpoint-GUID: CNQWf6RxNxCjBP6Y7g31UUjhMgslm_JL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] clk: stm32: Pass udevice pointer to
 clk_register_composite()
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



On 9/8/25 09:02, Patrice CHOTARD wrote:
> 
> 
> On 9/7/25 01:00, Marek Vasut wrote:
>> The clk_register_composite() does clk_resolve_parent_clk() look up,
>> which requires valid udevice pointer. Do not pass NULL, pass a valid
>> device pointer to prevent hang on registering ck_usbo_48m clock on
>> STM32MP13xx.
>>
>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
>> ---
>> Cc: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Cc: Sean Anderson <seanga2@gmail.com>
>> Cc: Tom Rini <trini@konsulko.com>
>> Cc: u-boot@lists.denx.de
>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>> ---
>>  drivers/clk/stm32/clk-stm32-core.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/stm32/clk-stm32-core.c b/drivers/clk/stm32/clk-stm32-core.c
>> index a0ae89d0912..858f122db1a 100644
>> --- a/drivers/clk/stm32/clk-stm32-core.c
>> +++ b/drivers/clk/stm32/clk-stm32-core.c
>> @@ -309,7 +309,7 @@ clk_stm32_register_composite(struct udevice *dev,
>>  		gate_ops = &clk_stm32_gate_ops;
>>  	}
>>  
>> -	clk = clk_register_composite(NULL, cfg->name,
>> +	clk = clk_register_composite(dev, cfg->name,
>>  				     parent_names, num_parents,
>>  				     mux_clk, mux_ops,
>>  				     div_clk, div_ops,
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
