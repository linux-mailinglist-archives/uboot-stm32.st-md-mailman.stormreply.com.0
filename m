Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 684FACB6616
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 Dec 2025 16:52:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1984BC7A830;
	Thu, 11 Dec 2025 15:52:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B96FBC01E77
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Dec 2025 15:52:46 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BBFq3b1939627; Thu, 11 Dec 2025 16:52:18 +0100
Received: from osppr02cu001.outbound.protection.outlook.com
 (mail-norwayeastazon11013004.outbound.protection.outlook.com [40.107.159.4])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4ayua5sj9c-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 11 Dec 2025 16:52:18 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t24+S8ZPHeAoD1fQh8TLZe+0r6kUBTGm0jx9ktNXtbksMlEBq2Rx3TNZ8JiG3jpQX1zNiBlaMlhm+NajClVr7vxCgkvPgYMtPKs5g37IxzyWa/WFvQFc0Mta2dBGnInXVLNXR9BiQoN0r0Fpc/d9TN98YNPsVJO/9BUWY4javwgQ2D+HIlCERkN22Tj4XhNhe/zLB/0R8+qTlIvzTyXgGLiuH7ubBWmG1vV7t1/dDfYUyU1GUHU2UKluyHbPhxRjKBl+6931/e0bfNvImkubDmlzs0NiBisuh6qc7hJ1k36dajcVGRoovYd8/vsPgeZpPVehmtADI8mYKYcZBT1HXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5faYLNOwuLj52joBsvhk5FoVhh+yQr8ymqeyBiJGkQc=;
 b=AHtie+OF6kL3WQYWb9Tgrjk3PG2Z+Yv5uMS9D7+wzs9nDB8VPRItMQxRqyYuHVfB8RmTMWI14pUuEhBCnj8EGq+wyYfXlv07UhEAdH9pQX3/E21O1doJM/V/5QbyERj9eVOAUuAhmS6CGdb3rD/A98hSy4M/h/uBILsj4Gr8bEbpz3yipttfeeHkgsV5Vu3aadTmez3RXewloS/m4rqJIU8D/TvZh5+AZMD250BM/Mg7ggx5VZDRTWLEHRjUrOiLo9bhjrIqs+vWZezMbkEMsQ0At5JXk1bNQ5NqySDYrrw9SlfWyINFAeuaISd1EKwT609jx3t2ZD+HQMkVjXlyag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5faYLNOwuLj52joBsvhk5FoVhh+yQr8ymqeyBiJGkQc=;
 b=kzdsLg8ob7avHb6xyznUKLB14tIJ9/7lqlxD8XTvnnns1wchEiIpfBzPVskNwnC1sNfdPBTXLyCliIQCLrvi90R10vcNBMiMrt74DT+C4xhDjFsPaIFME2sJk+CWfl/q0hcNV/KdVH1HeNnfZBt3XrDhBRpwMo1EzGpbPL07vy0NyjzbxpcSWS3IByuSY7HAN+ji0cytlBH4dn20oyuoFkupDNODRIfJzXmvS0GFDkGxwonX/IxBEkeOfTJ74yLVZFJ7IXD+99M+Jt+ay3lCuiEKNNz4Y2dkTLr8kzHwtXjKEXNPB34TPii81ymlqx8kECQd9XSYLCnv7nbeJ5wJKA==
