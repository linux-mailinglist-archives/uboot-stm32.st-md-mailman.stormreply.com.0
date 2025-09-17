Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A79B7D019
	for <lists+uboot-stm32@lfdr.de>; Wed, 17 Sep 2025 14:15:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47291C3F93C;
	Wed, 17 Sep 2025 07:26:31 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED072C3F92E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Sep 2025 07:26:29 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H6o8Bn007708;
 Wed, 17 Sep 2025 09:25:59 +0200
Received: from am0pr02cu008.outbound.protection.outlook.com
 (mail-westeuropeazon11013067.outbound.protection.outlook.com [52.101.72.67])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 497fxhj3cw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Sep 2025 09:25:59 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r6A6KC7iAzyKhDOg/0q6zQizQbZhVwsL54ybPlPjF3ZUp5mKupa/MYOpBDKf9TfbPym8rvcCKrnCcpNPRd7APl14m4PVca1RwSymE62oxlsmjUeJ6diJDOjq26qyAzWMxKL5wRQSdvVQVrHJI1TM7ZbkrHEXtcFjzMwWQbXV40F1qsEErk7XXJqc7zcj4Z2+sFSRIPbUoLgueQMWG02lHVa6+MKBFXXGA77VlrY4v1MKHFo2lZCx3ycz/p6gcyHxPlmxEYPKHrPSvMPdDATNEBAzrA7ir59+pq1Wqz9H9JWZIU0lB920QwTArjDght/0feThBdMscbLA6wDvzDLcaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nIS5z1ZKYJ8ETVd/7p4AxL4pANQ6Vg5niTloI/yjsf0=;
 b=cwH1nmhzeIEv5UcmjS/BXMyVTOS2nx8mV0XvDS+3jVvrNP64i8rxyjjBsZ2py/Vm9KwDFLCPWfLuEBfOMyzKsBqYirTNNJ0pjsCBd5qNNaTUhZphbWY6IB4m4a56iadNZadz3PQr8MapIw1VLUvHngDCfpN/ftL1U8i/Of1QR2A9onajqyxTC7J1xZ+VUmkg4rX5XvA5QJLUOH44ipwu//AUMBWJ5uSu2KgrdHZeR/aJ901y66cwig3/rs95LTbrDzcNt3Gejs9tfEF+7l4M6eDeMJLM7LUl68zWX0L92Qtqtxsh/HayxzCaSapGzOcgfaRTY7zDM5SQKcVt3oQ3jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIS5z1ZKYJ8ETVd/7p4AxL4pANQ6Vg5niTloI/yjsf0=;
 b=d2USM3tSh/8fRO35+UrpbXr3prVxAWSXo6eO/G9fVHzgyeTg/HY7lWTZda3OIPoX57wUBTJmB3bPAWRogS4cvxs20dWl3LlKUNoF/8TmVL8wSVFGb7tISY57gjdTemi5XJPb0ngZcpqXhbmOCBKJaLbuMUG424MJdF5Ftg18dXzEtf96bl1l4yyXcZmCXOwDvPcEgr4N4SiNcWn7qmXMSuxz0/8cvoeT7NoecxECguglTDKb1iYYGTOuvEW+MB1UIa7eGGjHmVN8dcSNnNCDermheW5XGRfBAh56Cq9A9Tf5ow0z4YE1xTWc6r1SR5MQXCqeUxv3Og6QT471rhznCw==
Received: from DU7P250CA0027.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::22)
 by GV2PR10MB6113.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:aa::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 17 Sep
 2025 07:25:57 +0000
