Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D40D3A934
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 Jan 2026 13:41:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58B3BC8F28C;
	Mon, 19 Jan 2026 12:41:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F70CC8F27C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 12:41:35 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60JCLdZ33775767; Mon, 19 Jan 2026 13:40:56 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com
 (mail-northeuropeazon11011014.outbound.protection.outlook.com [52.101.65.14])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4brmv5uuug-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 19 Jan 2026 13:40:56 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I4ovOwZvc3FjDsgVTH7836lQOSVbehiajSJvieVq5K9gACzcGxbUvNU80AkXeCxOn7x10jACcl4VGrH07Wa5A3fZnMmkXqWM15uL/cQnhBMfimshY8IpVSBa4sq9kn6gPk5ZZBU0/vFkpx4OAzklBTw3Mhlh+TD/wVk6Pvuy4HMsZccT++0x31YWxZXLHeS3gublxeQDQpSMfwmiuPL/NIro6u9+Le4t8IJvtFbUqTP0biDIQLCahqllYVuyOcljrFPELxHvaFFRLsEooe3P17YYY7HQ07seerRku77ckt05nZOx3mDj3z5TtXLzeGBeqd6VxCYFUYT8zcmJ5qHnrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONx509oqLkap+v12jrS7WZ1L4jMAqw20fpXSRAyTxvc=;
 b=chyc4Q4epzkdiRQWRMiSYGw2Jp4Jlis8335vv6uP3utDZy9DO5RdLyqqH3bLMTtgcPjTDVhG02A7MiYGpQesS7933pPbxkNjwQdEQjzjFRbkz8ZT4uUSe33yZFZqZm/dIf7MAtJEjSrtryxF5VfOlslxUph507TKgHJFvbuvRB2G6psXpFxBoflWpBxLv3lste2tnX2Xi22152xK08AW2NCeT5B3xKkzQSjEgrfYqVturD0QkV1fC+zv1jquBhenDjcd6eESDFmBvaLdbfw/usDnj3mHqw6GCkffeS6tWB5PTluRS8NVYAXtRDfejUauzkq8A9u4CW2HfEjRoVS0ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONx509oqLkap+v12jrS7WZ1L4jMAqw20fpXSRAyTxvc=;
 b=j9rbDuBapdIOJQv0BmtL2G7MIDXaRgO+yvd9w0WjNHEU/7FL4rKiQm3Nk9MQXPIp2ZlfxHa+p9J0qbVZOBwld6sRqHt1OS/piU+SGhi1qWx1t3Tz/qYkm2BhpHR7CL7xWnySimjXDcQ/PUCw5rQZ/bNN2e5t7v9zYVqoBSAQGxg+B3p0WhRgFPHbGzaomx2I/ZAven+tO/Y/NSe5Ngriy8kzqKo76QdpqKmrBwYlBJDuIP7UrbpSx2Ka66nDQOqrJ8oB2BFbUDewkCGS42mi7Epa8HNyBAMBXqwwOfhfIdIuhY+Mhtdk5aJ3dGMjxdnIqFbk8yBf/IzpgTPXhWxPtw==
Received: from AM8P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::18)
 by GV1PR10MB9160.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1cc::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 12:40:53 +0000
