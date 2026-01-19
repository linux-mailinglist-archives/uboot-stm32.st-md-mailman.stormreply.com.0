Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C98D3A99C
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 Jan 2026 13:56:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8BE3C87ED4;
	Mon, 19 Jan 2026 12:56:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DB7EC87ED3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 12:56:48 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60JCZiC4199776; Mon, 19 Jan 2026 13:56:21 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com
 (mail-francesouthazon11011040.outbound.protection.outlook.com
 [40.107.130.40])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4br2n1dr2w-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 19 Jan 2026 13:56:21 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K7a8LkY/HaZA//isCHhB5SG+vTbP77aN+loWUe9HCzPqGIiDdoqbrp+sZMvO1slH4RxRDOkwUmuTjrJCBk4LMxm4UEABgKEUEz6LnM8rgipUKaIEf9WQq9W4FGf+qz2PVzV5ws2kboZOaAIQl1lVICdQ8PFn1RMc/+EYk5OcX5ZbRpoNywG9gtzzlaQMgJOnQ0f3HeAQY1iyjlITHuZns1SpnZE3tAdWpFe69f4KAtkmw2dQy67J4aHd9JcK6o2FiXOgf8VS3ojzuT5E2Mgqjjcm4ihfs2eB9NisAoDl4tnA6+vQY7783g3R3oNMfO0QA5hfuGUCiUqkiGnuyDS08g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GG3roLZND9fSwng6ccWFuJoCjklfMJupncn3rpEC2lA=;
 b=tYivl/sU40qWtY9mPEb/E/KhtIKueJgySSY15CJqZ/0RGo6HuA/Sps3jxAHEdbvzsXunTayYecR6lt+/OOTXJ4gxvzDTnJzpxpkjy+o1mNxoPfaYUUDdL4Wl4louC1o4qzALYNOdlUovchRwwYrMkc1nxk56dmP4ENvNez9Dnl7i7NqiSULb6NCaBfQDDeM6dXse17xiP5eSPn3EgwmL7DfeHmK2viAlxwxC1t92wC6ptmZ4e5iKsIdSEEEBYfPIx0I21zeFpgdL+T/XhANZJWAOyniqMEgBT6cyDI2WNE1WA8Ja8kIf4n2rwgQD1UnVNK7mpIvbMXx11ktLeuRy9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GG3roLZND9fSwng6ccWFuJoCjklfMJupncn3rpEC2lA=;
 b=HEyhBgghwV0JlDxw7iSo9qNnsio9M9anPOU/t4wKxwjgfI37Eb1i5YHl0QHLteiov1Xtfd7IdaQH4az19jBns1uKpb5fNjDx9cTExXDx7Eyn7qDSP1xIL7iRUqSVuWvztoagEnCVFK40qd7/ObgzU8pA+IdbPptsqODUqk73Y9RuqXCTPJ1x8hG0gtfppx9LADvai0skk2+vsNOBEZE3Id3grABzNidqU0bIPUDkBb9qOHpRtsYMx8EcLGzmw9vLfV7aWSSqFV5Px4VsG0fySiOL6EPqApnQsE8vsEjVTI3xVJsGi0nmgSEj9ktam08u9uG9Hre+E6JChk+5VeDraQ==
Received: from AM0P309CA0014.EURP309.PROD.OUTLOOK.COM (2603:10a6:20b:28f::25)
 by DBAPR10MB4028.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:1ca::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 12:56:19 +0000
