Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A24C9F46B
	for <lists+uboot-stm32@lfdr.de>; Wed, 03 Dec 2025 15:23:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CECB6C5C842;
	Wed,  3 Dec 2025 14:23:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49E9FC5A4E4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Dec 2025 14:23:44 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B3EFTwX1956050; Wed, 3 Dec 2025 15:23:21 +0100
Received: from am0pr83cu005.outbound.protection.outlook.com
 (mail-westeuropeazon11010024.outbound.protection.outlook.com [52.101.69.24])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4asrmvxyf9-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 03 Dec 2025 15:23:21 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pMbp5AFbQ85yrZZqRJZoDpL5wQJpzZMErnBSs+b3kJ3tZ/ViydXFEUNVgl2p07QdlOOaIC+4lSjQPI9SAdHfyGky5uMg8AP9zfu/mZYFA+7GO4v3XCo5E13JQrNfWlEJO4NKO1fJM5sVR2Jpz/8aRAtPEu7dzOr+uKmyeL9P4uJUq3XUdryfm4x8DfPIgEgYsAY8qmcPgTnP9yPYPjc5+5KV4GkCLhH8eovO3xiy4vtdHF59V6sj17+RFkz5P+BJLboV6RJfO4JKFe/XNDb7MxVgHY07AAmUJi+Y3rm/1IJBePimy+xNMeMDpPyBdWCiw5sXrX4SCec22vVXd+eZUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ncj/na45jEQq+4B82mvfuIQ4YoCwNufojVUXI/pMQC0=;
 b=bO7oyFx99OneZON6ExpfprxbgzfAn5G+zpJ3mN+mCUN15kanuy6VjFmWWB/HJUUWyG09gQXq8NHdVmiXyt0w6/1eZqYn6RD+80Ztl7mp3X9YttyOScOZRopU/5nlooZZLfbys6chfoq9qYWC1HolCk3tEYwrlXm9z6Uiu/S2Y1J+BJCBMpWCcWXztsjUsCpBv+oaC6yzilPMxQVsreziHgpi66+QAJ0uQWRpfuJw1IkWhb72NWuEe0moSy6GWaAqY27bqavoL3i0RJiRr4l8MozPGBpnpsdE/i0Hj6aE0YR6/Ho/ONbeXUChhfZG5REivt9sIGPoX0NMgKeCvEDWlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ncj/na45jEQq+4B82mvfuIQ4YoCwNufojVUXI/pMQC0=;
 b=CnnJKCu8UDITGWM7a3emlpGXqC86jArQ8ynkJIPbpIVlAwGWIIm5Wc0PryGTqA7s7z6qFqt/7usujd2UclmhHNTzxfmvHDGTyuECY9i0ZzhlT/Y3GdTzb+nuvM8IDTTz7LrT8zWC5EYRfg+Eb95nM0Y5k3XKFY6uVHrYadmrdbqesfpWA0VqJ4iM8Uj7gooS5qgZisJXoZa0mmJxwNw7FRilUp4C2+x9LA5ul61LHhRCH93HilNYhNVaODmVIE0ac/X8oRQxLYLg0mO4gwV+XIrDyNwhz54AnVbXRQw9PUTZsAyszGaYeCo2A2r4iRaboSyWBjSbVPBGNSD5JbVqvQ==
Received: from AM0PR03CA0028.eurprd03.prod.outlook.com (2603:10a6:208:14::41)
 by AS8PR10MB7561.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:564::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 14:23:17 +0000