Received: from AM2PEPF0001C717.eurprd05.prod.outlook.com
 (2603:10a6:20b:21a:cafe::1e) by AM8P191CA0013.outlook.office365.com
 (2603:10a6:20b:21a::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.11 via Frontend Transport; Mon,
 19 Jan 2026 12:40:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM2PEPF0001C717.mail.protection.outlook.com (10.167.16.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Mon, 19 Jan 2026 12:40:53 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 19 Jan
 2026 13:42:12 +0100
Received: from [10.48.87.244] (10.48.87.244) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 19 Jan
 2026 13:40:52 +0100
Message-ID: <99a36a18-0d0a-40db-a897-bb6b69c8da35@foss.st.com>
Date: Mon, 19 Jan 2026 13:40:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>,
 Peng Fan <peng.fan@nxp.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>
References: <20260116-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v4-0-d7cf17cd678c@foss.st.com>
 <20260116-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v4-2-d7cf17cd678c@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20260116-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v4-2-d7cf17cd678c@foss.st.com>
X-Originating-IP: [10.48.87.244]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C717:EE_|GV1PR10MB9160:EE_
X-MS-Office365-Filtering-Correlation-Id: abcce531-f566-4b78-2435-08de5757fbee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UG1md2pwMk9TQmc1Z3FqSE5PZ1F0ZUlYeUlTanZ2MmxMRnNVMjJYTTZidzlP?=
 =?utf-8?B?dzBjVVJkY2djTzNySjZITU85b3VNSFdZb2IxamgvWUppVnRrZ3JzN2Rma01G?=
 =?utf-8?B?OE9lQVNzL3dwN0dOeDRsVTJweWxydnhPTUJ4aVFrZ2VSOUR3eWhQTmZBdkNH?=
 =?utf-8?B?WU1jNE9iWENKL3RqQ0NFcFRWWHNIRlNQR0FWQkZWL2lkZ2ZBSnJkL01qN2hs?=
 =?utf-8?B?bFYxbyt4eU9lck9uUTVwUStjOWJDcDAvMlpTU3JYNm5zakdTVWhGYlV0VHo5?=
 =?utf-8?B?QzR1Q0E3Q3hYWVBSdjBYcm9TWHZLNi8vdlVyRWc2aU1iQjdnMVFlRk5ERWx4?=
 =?utf-8?B?SzdkV3MweDdoei92cTdaV0ZVMU51SW5oM2pITUlYK0JzOFB3MW01Y3lJRmtj?=
 =?utf-8?B?Y2RxRUVxSDNHUUh4aUphSlJORXhKZ2FjeVRJSytJY0JIandOUGlYeFViK2xt?=
 =?utf-8?B?TGhyeFB2TW5ldFZVQzZRTmF6MXJsVy82bFNrS0lCT3NVancweHJQa0tnSkY2?=
 =?utf-8?B?YkZ5dkZ5TGx6ZGNkdnVPd0RSdjc1QTFSNHFyTzlLM25vZUFmZjcxZDdMRkl5?=
 =?utf-8?B?V1lncUZGSThCaUE0WU1lSzgrTDdVZWpTT1Y1Z01rZ2xvUThFQWJNd3lJU2M5?=
 =?utf-8?B?K28rODdjbWxBdmtMbGF1VlNvQVNwelNiUjZhMzdMMmtyUFJlRUwwbzBvVmlO?=
 =?utf-8?B?Q2orM0FmRkJaSU9hVUxJTHA3SFBLdEIzcThPSXY4SEJJRGp1MjNCUnd2RjVW?=
 =?utf-8?B?OTBtZ3JGUkI1K1dvK0JwbU5SWkQ4TENmQ2h6T3pUN0lOYnZ3TmRvaEhtbU5I?=
 =?utf-8?B?VUR3N0d0TkZLaWowc3Y3Tk1ac1c3eXJ0SnlURVRIL1AxNENrRUdaR014S3oy?=
 =?utf-8?B?Si9nQ0cyZUd5UUt1MjdRV0piblljMzErOWM3K0JhUFdmWWttM2k1UEVKcm1m?=
 =?utf-8?B?bDRyOUltZWMrUHFoRlVibEU5UUhPdGlIWnFCNEM2UytTSjdXY2J2Q2Nya1pD?=
 =?utf-8?B?amVVQVVVWHNweHVsQUlTV0tjZXlNZXJHdjg1Rm1od2Q3VXZGSmN4SUZxeCtR?=
 =?utf-8?B?dVlpTzVlS3VzQ0NzemV0R0kzUjVYcS94VktYOEVIZGcyTDlINGF1K2VUZFhW?=
 =?utf-8?B?aEhVdDBSSGxnODdlcnJlQW90SmU4dVhmS3Z0SVlEcVJXTFhSMi9zNTYyWnB5?=
 =?utf-8?B?VUpvdC9yV0wrRG1YYjlJdDIzMHBQQWdudkdMNXJLUnU0TmFMV0g5bWNUQlhH?=
 =?utf-8?B?Z3N1SkVMQzVNTFMxZWJ5ZFdydDNTVCtQYXBrc3dQbWxXdWpBNUs0K0QwMTlx?=
 =?utf-8?B?OTN6U21pRWxMa1Z2OG51RUo0cFhiWWM2bGZmSHZFV2wrRnJiL2VJT0lhZUV3?=
 =?utf-8?B?ZmN4OW0yK2gvS1czbUVIWlM2VmhqeVM3SGdzUkZXWXk4aHhEZnRZWGdoRVRI?=
 =?utf-8?B?MDc3TzQwRUVnTHcrdlNPdDdnZWNSZGtPRkRxZmtwZTU4NkNrRVg3ejBLS1pw?=
 =?utf-8?B?NjQyQTBXQTRLRGUrdCsxOUpSUjZGK2pwazkwQ1YyVktnTi9uR2dWWDgvMzJL?=
 =?utf-8?B?MnJORW05Qi9GUGRhanZic2JFRnN6U2RhaE53QTdOVXhUcTY2VS84VEVqTEk3?=
 =?utf-8?B?WmtvcUdqWWQrcCtBZndJZzN5SW96eTFPSFNaVVB2ZUZqYnZLRytydUhvd3lQ?=
 =?utf-8?B?cTJsVVFKNDY5U0QxWS9wY0dZd1M0UHAzZzZPM1lmWlNQM1RDaDhWNEwycDl2?=
 =?utf-8?B?ZjdCODZ4RDBDYVlybEtxVTlSZlU0OThUdWxPVy9RTDVoWDRxVDVnQnZ3Mi9L?=
 =?utf-8?B?QjkxRHRYNDlOU3duMW42QjR1QzFpYjVsSFFEWDlqbElaMEloZ1R2bWlRdFl1?=
 =?utf-8?B?YjdmT3hXajlXc3ZXZEljUGtMamV1a0dGa2pCWUljWmROVVV3ZlRZbVJsTklX?=
 =?utf-8?B?ZGtDeVNDbHFFdzJRb2kvK2ZIbEpoSjNidWtLeEJ4Z0hPbE55SEVXb2Q4Yk83?=
 =?utf-8?B?OTc0ZmllVjhsUUUrcHRjNGIwK2pZaEQxT0Z4d0JBd2VBRk4wbGYxWWVKWEx5?=
 =?utf-8?B?N2lDbFhyeklJSHlkbG5rQ01OOTBzcFhRZTN3Y2gxR2ZFYWc1VEVoeitqN25z?=
 =?utf-8?B?SHV3WVRJaUtMQTZvM25oOG5RNWxvOEJzeGU2Mmg3dVA5bS9jRVRDUjNlcndO?=
 =?utf-8?B?Nk9EVEd2OTdVYjRxZzJ0cTRpWTk4Y0c3OWxxbTkyOVFoMUo3T0w1U243QklG?=
 =?utf-8?B?cFBZVmZOTG51bEJzZUhaaDN6MjF3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 12:40:53.2812 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abcce531-f566-4b78-2435-08de5757fbee
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C717.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB9160
X-Authority-Analysis: v=2.4 cv=Vf/6/Vp9 c=1 sm=1 tr=0 ts=696e2658 cx=c_pps
 a=pOr88aQqtRPe188Gsff7+w==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=vW1nh7Jg1_YA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=WeavhLENqrrCZG4pG3cA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: Ss1OJOUi8r7VSI_aTkX9y5LZ3_jKAGp7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEwNSBTYWx0ZWRfX0s9wCXyXFXMR
 bhjN8rJ5E+gdT4oz+yZXb2yHVlR4QEBMiwqzK7NT207ItGPbZGlyojf6BsJOMGRUHdRPbBQvzZo
 jzBMHGzUcuPWTFPO4qXGmppK75bd1Pg77EQomTXs0DdbgXiWg9pQ2JMYAJvjDTmP1p7+fYrgQeH
 +r2D6hxCut4dgtX/c9irdK+g6Puu+yiEgREJfmYITtwQzmDx/O+Ge6gFLCFJQ/eb7gGTIrootm0
 FRUPKIPOZB35tFcKRfDgBC9NwJ9yfnvIywQEgwdPN8+rfO4lBLwMfAxuJhUulU2BtTE7jDoYKRv
 lGwuncTmgxnxCGHqAP50M3BPFRcK8A1JUmIsjIpdPGb+E8tPMd6ie+7V9xZw46Lle/3pguP8lTU
 9hM5AnZTB/x7GYdNO8A1wGcZWSwUChyhiVnm4lo7BxeadeiQz4j2SBKlqRBmWsBGzYInwDvBBav
 VYaP38kmw5XUT1ZPfBQ==
X-Proofpoint-ORIG-GUID: Ss1OJOUi8r7VSI_aTkX9y5LZ3_jKAGp7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190105
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Marek Vasut <marek.vasut@mailbox.org>, Lukasz Majewski <lukma@denx.de>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v4 2/3] ARM: dts: stm32: Add SCMI clocks
 in rcc node for stm32mp131.dtsi
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

On 1/16/26 19:57, Patrice Chotard wrote:
> Add SCMI clocks. These clocks are used as parent clocks and are
> referenced by their rcc's node position in clk-stm32mp13.c
>
> Fixes: fdb1bffe2827 ("clk: scmi: Postpone clock name resolution")
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   arch/arm/dts/stm32mp13-u-boot.dtsi | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
>
> diff --git a/arch/arm/dts/stm32mp13-u-boot.dtsi b/arch/arm/dts/stm32mp13-u-boot.dtsi
> index ad63d5027b2..623c796cc79 100644
> --- a/arch/arm/dts/stm32mp13-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp13-u-boot.dtsi
> @@ -186,6 +186,33 @@
>   };
>   
>   &rcc {
> +	clocks = <&scmi_clk CK_SCMI_HSE>,
> +		 <&scmi_clk CK_SCMI_HSI>,
> +		 <&scmi_clk CK_SCMI_CSI>,
> +		 <&scmi_clk CK_SCMI_LSE>,
> +		 <&scmi_clk CK_SCMI_LSI>,
> +		 <&scmi_clk CK_SCMI_HSE_DIV2>,
> +		 <&scmi_clk CK_SCMI_PLL2_Q>,
> +		 <&scmi_clk CK_SCMI_PLL2_R>,
> +		 <&scmi_clk CK_SCMI_PLL3_P>,
> +		 <&scmi_clk CK_SCMI_PLL3_Q>,
> +		 <&scmi_clk CK_SCMI_PLL3_R>,
> +		 <&scmi_clk CK_SCMI_PLL4_P>,
> +		 <&scmi_clk CK_SCMI_PLL4_Q>,
> +		 <&scmi_clk CK_SCMI_PLL4_R>,
> +		 <&scmi_clk CK_SCMI_MPU>,
> +		 <&scmi_clk CK_SCMI_AXI>,
> +		 <&scmi_clk CK_SCMI_MLAHB>,
> +		 <&scmi_clk CK_SCMI_CKPER>,
> +		 <&scmi_clk CK_SCMI_PCLK1>,
> +		 <&scmi_clk CK_SCMI_PCLK2>,
> +		 <&scmi_clk CK_SCMI_PCLK3>,
> +		 <&scmi_clk CK_SCMI_PCLK4>,
> +		 <&scmi_clk CK_SCMI_PCLK5>,
> +		 <&scmi_clk CK_SCMI_PCLK6>,
> +		 <&scmi_clk CK_SCMI_CKTIMG1>,
> +		 <&scmi_clk CK_SCMI_CKTIMG2>,
> +		 <&scmi_clk CK_SCMI_CKTIMG3>;
>   	bootph-all;
>   };
>   
>


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
