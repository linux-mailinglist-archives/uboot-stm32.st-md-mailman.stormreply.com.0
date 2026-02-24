Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id NIuhM8mjnWmZQwQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 14:12:41 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7747E1876DB
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 14:12:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F209EC8F286;
	Tue, 24 Feb 2026 13:12:40 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013011.outbound.protection.outlook.com [40.107.159.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 156DFC08D19
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 13:12:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jwBnq7Xf/0oHXSnuVOBsCncxqGAcSS9X3CWvvCSjTKyuTeEqWlGLR94nDMHoItroXA8mz7gJyYxhUdSjW2nRj/tHmSemNiRWYRirGVC93ha4w71pudMhdW+ZDL9ZAWzT07Jh9kzSTneA2KR0JmIoJqgBeflGd8hMgStACH3HJ0kOUu9xavFSJZd32BZPPxc2ABQoC4kFY9w0pH1bM7/jm8hK4mwd4x39KxAYYmkLgYLinxjP2nqezXAkEHYNNwTpzaOxEGtAUzAq9kzE6PVzzKvQ94l5UgQO4PRZ4t02FAYG1tdnwnZpQ5FvEF8PRw+Ful+NXSoBocFKpBHI4ED4hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HExNoLiEGEE715UjiZMDybfmKmWbzrPSElY9BifTr2o=;
 b=KdwOHcX235Eim/ISTfcIVLtJvWddUdd14vzwSDR9UWy8NilNV4geT0Lrm5zbeqRN724omZGYBJUjFDMwXU+bbqYNpscw6XsZCwXDTydgV5qOs8cvAWG2WOqOZcfACwEurZEudxG4rkNTTesGuQiqXDggzX1Y51iG4Pf78lR+0MgcPUAaTIoeRObtNl4qZSJavsyrZlwrKA+JqC72n+fxs0semVIxtD7GTRXh7SuAj8BPRYr7IE2/PEYO3lSQkNiKcJThFRS2ecomS6VcJBePliwZN26cJEGeslG/oZhsOxzltZDoJZE5MzBxyFS8WTnzUR9IIaLaDw/TN8NcHFBPHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HExNoLiEGEE715UjiZMDybfmKmWbzrPSElY9BifTr2o=;
 b=CMiqd/m7K8be0lgWsNv7rh7v61DlJVqDMbFDyUcWh+eYHPpWpeQdUNsyAYTzlec32zq2A/Qq0N07fao7Q2o5EE3DKs421r+EwMkZNIvY5d36jvPegaaz7Zk3WTSgdrh6kg2sXbVpzUxPGi7Yvay4VC/jAko3IH/f3VM89Ut8SGPGYLGSIPQ6JF3Fb6SuJqnN6XSWoOrRugCToDcIi/+71OPCVHFgGn7SAjVTd6xWONbvzw8oLqOsLzT3GS/msJvbVcvmtlFmA/SzTSwMEMBKZ8PchsRGIHk1AcVQSussLXKEh0u9RQHJwRB4woS5zQY+d+uzhFtCx8voFbUVQP5xpA==
Received: from AS4PR09CA0013.eurprd09.prod.outlook.com (2603:10a6:20b:5e0::19)
 by DB8PR10MB3500.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:139::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Tue, 24 Feb
 2026 13:12:38 +0000
Received: from AM2PEPF0001C711.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e0:cafe::d2) by AS4PR09CA0013.outlook.office365.com
 (2603:10a6:20b:5e0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 13:12:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM2PEPF0001C711.mail.protection.outlook.com (10.167.16.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 13:12:38 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 14:14:54 +0100
Received: from [10.48.87.244] (10.48.87.244) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 14:12:36 +0100
Message-ID: <ba227267-5f6e-4665-acc1-93ee0ac65e2d@foss.st.com>
Date: Tue, 24 Feb 2026 14:12:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>,
 <uboot-stm32@st-md-mailman.stormreply.com>
References: <20260203-upstream_add_stm32mp21_support-v1-0-48ca3409cce1@foss.st.com>
 <20260203-upstream_add_stm32mp21_support-v1-4-48ca3409cce1@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20260203-upstream_add_stm32mp21_support-v1-4-48ca3409cce1@foss.st.com>
X-Originating-IP: [10.48.87.244]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C711:EE_|DB8PR10MB3500:EE_
X-MS-Office365-Filtering-Correlation-Id: 830305f6-c846-4bd7-f79c-08de73a66226
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K0g3amd3R3VGak5VOEhXZVQrZTJnYnczZVBURU9RcFNINlNGc3Jjd2kweE04?=
 =?utf-8?B?aXl0cUxibTUxNjNNWlZRME03WTh3dmRQRlZoZzE2QTdsZ3ZIQjRFSFJFRjBp?=
 =?utf-8?B?TWlJUFdiUVlmR2xWeGxZS1lLWmJVamFEZFdZeWl5NHNzZmFUbDhBSFZLSmoy?=
 =?utf-8?B?L3JIZGE5Tk56d0JhN05zT1kxYjFnS0JPTjRsMW5kK3NwekJoMStqZC9HMm44?=
 =?utf-8?B?SlFVWTdQcFBHcUtuRjBYQTdJQm9LVmVIbDlzYlEzYlhLZW1WaG1MQjhDUTQ2?=
 =?utf-8?B?SVdadVdYNVI1QWZzOXY0Nk51T2hRc1RMQ2NYUnhubE96eTlTcy9FUU5wRkIr?=
 =?utf-8?B?WmFrRVlJblg5dFNNOTR3dzV3V3JxdDN1a25ZMDJ1MUxXb1FTQnpkb1pyOEhh?=
 =?utf-8?B?bHRjd0JJWUxtcmNyalpEU0hJYVY4TVM0cEdqckFpVzZUQVVzVGkra0l2RE1P?=
 =?utf-8?B?QmVWUHFYUzZoN2ZEMzg0NzcxRG5WNzNod1lGbVdlSEZ0KzdoNkg4T1hzTWZD?=
 =?utf-8?B?M2RSdGJrUVBFL29SVHF4Y1E5ZHoxc2dERGFjMkdQbUU5NWxuMk1VOU1nVHNi?=
 =?utf-8?B?aktkeEtwOS8vOWdZT3czTlhnL0NFdTVPV0VrekY0b1NGdER3ZFEwN0lYbjJn?=
 =?utf-8?B?cHpmRnRXaWhsMzQwYUg2dU0rRmR2WklEb1RTRHU1YzlnR1R3NDNJMnVVS1hm?=
 =?utf-8?B?S0NCbEw3dHBYOUx6b2Q2bUpnN2ttQ2FseTducFFzdlQ0T1hGSG5oODZTeDdB?=
 =?utf-8?B?c3lVekdGMjJ4MEQrOHFBTzM3KzhiZmpUZUFGQUdnd1p1dm5mcnB6OGs3WHQ5?=
 =?utf-8?B?RmViamlacGZ5ZklHb2o5UGhkVzNxUExwTlUwRFF3bGMvWXRKaUlmdW5ORWVL?=
 =?utf-8?B?Z1JvUWhzS096eldrS0ZsVC9ZZGltTlZqd1MxQjBucjJTMEpVN1F5aUhkcVdM?=
 =?utf-8?B?cVlIRkhhNDNwTHpYNmQ2Qkc0eXVCcjlFMlpIOWVldkJsR0MzV3dRd2FjZFhS?=
 =?utf-8?B?V0VpdyszUUdhMnVKdkczQkxvbDhHRzllSTkwYmJWclRRNUEreHRlM29jTVU2?=
 =?utf-8?B?OWVod2MrT3hncEdUWU1RYzMxYlFhZy9Xd1p6d1RoUTQ0VGNjaFFFRnRGbFBD?=
 =?utf-8?B?NGYveXg5WXFPTEpRZURLeVFTUFZxRXJubXQ1OTE3RjBRb1hTSFM5WnJDUXFQ?=
 =?utf-8?B?czFySGhLdUlZZ0xXTWtPUXEzek1NWFdpMHhvSFhvNzJQK01EMjlXbCszLzhO?=
 =?utf-8?B?UTU3SG5XMzFpZ25TU29wRVpSaElyeFZ4VitIS0FUdzlISWpTemdLNDNCeFU0?=
 =?utf-8?B?Rk1QeEFNK25YazdZMzJMTmVvbXErOHR2NHJHQ3VPVlBrV2I0M3NPbkR6Skk4?=
 =?utf-8?B?bUdTSUNEVjZNR01tTXlPMzJUVzBIbkVkSUFPUjJSTHhqSXphY0pGcjV2Nzgw?=
 =?utf-8?B?Z3E2MTd5bkJkcWc4T2R2VXFReC9reGtFZlpxWTNxOEZBYzJrSUpRczNiaVN1?=
 =?utf-8?B?clRNWjZtQWVpWTlrVTczT0VwUnNERFlvVmJYSFloaW00MENOb21YS3N0N0VO?=
 =?utf-8?B?UXNuRVBhcWUvZWo0Skt1SGJHMUZYQTQxRjkrN2FFb1VDVGZwZ0MrZnJwbUlH?=
 =?utf-8?B?ckZvZERpUUgxUlJ0VkcySFZHclBzeFlVOFRibFdRZSt2dXpwTFNndkhyVVlX?=
 =?utf-8?B?RmNIeWx0aDc1Q3hzekVvaE5zbHpoNVJ6ZTBSR1VxWWIreXVsNnhCblhrcS85?=
 =?utf-8?B?dWNTaWlaZ2RqdjNUUStsNDNtSVp3MmhHdHhYdDY4UGdVOEdpQXpCditGQzEr?=
 =?utf-8?B?YTJvcGZnZmh0YWc4NDAvMUV6Yno3L3FhaFZ5cExFMVQxUkV2ekphTndMakY2?=
 =?utf-8?B?K0dDNThpMGlhSWxUNW9pNlpPNGxNcHJ5VlVMQnBqcnNEY0FRQitNWWFFdXBG?=
 =?utf-8?B?TGxja2c4aFlCck9RRkEzMmpoTXBJaXFPTzF6UEMrMnBrbXRTVnZrOGN2SEpR?=
 =?utf-8?B?Zkpqb2ZCa3IzT3IvQWFhNVk5SUNTZGViRWtwU1dWRUlBaWJRbTR2Vm9CLzMx?=
 =?utf-8?B?NEJ1cGNrWit4clFCOFEzWkMyOW8vVXVacHhHWmZjYWxReWhFcFZoRENWNDNC?=
 =?utf-8?B?ekhUU1drTXYvcUR4dCtPZEd2citCVVRLQmlTSnNYU0thUFpsRXRYWExhUjFE?=
 =?utf-8?B?cXJRZjNYREhYQThJR0xjWnhvVmhjTkR5cWpRQzA2aHZRWU1tVnJZVFc1Qk8v?=
 =?utf-8?B?NjdSTGczS2JjYmE5MnJlaUtHZ2VnPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: BW7qopQwdMfGf/vZ0Tmv6XzTLW+oXjr2dgfgfQUgIZcr4CDStvinLqt6yZZdOMFvyHk6uxphkNzWiFuY/tzEPRja93cLiqiuZHJLVy17wXMFB/6LYw1oNsABW+o+8xJKGkc6z0gXOAqhmmVmo0oBgIGqgUz1h+J3dyD6OyRq8KM2hQFkFlDUfYbuD2DAbPZ5mYBagwBUUDiVCFaIPLUzED4szSIuIexWhE+OPoYPyzQUJAf/xG2z0hkc1LF5wsw+4aX+H9n4ieOQH+X5vMP78mxJXhG9u7l1H/ZS1xz/r6acVAnWoVkJcuNxSSPEwgbp2mjgX+qa4GFQaN//uayGqu0gEV0KDx/S6thCwLNEwVXhvFX/cz3zrNU1qlZIoIp5RsXB6kweorEC7Ft4FI7ryMTVJFyyMpPn98QBPuoyBmRbZnbTr6yepAAj/0eMZWvz
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 13:12:38.0841 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 830305f6-c846-4bd7-f79c-08de73a66226
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C711.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3500
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Marek Vasut <marek.vasut@mailbox.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Cheick Traore <cheick.traore@foss.st.com>, Lukasz Majewski <lukma@denx.de>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Nicolas Le Bayon <nicolas.le.bayon@st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 4/7] stm32mp: cmd_stm32key: add support of
	STM32MP21x
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.89 / 15.00];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:patrice.chotard@foss.st.com,m:u-boot@lists.denx.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:trini@konsulko.com,m:valentin.caron@foss.st.com,m:dario.binacchi@amarulasolutions.com,m:michael@amarulasolutions.com,m:marek.vasut@mailbox.org,m:quentin.schulz@cherry.de,m:cheick.traore@foss.st.com,m:lukma@denx.de,m:gabriel.fernandez@foss.st.com,m:fabrice.gasnier@foss.st.com,m:nicolas.le.bayon@st.com,m:lionel.debieve@foss.st.com,m:gatien.chevallier@foss.st.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,foss.st.com:mid,st.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.847];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7747E1876DB
X-Rspamd-Action: no action

Hi,

On 2/3/26 17:49, Patrice Chotard wrote:
> Add cmd_stm32key support for STM32MP21x SoCs family.
>
> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
> Signed-off-by: Nicolas Le Bayon <nicolas.le.bayon@st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   arch/arm/mach-stm32mp/cmd_stm32key.c | 70 +++++++++++++++++++-----------------
>   1 file changed, 37 insertions(+), 33 deletions(-)
>



Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