Received: from DU7PR01CA0027.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::14) by GV1PR10MB8535.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:1d3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 15:52:14 +0000
Received: from DU6PEPF00009524.eurprd02.prod.outlook.com
 (2603:10a6:10:50e:cafe::31) by DU7PR01CA0027.outlook.office365.com
 (2603:10a6:10:50e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.9 via Frontend Transport; Thu,
 11 Dec 2025 15:52:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF00009524.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Thu, 11 Dec 2025 15:52:14 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Dec
 2025 16:52:55 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Dec
 2025 16:52:11 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 11 Dec 2025 16:52:06 +0100
Message-ID: <20251211-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v2-0-44e6e7de2beb@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKboOmkC/zWN0QqDMAxFf0XyvIJNW2T7lTGKm+mWB40kRQTx3
 1cGezuHA/ceYKRMBrfuAKWNjWVpgpcOXp9xeZPjqTlgj8mj907Jqijlp0jNRTRbnQPOqw9/wtT
 iqJPlDR0N8TqU1IfoI7TRVanw/ju8P87zC3A/5gSAAAAA
X-Change-ID: 20251211-restore_boot_for_stm32mp13_stm32mp25_boards_v2-e7497f503414
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>, "Peng
 Fan" <peng.fan@nxp.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009524:EE_|GV1PR10MB8535:EE_
X-MS-Office365-Filtering-Correlation-Id: 542668a7-a1bd-4cd5-7944-08de38cd4105
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QnZuNGFTTXJOcjg5U3RraHViUElIVFJSellQUVB0RTRjbU5NMkFJQ29kYVJ6?=
 =?utf-8?B?T0Jad1NldWhSK1ZyUDRHTUFJazJyKytaMXhxbllCNmxSZ2twMHY5Rm9HVk5u?=
 =?utf-8?B?WWc3OFJ4bEZIQWV4aG9zVHEvSGZKWmxDZVpNREpEbE5HVCtKdDB6dkd1VFpO?=
 =?utf-8?B?dDQ1WllNaGdDalU5b3pFSC9WOFcxUzlqRmdSa1NFbmJNc1hxL2VuSTExTXFF?=
 =?utf-8?B?NDMxS3I1alhVaXhZeXE0bWQwdWxPOGVjVWNjR2ltdXY0eXJQajFDVUNmMUw5?=
 =?utf-8?B?aWJBZmRHT093TFlMSTlFNW9VMHVRanhYR2daQmtZOThZQnkyZG0xWWFyN2lJ?=
 =?utf-8?B?ZVpaeS9WeElWR1NObFlBMnl4T2UvWm1UbEh1WFpwdUhyampyNWVsZGd6L05K?=
 =?utf-8?B?Z3ZDSmh2OHY2djAxMHZhbVFYZ3ZkcXlRVm1TcGE5YWp5ODl3SWphSmJicG9h?=
 =?utf-8?B?NDVvczRyVkEremxvR3hCekVZWnk1ejV4MTVWaTlpQnZPQk1NVVNRdUt1andM?=
 =?utf-8?B?TFJzYXVxQkt4U25zbjJ6dlFFcHp5bTBiYWxDM3dEaVZPK28zNWxCbnVYa1dB?=
 =?utf-8?B?UmdNT1hTOXJFSS96Zk9kSjB6S3VuUU1GeS9oTUpuYmZuZktENXh5akJZWFZO?=
 =?utf-8?B?R2E5QzluRitWcEdCQkdMTlMvczRZK3FBVHIyaXROQ04vRDA4UXIrUnhnTkx4?=
 =?utf-8?B?d003TzdLNFlkRnJzekpWZlhWTVl1elUvdVZZa3EwWTB5NGtFU3FIeThoNEFR?=
 =?utf-8?B?Y0hpcUk0M00wdzVQcm9TQWNWcG54dXNRM1NCdzNneksxbmVBVTVqWnJ3ZXpn?=
 =?utf-8?B?MWcwRDVrZ3p2VDJuQStWQUlZUmJsdkw5QkJ0bnh2bHVJMFJpWWtuaU4xSEk0?=
 =?utf-8?B?MWwrK1gyU3hnV1U2N0lqU3BKcXJLd0tmcUs2bjI5QjBJZG5KVXp1b3ZjbXRz?=
 =?utf-8?B?OFZjYzZtMXpJRlZuRDdwT3R6UU1ZWlJDRUZxU3hFbEtjc1R6UVdXZ29ReWxJ?=
 =?utf-8?B?VGFQVEtOdU9USkpadTg2OHdwSU5FU1Vwekc2eGE4RmtEeHdyUThtUzh5SWFx?=
 =?utf-8?B?bkxRNTBWOTJBTXVTVXRxNXU3MnZaRDQzdHptUjVEcjdKeGVEeHhWdVArVi9v?=
 =?utf-8?B?QXRlUWdySE9HSEhXOHl6bHFwbmlOUkVMV1NKekxESUZmcHExS0M5Ujdza1FM?=
 =?utf-8?B?QzJrSUZLc25QS0EzRUZCaTJTQzJ5dmpoWHE5em5TM0twb2pmTXNDWHlVMWow?=
 =?utf-8?B?UG5BTHZOOGk2OXY2QU1DdDIwM1VUUVBOQnpZQlUvWkRMakx4bFJqL2pHZHhG?=
 =?utf-8?B?UEllVVhCQSsxdDQrSUhUeUJ6STJYSkUyQnFLTXJudlJEWkZweFduWkNVZldt?=
 =?utf-8?B?YUNjUHlMMmcxamJlL0laL295WjB2elRjeHFZWjlvY2xmMjFlbmhaa0hIMWU4?=
 =?utf-8?B?SW1Bck5RUUV1aG5VRE9IVzl1TkJLN1liUmVRTERWbWVSWFlOY0xaaTBoRHdu?=
 =?utf-8?B?TXNsbGVhdE9XVjFEM3lWT2VaRXEwdVJZa2djalZSNGhvYmJyY3FtbzRNOHRx?=
 =?utf-8?B?UEdQeHUyaDBadWFyRTdnWkRMVjBwWjhPcHcxVTRUU0trTHdCTnJ6eHZxUVlZ?=
 =?utf-8?B?eWE4a1V3RnUxZTVPTG0zRVR5eEhRdTdYVlhZSmlaWnFJTUZuYmFSdjFReFVY?=
 =?utf-8?B?TEhMaFhyc2JmTWdPN21BMCs0eXlDZzBueUZlYW5jU0tkZXlvZU5oWEdsZm53?=
 =?utf-8?B?NzNydTRwSGM0LzFmT29HcFoxeUJwdnVMODd0VmxyZ1RCb2FDQ1lBMFNvV2pn?=
 =?utf-8?B?YjRiemxYbE83dFU4ekVqOTkrUGlFd1ZvM0loU3lKamVTR3djeGxIVkJEWlda?=
 =?utf-8?B?bysxQWtzOCsyQk9zQkpTZ3FubzcvUFBzRjE5RXo3a3A4cHNKTmJJQWYzVTRU?=
 =?utf-8?B?cGw4cjZQSU45OGl1NE0wT2VsN3ljK1cwZlhKY1dNY0NPVWlmeG9tV0dRV1N3?=
 =?utf-8?B?V21hNmlSYUhabUNyd2JOaTBDWFVoTFhvQ0RKMnNOaERwQ3gwWG5ZbEFKajdJ?=
 =?utf-8?B?bDlBWU9NZ2FmV2YyK29ENUZzZ08vRHl3Nk1iN1dRZjQxejgxMldPL0ExTlZD?=
 =?utf-8?Q?Hvqs=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 15:52:14.2349 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 542668a7-a1bd-4cd5-7944-08de38cd4105
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8535
X-Proofpoint-ORIG-GUID: 0oUyqIYn2YbVrDA2SkDZcoAAji-V1B76
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDEyNiBTYWx0ZWRfXyoz2nCyV0chG
 m+UMdYmP5E2iECcoiUJsofS763eTzJOqOKo3HZOfCxIiJGyaqHp6nBgqvRX+uzIhJbbVvNWmJuj
 ugSJFv+QWhZLlYHJrW/DuGoz0zm5PBFGH1ZwDEKmm1Nk4S5CStvIspaf9fLrZ4JANHgQhUzddQ+
 P9FXyyIpl1Mb0JAYzgc6e0jtwf4fonTLwm514KEnWlKzQAwKzmgdUziTcaxaoXm1pJaZF0+RndF
 UHgzNk+iN0Umrzx7ZZ8eKsi0HNvY2yD4mVLXiJcfEVyl9+GYH4pX9bzVqrDaVnYq/u3gMGxrQWb
 SmN3vrgbbj3qe+g0c59c3xHgIq5wjxGhJ383xzlNrh7Q80iBVRCek5supC0oCHCOZ68umAnnFfK
 yo+3TdgmvtocnVLFNscx9DewgEQm7g==
X-Proofpoint-GUID: 0oUyqIYn2YbVrDA2SkDZcoAAji-V1B76
X-Authority-Analysis: v=2.4 cv=DuFbOW/+ c=1 sm=1 tr=0 ts=693ae8b2 cx=c_pps
 a=jsgMSbbXZK7K/abHNvEvGw==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8 a=8b9GpE9nAAAA:8
 a=c8P4vPNukFRfR9deQPIA:9 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_01,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0
 phishscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110126
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Marek Vasut <marek.vasut@mailbox.org>, Lukasz Majewski <lukma@denx.de>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 0/3] Restore boot for STM32MP13/STM32MP2
	board family
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