Received: from DU2PEPF00028D00.eurprd03.prod.outlook.com
 (2603:10a6:10:54f:cafe::5c) by DU7P250CA0027.outlook.office365.com
 (2603:10a6:10:54f::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.21 via Frontend Transport; Wed,
 17 Sep 2025 07:25:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DU2PEPF00028D00.mail.protection.outlook.com (10.167.242.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Wed, 17 Sep 2025 07:25:56 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 17 Sep
 2025 09:18:52 +0200
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 17 Sep
 2025 09:25:55 +0200
Message-ID: <af2ca9fe-dac4-416e-b6eb-bd81fdd70762@foss.st.com>
Date: Wed, 17 Sep 2025 09:25:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20250915004915.222325-1-marek.vasut@mailbox.org>
 <dd90d6d9-4649-4ddf-bd15-db06ff6991cf@foss.st.com>
Content-Language: en-US
In-Reply-To: <dd90d6d9-4649-4ddf-bd15-db06ff6991cf@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D00:EE_|GV2PR10MB6113:EE_
X-MS-Office365-Filtering-Correlation-Id: e74ecbda-46ed-484b-5555-08ddf5bb718c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmgyVmttOC8wVk5YM24yeUR2b2JIVlM4eFFWRG1LRzNabUVJemhyOEpqWUMx?=
 =?utf-8?B?Z0RLYVVueEdtaWpUOXltbHpVckVKeHlxWmcwNWpNZEs0RlhITExDRFhVSWR6?=
 =?utf-8?B?emo2YUg4R3RKUnBHa0pmeXJuUWJNTmdsQkNjRjNpREJOTVQ5OGtWY2wxOVcr?=
 =?utf-8?B?TVFzTGR1RDZUMDhTbUo2REtKdFNzNGE1SXJSYUY2QTl6bitjY2p4QVRSU3d0?=
 =?utf-8?B?cWxaOG9zbHdyZGVMcVlUR1hNVDNWWHBvaVpvc2ZLWDhkdDJyRnF3TktMOFpz?=
 =?utf-8?B?MGRsQm1SaW55M2ZuTFN4RkJob3R4UE5PMnBMcVhqS2R4Mi9KUzgrTDY2VGwv?=
 =?utf-8?B?R0M1d0M2dUZkMUIzZUNOL2dIWld0ZG9namJJaDRKb0w2QUZYRTFwblAyeFpX?=
 =?utf-8?B?OXhoR2JONG5ubThQMmJHeW5NeUdZOW5JMlM5WnZtejBUR0VDM0IxQkdFeDRr?=
 =?utf-8?B?SEpieFlETHBSMzljSW1JVXFRVVVTYTNkZHVrZjJUakxVb1o4K0xuNEoxVjVm?=
 =?utf-8?B?cVpzWDJiQlB6RjRrTVNJNXl1Q1YxRGhvajZuNGdQWXNFNEJXcDBsdlZDTVo0?=
 =?utf-8?B?ejlwRnUzZ0JEaUxDbnFVM0ZNbi9GNnRWTTNBdEt5YnBsUXFUN3BQbndMbGZ2?=
 =?utf-8?B?VWhYNGFCaVhieGJSWmt5Vjh5cCtLMkg5cXNnNHlsZmM2MWdtdExyVzdOTnJD?=
 =?utf-8?B?ZUhVQzJnREpUTzNXU3FxN3kzc1BlZ3ZoMSt6TlgxSXBCVVFlaVFhVEFhblpD?=
 =?utf-8?B?N3NvcWsza1J2Z2oydnREOW44ZEM5OE9sNGJ2UUlyZk9nZ1M1TmxWTmZsc0Uy?=
 =?utf-8?B?bG5MY2ZWQTV6Q0tzV1BhWGlKN0xuc25XYmVVc3B3ejEwbW1BNFY5TVJWNFFH?=
 =?utf-8?B?bHZHZWZ0ZTV2Q1NaWFdrWXNEMDl4VGhRaGZpdmg5c0dZZFd3UmRpYlRuTzI5?=
 =?utf-8?B?UXFISGIxWVdkcUtrUHc3cmpTbnhJVXFaWnhKTjdZTno5eGYwRzFCWDBOU01K?=
 =?utf-8?B?clBJdE9ZaWZGMm5td3JJMkovWTl1YzUxN0FvRGJkbElQTjFpWkYreGdQTGJj?=
 =?utf-8?B?b2pWaTBtWXZHb04rV1UxTVA3dzY5WkJPNjcySWlSYjJDaXl4MTZ3dXNGZzdw?=
 =?utf-8?B?ZUJsdzVRMDBKV2xDNTY4d3J3Ym5kVHRQOCtTQlNuSkZVaHJ5T1lxSTMxVjNI?=
 =?utf-8?B?bjhWcjlIQVFnSHNqZnhMODZYRVU3RFJIVjhtTWJtOVhwbm84Z1FlWWhwRkZi?=
 =?utf-8?B?RStVNXBWVlFGQWZEYXFVUTZBSWRtd1ZHTWwzakRxZkU5MUQrb2padGk3aEdq?=
 =?utf-8?B?RU91cndrWTh6cG1haFVqZjBGZWp5dUlpZ1czUUxOMW54NnRoOUZSOEsyMC9o?=
 =?utf-8?B?REZKQVVqZUlqSW5UUW5HTzhKeTMxNEdud0oxc205UlB5MlhMQndJYjV0MTJi?=
 =?utf-8?B?ZjdaVkwvdUVYRjdzNG1YZHpPOUpsQWZkcktIcGwyVjZKY2s1OUE1NDZ3eUVE?=
 =?utf-8?B?MWtNNTZYbTFPOExnUUNVZ2xFWDlISE9uWjVGT2VwWmZoRGdINVFRY3owMW0z?=
 =?utf-8?B?bDdkSk5aQzRaTHRjZndQQW5SR3ZjM3V2d25kNElqZVkzNlNJTzlBei9UV1lQ?=
 =?utf-8?B?bEJXWFNIbGxKS3BuTlhyWEVuSzg2MHBKVXgwN0lQS214YTBhOVo0YXFaVk9E?=
 =?utf-8?B?SmM3RExmZEVzR3YrdWNkTmJuWWtvYzZXblN2Qnd4dmdVQ24wZFc3TC9Ec2x5?=
 =?utf-8?B?akN5M1lqNTFsS3Uxa1A0bmFhdUh4S3VLOVJ4SFBwQkc5bXNXK2s1c0lxWDIx?=
 =?utf-8?B?TjR4Nzg2blNkWTJ6UFpjTG9wM0dBVW1xaUpGZ21BWWVENlhIT2R4ejAvN1Ns?=
 =?utf-8?B?R3FmWkFid2FpZ3VIMFlEUk1EVitwMUJvU3FuTEVVdElkNVgwamFNaXpwd1Fh?=
 =?utf-8?B?c2xOOWJmRDFKa0ZPSEpqSURtZDV1VmpwNmVHa0RJNHVOSHg2MlZ1TzNQODBw?=
 =?utf-8?B?TmlzT0dqVHNSa29EZThNbFl2RWc2R0JtYnIxS3dwU2dDZVl3VEZCNE0rdVdY?=
 =?utf-8?Q?Pr9oe/?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 07:25:56.8026 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e74ecbda-46ed-484b-5555-08ddf5bb718c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6113
X-Authority-Analysis: v=2.4 cv=K9MiHzWI c=1 sm=1 tr=0 ts=68ca6287 cx=c_pps
 a=bpFRqCMiU58MdEavb/fC9Q==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=SAHXIHsbQyQA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=b3CbU_ItAAAA:8
 a=8b9GpE9nAAAA:8 a=cm27Pg_UAAAA:8 a=k-42gJp3AAAA:8 a=zk4-lHRcAAAA:8
 a=phlkwaE_AAAA:8 a=Fkaf7LEFKc2-f8YNackA:9
 a=QEXdDO2ut3YA:10 a=Rv2g8BkzVjQTVhhssdqe:22 a=T3LWEMljR5ZiDmsYVIUa:22
 a=uCSXFHLys93vLW5PjgO_:22 a=7cv85riZL9-k45RWW8P6:22 a=uKTQOUHymn4LaG7oTSIC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX1QwZCUDdLPA4
 LxBDGxyFPX2zQq0ijpjvA8FU+VGy5So6REx293kXXn59op5bC/1Ytem5WLx9LjdPkgB/ECtaRGs
 s4JGzgjVrlbJQ8r5oKP//l0J/4K+gec85yGmRETtbb7KEerCVzhpOzr86k9SG7cUBWVCTIDlxbn
 yw5VfM6smuF+Qy96Dc0fqZifFTC3GT+YXEesModjIiP7dL/5XRjum3uRUgWL0HOXR34LNQlOrDr
 YP9ZNhVzWZiTDbob98fK1/TUe6L9Lnt9SZiv1fyO29Yq3ozucjs3t83kp9wI+TOrp8kBQtk4H+W
 Tv//VYfeaBOhm1po795wkhrw3bmGrM/WQdXfXrT+yeCpaOd/eP9gJ9Mw+VmHrBvkWOV6GLqY+tA
 HKYxzk2W
X-Proofpoint-ORIG-GUID: W6XvbYUK9FOo6uteUudcQWfm71lDKG0E
X-Proofpoint-GUID: W6XvbYUK9FOo6uteUudcQWfm71lDKG0E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 u-boot@dh-electronics.com, uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Perform node compatible check
 for KS8851 early
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



On 9/16/25 17:35, Patrice CHOTARD wrote:
> 
> 
> On 9/15/25 02:49, Marek Vasut wrote:
>> Check the compatible string of ethernet1 node for KS8851 very early on,
>> before calling uclass_get_device_by_of_path() which might initialize
>> the device and possibly attempt to configure MAC address into device
>> which is not KS8851. Doing the compatibility check early prevent this.
>>
>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
>> ---
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Cc: Simon Glass <sjg@chromium.org>
>> Cc: Tom Rini <trini@konsulko.com>
>> Cc: u-boot@dh-electronics.com
>> Cc: u-boot@lists.denx.de
>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>> ---
>>  board/dhelectronics/dh_stm32mp1/board.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
>> index a15348ad7e7..551094b9489 100644
>> --- a/board/dhelectronics/dh_stm32mp1/board.c
>> +++ b/board/dhelectronics/dh_stm32mp1/board.c
>> @@ -85,6 +85,9 @@ static bool dh_stm32_mac_is_in_ks8851(void)
>>  	if (!ofnode_valid(node))
>>  		return false;
>>  
>> +	if (!ofnode_device_is_compatible(node, "micrel,ks8851-mll"))
>> +		return false;
>> +
>>  	ret = ofnode_get_path(node, path, sizeof(path));
>>  	if (ret)
>>  		return false;
>> @@ -93,9 +96,6 @@ static bool dh_stm32_mac_is_in_ks8851(void)
>>  	if (ret)
>>  		return false;
>>  
>> -	if (!ofnode_device_is_compatible(node, "micrel,ks8851-mll"))
>> -		return false;
>> -
>>  	/*
>>  	 * KS8851 with EEPROM may use custom MAC from EEPROM, read
>>  	 * out the KS8851 CCR register to determine whether EEPROM
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