Received: from AM4PEPF00027A6C.eurprd04.prod.outlook.com
 (2603:10a6:208:14:cafe::21) by AM0PR03CA0028.outlook.office365.com
 (2603:10a6:208:14::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Wed,
 3 Dec 2025 14:23:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM4PEPF00027A6C.mail.protection.outlook.com (10.167.16.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Wed, 3 Dec 2025 14:23:17 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 3 Dec
 2025 15:23:54 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 3 Dec
 2025 15:23:17 +0100
Message-ID: <a176c021-f748-48f0-aa4c-572dd275ac88@foss.st.com>
Date: Wed, 3 Dec 2025 15:23:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20251118231732.577952-1-marek.vasut@mailbox.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20251118231732.577952-1-marek.vasut@mailbox.org>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A6C:EE_|AS8PR10MB7561:EE_
X-MS-Office365-Filtering-Correlation-Id: a63fed9a-18ca-405f-4fbf-08de327780e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NjREYTV0ZTd6YlBZczhBNGhtSno5Wm1FdXpDdHhWU1FjUmkzZmltQUx2T0tY?=
 =?utf-8?B?OS9TY3c3dXpyT2sybjZZN1dISWR0VzhPZmdHcGNZN2dlZlBPWUpZR3ZtNUQy?=
 =?utf-8?B?UGpRblFybkZ0T2JEK3NWdzl4dThYekJ6L05DQ1lTQ0Via2YrOCtCUlc5OWJh?=
 =?utf-8?B?MER2VXMwUVNxbGNVQm0zd0xmQWptTUl6ZHpObm5nUXhndTBWTWlabHN3MXl2?=
 =?utf-8?B?Z29nRFh6YmVSYXRKZW4wS1YzYlp6dDJPVGVWY3JlbVdncDBIM21MVXlhcmp1?=
 =?utf-8?B?SFUySnNzS1VOU3pGZ1hCVDV4WERtUE12Y2NlcldPNU5reW9la3dCRDBnYWts?=
 =?utf-8?B?UkFXQ2cwUHI1ZGF4QnhyNUZYYUk4VTdYS2V4eitOVjVKbmYzV1dxYWFwVEQv?=
 =?utf-8?B?eFRPVVgyRFpuT3FmeXJUTy9XY25iZVpnU3l4cWdLK2oyYUFPbGY4N3RTOVFB?=
 =?utf-8?B?dFVIc2hzR1J3RXhOYngrWUkwSnZFb1BDcXhuUEtiQ0JwTjdxTHdlL2hpTzVl?=
 =?utf-8?B?Wk94MjhLWTNoSnhCcXh6UGpXYjRSc0xxQVpvbGVMT1hiSGtqRjkvWTJhdmk4?=
 =?utf-8?B?VUp0ZmpjckU3VkVaYUcrb3lZc3ZpYm5wL0c2czRITGQ1Z0p1cUZ0WkR2QnVG?=
 =?utf-8?B?WnJpcHhLTWlMMlJnMkpMNjljaWRjbkRzTGtCc3VaOTNRS1VENFFJR29IcHBk?=
 =?utf-8?B?eVowYUdKcnVWV1ZMaE1uOG9Lc08rSFZ1U0l2UjUzRmtDbkhwUnlDWU5RZUk0?=
 =?utf-8?B?clpjYm9kem1EZHk3b1RJVW9UajAyU2lmTFZ0cEtaWEttV1QvdFV1L2FqRXhi?=
 =?utf-8?B?UkxOQ1JZZFprb2lkWG9yZk0vSHU0Vy9kUkhiOUdaY2lvZWdWRlFlL005T2FN?=
 =?utf-8?B?YmpkNFZrWXIrbkJ5cWRQUUFoVzRYRk5GZDRROG1qbldOQUliVVNzSFp5a3NK?=
 =?utf-8?B?MWRwYUs3Y0ZCMjZ2SlNIRG1OZksyYU84TkUwUTNUYkNDT3VrNHp3WFVOUG92?=
 =?utf-8?B?SWtLZlJJWFE4eGRyVXNWRW5jVjY1aGFPR0hrU3Vnem1SZk5NWGJvTm14RXU2?=
 =?utf-8?B?L3N5V2tHdFpncS9XdnBWeHdMamV5VzRQVVpPQWkrZzgweWZva3ZuUm00a29F?=
 =?utf-8?B?S3NWMWtrVWEvMzVSdjExa0U0clQwMWxxMlUyT0RyQWxhUlNqQXk0R0IybTM3?=
 =?utf-8?B?WUdncklIMFMyK3NmUzg0WXlMS0p3Zk5qQjBMNytyUTBBUEZlckRjdUdlVGg4?=
 =?utf-8?B?Qyt6TDlpVnl4d0VsY0VQQ0VqWFhPNWpjUm91d1pHQjBPOGtOcVQrYkhGK0NS?=
 =?utf-8?B?THpPUnZvN3NNQUcyMFJHbkEyYzlkRHNnWDBzNkhCYWZjYzFRMXgzZ0VKeFdS?=
 =?utf-8?B?dFB3d0xQZFpTa1l3ampkeWo0bkdrbW85Vk5HamwreUxTK1FzU20rM2hjd1pw?=
 =?utf-8?B?TVFVekFLQ3dNYVNEMnBVWkNPRzBuR2JRblV3M1dzMGNxc1psU1RRSWQweVRY?=
 =?utf-8?B?WndnWCtqZVJRVXQ2aDc4SlV2eWc4M0pPOXBNOEltRWgzYWhOZmEyZXhPTEFo?=
 =?utf-8?B?WWFXN0NXVGhhemh2QkxIOFZwVTV5UDBjVmt5b1V2cWZvbXhlM25ZK1NjeHIx?=
 =?utf-8?B?dnJSRStobk5sdjZVcThFOUVMd3RvU0w1VXBkK0szT0pXdnVCbEFsUVc4MmJh?=
 =?utf-8?B?TXdNODFvalJhRi9iejlaM3lSY2l2VUFjNXgzb2VoM3QrR0M3WSttUXNCQ3FR?=
 =?utf-8?B?QW5Wa2I4TW9zaExRU1FINGl5YU5WNDF2TGIwaUYyVnF4M0R5bDJpRWpNWEU4?=
 =?utf-8?B?VU40bGNyMUJwTHFjUktIcEJHbmttbmtYdlRuNEgyRFBZNmIwbTFQbStuYmRs?=
 =?utf-8?B?T0RCcjlrWXE5clRNMmpSdTIwQUdQanVDVTRCWGQySTFVanB0THhIMFJwaHdW?=
 =?utf-8?B?NFJNMjBhYjJkUmZPamI5NU8yWXZDQUFtMUpFcWhpbEV4bVJaamtNZkV1ZlJO?=
 =?utf-8?B?ZllKanQrd2xYUE9HUVZ3elVVK2hNWHBobVhpalFOZnJGWXZKcFFGUEc0NDVK?=
 =?utf-8?B?NjErWnNRODgzNHV3RFBKeWJ4NEJ6ekZjZkVrbEowK2YxWlAvN1hBSTZRNVhx?=
 =?utf-8?Q?Mt70=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 14:23:17.7615 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a63fed9a-18ca-405f-4fbf-08de327780e8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7561
X-Authority-Analysis: v=2.4 cv=e8YLiKp/ c=1 sm=1 tr=0 ts=693047d9 cx=c_pps
 a=7RlnNBo2KbPEBnadbvKlxA==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=b3CbU_ItAAAA:8 a=8b9GpE9nAAAA:8 a=k-42gJp3AAAA:8
 a=zk4-lHRcAAAA:8 a=phlkwaE_AAAA:8 a=y6UQqwI0tp90Hr7NFGgA:9 a=QEXdDO2ut3YA:10
 a=Rv2g8BkzVjQTVhhssdqe:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=uCSXFHLys93vLW5PjgO_:22
 a=7cv85riZL9-k45RWW8P6:22 a=uKTQOUHymn4LaG7oTSIC:22
X-Proofpoint-ORIG-GUID: SM6RdW-HJNaRmmrmOu1fddqkr9oFTkaO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDExMiBTYWx0ZWRfX141VY3ixjchE
 i/yWSM/Mh8PPWhtmTGQsuqW5Eiejnebm5oM1q3r3kqy/u9yMtV6rc8FeWliyKdlYKRuHvwGWs9u
 qrvVF+MBRbxUIxK9rskmmPIu/csi6lE5nnSrZnW+4EJdL6PGOdBlvDi1JHyaKilzIp1YAv8/+HU
 rapb828Rp5lKoHRw3Hp7gCb0wkaS2jSfuENc5hs3rX3mYZ8wif0/+gD/e9DboDdid8nz/oy5Oh0
 gHW8j9loXJ4lcw599PFq4itbd1/gpEufFuoY6MWf8hmAoPJIhpFG1WQA0yDlUWNHG1JN6ia9jcc
 WZsZk9Tft0bmmSlTJ7iifpiPpHiKeNoQx6gSlBuBQAN4JyX9le9ikFMpW/cSm4UWWsXZ3bhnkEb
 D5jPNlVDGptY7K/uLgS02xA+vbXb8w==
X-Proofpoint-GUID: SM6RdW-HJNaRmmrmOu1fddqkr9oFTkaO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030112
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Add missing build of debug
 UART init code on DH STM32MP1 DHSOM
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



On 11/19/25 00:17, Marek Vasut wrote:
> Commit c37a6684818d ("stm32mp: fix compilation issue with DEBUG_UART")
> split the debug UART initialization code into two files, but failed to
> update other non-ST boards. This did not lead to noticeable breakage
> until debug UART is enabled, which is not the default. Update the
> Makefile accordingly to allow debug UART to work.
> 
> Fixes: c37a6684818d ("stm32mp: fix compilation issue with DEBUG_UART")
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@dh-electronics.com
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  board/dhelectronics/dh_stm32mp1/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/board/dhelectronics/dh_stm32mp1/Makefile b/board/dhelectronics/dh_stm32mp1/Makefile
> index 2f4a301d1a0..429e01453bb 100644
> --- a/board/dhelectronics/dh_stm32mp1/Makefile
> +++ b/board/dhelectronics/dh_stm32mp1/Makefile
> @@ -3,6 +3,8 @@
>  # Copyright (C) 2018, STMicroelectronics - All Rights Reserved
>  #
>  
> +obj-$(CONFIG_DEBUG_UART_BOARD_INIT) += ../../st/stm32mp1/debug_uart.o
> +
>  obj-$(CONFIG_PMIC_STPMIC1) += ../../st/common/stpmic1.o
>  obj-y += board.o
>  


Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