Received: from AM2PEPF0001C70C.eurprd05.prod.outlook.com
 (2603:10a6:20b:28f:cafe::ce) by AM0P309CA0014.outlook.office365.com
 (2603:10a6:20b:28f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4 via Frontend Transport; Mon,
 19 Jan 2026 12:56:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM2PEPF0001C70C.mail.protection.outlook.com (10.167.16.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Mon, 19 Jan 2026 12:56:18 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 19 Jan
 2026 13:57:47 +0100
Received: from [10.48.87.244] (10.48.87.244) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 19 Jan
 2026 13:56:17 +0100
Message-ID: <cbd93e26-8de6-4b05-966e-7021e9114771@foss.st.com>
Date: Mon, 19 Jan 2026 13:56:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>,
 Peng Fan <peng.fan@nxp.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>
References: <20260116-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v4-0-d7cf17cd678c@foss.st.com>
 <20260116-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v4-3-d7cf17cd678c@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20260116-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v4-3-d7cf17cd678c@foss.st.com>
X-Originating-IP: [10.48.87.244]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70C:EE_|DBAPR10MB4028:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f6a330c-33d7-4964-638b-08de575a237e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0dsYVl4Y01Ubi9wQnlqcjNnNDE4NDhuSHdkQkM0QmdyNGxsN2dDU0lmK0ZM?=
 =?utf-8?B?S0F6NDdBLzQyRnJ2Vys1YmFaK1dYelRwNlJyeXRmelhiOHJ2czIvVTNCWHI1?=
 =?utf-8?B?MlpqeXZwNzVvbjJPdm9tbkVEcEF1Z3R0WHp3cEphd2RXa3ZhSDRQRHFUQXV6?=
 =?utf-8?B?b1FFc0tBOUNVVnBvc0xuUXNHb3NWaWpaTTRXUURWU3BhOGlQa0NrdFJ6QmIy?=
 =?utf-8?B?dUxQV21lMk9Vc0VMVWxvazVSem1GMDk1L0lMU0ZRbXg4NDY1cyttYnZ5RW5B?=
 =?utf-8?B?cVY2cmFtVmg3Q0ErK0NMQ0lPZGVjSTdjKzBDRHA1U1E1cVBONlBhRFpYTGdu?=
 =?utf-8?B?QU40SEJQTHk2V0VHVnFaTnFtMlZGMVB3c0lKSXViZ1RNZXZaaFBrUlA2QjZk?=
 =?utf-8?B?U2dYYmtDQUNOQmdDSUdFSEFub21jQU00d3RBYnZwZzIxVFM1dVZ4cEJCeG1M?=
 =?utf-8?B?MFRHK3R0SjRtV1BWVm00SlF6YWpoWUkyUHVoYUhnUlJNSDZ4clZYUXlaSkp2?=
 =?utf-8?B?K1BZV24wcndDaEk5akxBdFBXcjJpUXlUV2cxWm9KRW91WkEwb21HeTM3UHFK?=
 =?utf-8?B?c3o1RTN0TUllay9RMVQxUlFXK2U4aWhQYUYrV0p5a1MvZEtCK0ROWitKTTBV?=
 =?utf-8?B?WDYyOHM2dWhwYUdtZlZEd24weTJzRHVKVjAySTJUbmFRWE1YRmxjeElkdkMr?=
 =?utf-8?B?ZkxGTFdudk9NNm1ueDU0S2haU00vc2ZXeHlRRXdQbE5XL3REQjhTQmZVUVo0?=
 =?utf-8?B?WmMwcVkxdjNiTjRBNThCWnRpZkdNaDc0TXk1dXNEbHArNDQxSVMwcVFvemJT?=
 =?utf-8?B?eVRlbU5SMHBIcUxIZUJ2R1JWTVNpUEg5NkRIVlh3TXoraGhPMHJ3TFFaMmc4?=
 =?utf-8?B?ckdLNWMrbEhEMVhoQTY4cG9mN1dOMENaZGg2MlZaZ1dIdE5wVWRmWVNvb3U4?=
 =?utf-8?B?THdNQ2NkM2l4U2dhUG90VElKMHZvS2FoOGJVbkg2Qm9YRjc1bmJINktYZU9k?=
 =?utf-8?B?alBqS1ltWnhxcVVvN0JBNmE1TUdLVUhTeXZYSGpQazhjUG44WlBaOXhqU1Ba?=
 =?utf-8?B?U3BkWE1TcWFnOTdzOWx1Q3RvQ2RXU3FDdVRiZHdZYVhOQWtXSm4xMWtQV3pL?=
 =?utf-8?B?TVRqV3hsUVZzUy9mU0VZZ21TdnB5cHAzeHI3emdUVW1iR0VvcHpSZXRTcTFp?=
 =?utf-8?B?dmFWRk1XYi9vd0NrSnFuYThkSWtFU2E1V2xkeTBnTTBhaDQ0bFZabnZoZU96?=
 =?utf-8?B?anBEN2JjM3FUdkRHSnpXS3pKWk84Tll0cG50YUVQS2cwa215OHRjREVoZGNK?=
 =?utf-8?B?K2orSFFuMnJOekt1c1MyS2V2cG02QlVWY0h0SzNsMlBpS1ZIbWdrR0IwdnNB?=
 =?utf-8?B?SjIwc0Q4S0VRcmdOQ21ZRHJ2dmZPN1ZramlHa2daNlBNZnV1bmlLZ0Q5c0dB?=
 =?utf-8?B?eDRIN2R6b1I5clBUOWx1ZlJ4dmhoMi9IdEJOTmgzaTB0UG1sSU5hWWpPS0xU?=
 =?utf-8?B?TmgxbCtqbHpMQkQ4dU0yTGFqUFdudlc2LzYvdi91WlQ5ajNEdE9vSnExYUJj?=
 =?utf-8?B?NGNaQkZXcWFENGV6TmZXYXlzWDR0aEx4SWVQbm1GYmlTWnF0TnFNcnlUOGFa?=
 =?utf-8?B?UHozR1huL3NiY2Iva0k0clkyVUU1L1FwaXRGTjFxa2kreUxaalgvS3JnRlIz?=
 =?utf-8?B?YWhNMzI1Sm9EV1JncmdtL2pneTgrcERmYTlRL2NnN0ZtOXhhSWRvY0RtMGpD?=
 =?utf-8?B?MDM0SngxN09ZZU5BcnFLdWI1VlVPZ1dsT1FFZy9jcEdTTllqZGVDbS81NzYy?=
 =?utf-8?B?UVFhTlRMMytvVGJGakQwNDFQbzdZdXNGeWszNk83cVFRRGtad0ZMTDFsdG15?=
 =?utf-8?B?V2VrL0p6QU9kVmJVOERwM3JTWE1uTktIMUpVdEdKSDhLaVZEYkd5ald2TWtx?=
 =?utf-8?B?TERlOEt6U0JIejQzTCtTeW5JczcrYU1KazQ5TW9Xc0RuZzhSVy9iejlzTUtE?=
 =?utf-8?B?T2tIYnlrZEZlcENiTTE0a29NcE9YeWVyaU1nTldicmNSSDVmVEtaSU8vTy9F?=
 =?utf-8?B?ZTY1SFVsRThRMk9DdjJ4MkZWT3BKOCtPZjJ3VzQ1cnYrQ1dLUThOc3EwYzU2?=
 =?utf-8?B?OW85SHA2UWc5ODNyY1Y4T3dSMEdaaE4reW5IVnA5Z0JualpZa0hTWm1UdVBm?=
 =?utf-8?B?V0RXWkRSQWE0WDZzb012aU9SWkxEajF1cnZQUU1zRHpZUGF3RlZWOXJyMFdv?=
 =?utf-8?B?Y3ZoaElHckhlRVRISENpeHR2ZTJ3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 12:56:18.6564 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f6a330c-33d7-4964-638b-08de575a237e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C70C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR10MB4028
X-Authority-Analysis: v=2.4 cv=KfLfcAYD c=1 sm=1 tr=0 ts=696e29f5 cx=c_pps
 a=WZKlGwpgOa9Z4PnAcczMeg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=vW1nh7Jg1_YA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=nZYid853XsEObbSsFpAA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEwNiBTYWx0ZWRfX/xJk3k7O0fD0
 aC3W9VaQ2wR5QWhNgbN8CwIL8LLILLlLlmiFtcwPLaG6WAjljSqK4onTT0fh6w2kg5kLrmy0u1B
 Tne4axHNsbGujxd7h+6CM9wF3fjCeXL2I4mbF1zjpYMSMVS1eJfJ3ce4p56ewuK3AgWodcviQxZ
 DtTP8nRAn+CsLy0qtqMuaGivlNMseRySExpkOEzAy2epvxmLhOCL2eZ+2eC1RQShQpTWZ0dnaU6
 BLQj/QyEx/jR0M2DTtYwc2fes6AFS4IPmkq2/r5kafk66Mseopg712pg7ru5nwSfiQTLVdbeccz
 jiZXOmp2l0MjNel0Lx7pbOaDBrW7B40+dJh/9lODwLADrWghw7P1nAwZKDojQ9Z4OeJUEXLnJE1
 AA8q72WT4RCxjLpZGuD3OpyABTPpInewQvTpSF74N5B44YtPVMr3OsL81Vy28HYS2XoYc2aMIp6
 j7vRLwjpr5eosDe60bg==
X-Proofpoint-GUID: WJ4sNJx33YNOhqs_AppenNpYmW-l2UX0
X-Proofpoint-ORIG-GUID: WJ4sNJx33YNOhqs_AppenNpYmW-l2UX0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_03,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190106
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Marek Vasut <marek.vasut@mailbox.org>, Lukasz Majewski <lukma@denx.de>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v4 3/3] clk: stm32: Update clock
 management for STM32MP13/25
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
> During clock's registration, clock's name are used to establish parent -
> child relation. On STM32MP13 and STM32MP25, most of SCMI clocks are parent
> clocks.
>
> Since commit fdb1bffe2827 ("clk: scmi: Postpone clock name resolution"),
> all scmi clocks are named by default "scmi-%zu" until they are enabled,
> it breaks clocks registration and boot process for STM32MP13/25
> platforms.
>
> Rework the STM32 core clock driver and STM32MP13/25 clock description
> to use clock index instead of their real name.
>
> Introduce struct clk_parent_data which allows to identify parent clock
> either by index or by name. Name is only used for particular clocks
> provided by IP which are clock provider as i2s/i2s_ckin, usb0/ck_usbo_48m,
> and ltdc/ck_ker_ltdc.
>
> STM32_GATE() and STM32_COMPOSITE_NOMUX macros are updated in order to
> use parent clock index.
>
> As STM32MP13 supports both SPL and SCMI boot, keep using an array
> with clock's name for SPL.
>
> Fixes: fdb1bffe2827 ("clk: scmi: Postpone clock name resolution")
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   drivers/clk/stm32/clk-stm32-core.c | 116 +++++++++--
>   drivers/clk/stm32/clk-stm32-core.h |  42 ++--
>   drivers/clk/stm32/clk-stm32mp13.c  | 417 ++++++++++++++++++++++++++-----------
>   drivers/clk/stm32/clk-stm32mp25.c  | 405 +++++++++++++++++++++--------------
>   4 files changed, 671 insertions(+), 309 deletions(-)
>

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