Commit fdb1bffe2827 ("clk: scmi: Postpone clock name resolution")
is breaking boot for STM32MP1/STM32MP2 family board.

The issue is due to registering clock with default name "scmi-%zu".
If one of these clocks has children clocks, it will generate an error
when trying to register their child's clocks as shown below:

...
clk_register: failed to get ck_axi device (parent of qspi_k)
clk_register: failed to get pll4_p device (parent of spi2_k)
clk_register: failed to get pll4_p device (parent of spi3_k)
clk_register: failed to get ck_hsi device (parent of usart3_k)
clk_register: failed to get ck_hsi device (parent of uart5_k)
clk_register: failed to get ck_hsi device (parent of uart7_k)
...

Update clock management for STM32MP13 and STM32MP2 SoCs family
to resolve SCMI clock's name before using them.

Patch based on https://lore.kernel.org/u-boot/20251211-clk-scmi-imx-fix-v1-1-9579567da829@nxp.com/

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Patrice Chotard (3):
      clk: stm32mp13: Reorder include files
      clk: stm322mp13: Resolve scmi clk before using it
      clk: stm322mp25: Resolve scmi clk before using it

 drivers/clk/stm32/clk-stm32mp13.c |  71 +++++++++++++++----
 drivers/clk/stm32/clk-stm32mp25.c | 139 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 197 insertions(+), 13 deletions(-)
---
base-commit: 7cf578e1b57a39522cffa27b6e9096f8092e164c
change-id: 20251211-restore_boot_for_stm32mp13_stm32mp25_boards_v2-e7497f503414

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
