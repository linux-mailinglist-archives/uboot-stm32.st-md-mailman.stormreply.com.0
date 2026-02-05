Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2D0WC+BPhGkE2gMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 05 Feb 2026 09:08:00 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB099EFBAA
	for <lists+uboot-stm32@lfdr.de>; Thu, 05 Feb 2026 09:07:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 829D8C87ED6;
	Thu,  5 Feb 2026 08:07:59 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011006.outbound.protection.outlook.com [52.101.65.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B896C87ECF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Feb 2026 08:07:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KIFcBa9qwyQlG7jCFjusxcRTqLtseg8p9Blfko3Fhn6Qo7ZIiQ8YZfeFKfBt/mOi2xK82lWQUmX/2ft/t+MCyV4lHO04gmGjIdWEo/PvBNZUehtWxG2FFh7C11rdv4RrhqkJFimeBOuGkg6FrQs4c6nJrTo4rmQwvCUkPNoQz2YXiU0pucd1IqWLXJb02Itclh8x6135g1VHtFET7LElcoNwJ8Bq5nmzdnU/InBoihPi/JTEJVXa0Klfmj+aBkfLnJd4CNnJBZcYmvWQ4YlzEhZXoc060s4DgaDDBkB8y3bVqYNhRj3nQ7v5cYxtFZtL56XS3p8H/8UTwPw6bK7t4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m06oFcqFoc3J8vYxzs74WRPa5U+Uij7d1ixiN2ha/no=;
 b=UE83B8ZwR1lnzidcRkKnmrAr8+xwbbbv0OhPGFWdlaqmHNEn33EjTNuFk5cXUZGQZ5pq1s2lf4HUSWjzYD98h70+7caS7RxpKj//gz4wwkhYIVmVFQgr6+AVQM3/Nk8ZFQ3MRUiR7vG/i1YTIAEbu/1DupKo5V7rgLOEsNUz+FruUbMkQg6evt+s1sfu+/JGzlwBe2DX4jdLTd4MxIQJZuIJN6VmsAZyj5s7sNgd1GryCyWwKwwoEMIqBB0A+ZAbRDULInUETbRgjEIBoWwMCGF+FxQChglC+gkP3+59FyuhjEMjqOtzHwcQaETLwCXPh2/pLB3kziAKYwoRLCQCjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m06oFcqFoc3J8vYxzs74WRPa5U+Uij7d1ixiN2ha/no=;
 b=WDsEeSiSYtuyh3/EXzMOAGiJsKruhab3A29xZEX1irgAd/7p7FfHy0LCeAwLmOSPhx3F5Mt49xdFP6hlIFPX1QKWA9hd2wcN8m/iOwk1ydjG/LVEWY5rNs+FYNp6n2DQ6hDHXIPuJMNy6/SLBGiRtRLy/pxgC8IRJq+FW/d1tCCIqglzn0uA04QwyZwEljTJXRXZZrz1bue0GFpasePN2+KEM3GeY47L95ZlKOm2XMjDxbP59SMlWnYY2Z1Rn7O37XoFxY7qgDE//5jE4l/vGUhQQdvxD5vZoX7O0pJFpOtOBOJuP5D7rzXHAwspLvDSWhKspiCavUutBb3oqP+HAQ==
Received: from AS9PR06CA0642.eurprd06.prod.outlook.com (2603:10a6:20b:46f::13)
 by PAVPR10MB6938.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:30d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Thu, 5 Feb
 2026 08:07:53 +0000
Received: from AM4PEPF00025F99.EURPRD83.prod.outlook.com
 (2603:10a6:20b:46f:cafe::a3) by AS9PR06CA0642.outlook.office365.com
 (2603:10a6:20b:46f::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Thu,
 5 Feb 2026 08:07:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM4PEPF00025F99.mail.protection.outlook.com (10.167.16.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.0 via Frontend Transport; Thu, 5 Feb 2026 08:07:52 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 5 Feb
 2026 09:09:31 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 5 Feb
 2026 09:07:52 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 5 Feb 2026 09:07:51 +0100
MIME-Version: 1.0
Message-ID: <20260205-upstream_pinctrl_stm32_update-v1-3-3a3797af498d@foss.st.com>
References: <20260205-upstream_pinctrl_stm32_update-v1-0-3a3797af498d@foss.st.com>
In-Reply-To: <20260205-upstream_pinctrl_stm32_update-v1-0-3a3797af498d@foss.st.com>
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F99:EE_|PAVPR10MB6938:EE_
X-MS-Office365-Filtering-Correlation-Id: 531bafa8-82c3-4d85-d805-08de648da957
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enJQK29wOTMrK2pOM0plNDdRMTU4QnZiWmUxYXEwMmtCTzY2SWJNdXk0UnZQ?=
 =?utf-8?B?dWFqcDdDRmlUUVBKMmJ3eHpCZWxIMXpET2V5UWxZVXgyWjJacFE1MElZb1Zh?=
 =?utf-8?B?b0luLzJSd3hmay9FQUdmNTBMTS9VLzE0WmVkR2hTRU5sYXhES3cxT2lXcy9m?=
 =?utf-8?B?ZDhIZzIzTnNiSFVXMWhraUpaaENnVnN5VnI1N2lUc3BrNHF0R0pTR0RQYWVk?=
 =?utf-8?B?c2dVdDlVcTBHZmluS1BqVmtmZ0hSVFgzK05ibkFTaUFxSGFpc200MFo1YnRW?=
 =?utf-8?B?ajNLWE5KUUxWVTA3bjc2QU5yWkYwdXVreU4wMXh1SnY4L00rZXBsNHpkOGxX?=
 =?utf-8?B?WGRVdXlKR25TRWxOdkhSeEpWOE9HREFiV2hQU3h4WEQxZ3FKdCs2MDhRQnN1?=
 =?utf-8?B?dHJkUHhzdHVQT3ByczFRSVVPbzJCeCtNdW9TSUYvcWxDSHIyK0xvYW1DSFRp?=
 =?utf-8?B?T1ZJU20xbGZpOXVGSjBKeEtHZDJMRmRPNEVZVUtyYytFSFdKTk5RMEdxNVJ5?=
 =?utf-8?B?bnp2NUFXU1lIVis0cGZEQkRkcUc1VWxjQ2NINStMcVRYU29pNy9EdDNnQm9H?=
 =?utf-8?B?T0xVOHA0WnhtbFBuSEI5UEtsSkdnVDFxam83RDJwV0xLQWFCRlFiRGgya3Fl?=
 =?utf-8?B?dGlyN29XMDJTT1ZWZmVsVmxjUDRpOVpZeSthTTU2NUhocE05Z0w3ajM3YUJF?=
 =?utf-8?B?OW9mb0NubElpMVZFd1FtTTh3aFozRzNOV0QzQS85WXFGVU8wcXdtSzNqRnI4?=
 =?utf-8?B?Rmc1eVJGcTFLdXltUVgvNy9WSmY4TnlCeS9mQUk3VjFnL0xJTmJyV2lzRjBK?=
 =?utf-8?B?Um9aZUF4S0RPT29YM0Y1RFJNajF2Z3Y1d0xpYVptTWE3bGJEU3ZmSHF4TU1V?=
 =?utf-8?B?TnRlWmYwRk53VkZEQVR2L2JUSGdtUndOYVNRNTJNWS8wdWdGVlpHYUY2YjBx?=
 =?utf-8?B?L3E4N3UxcEtOd25FUVczVW9EaEhDakpqQStCUTlYMW5LTkcrVm03YmM1SDJH?=
 =?utf-8?B?T0VYRnhaUjJVYTBBdXZ1amxZRDViOGU4eFVMb3p1RHNYb2VjYzVnVjl6ZEYr?=
 =?utf-8?B?SzRtWUIzcFBSL2dxb0dnbDJkS00wUEljSGc1TXg5QngwVzZPUEp2V3ZsUU5y?=
 =?utf-8?B?QXBUOXpqRE1MQWNDdlRraXZxbS9SRlRDZzl4WDdhdkVveW9wSzNUREVNTitY?=
 =?utf-8?B?UHJVeXlUeHUwTmtlUGhHaTU0bDZxYUt6T2tlYnMybXZkTXVaTU1YbmRpRkJP?=
 =?utf-8?B?cENNaVFkbFlHTXp5N0xyTWRSK3ZQY1pmNkFEejlDbGhVd2JFMXpNcHpWMXU0?=
 =?utf-8?B?UGxhRE1SbTl1MDkrakV3eDY3K1BOK1hWUXZOVVN6bTM0OWY2TTY4T0FFRm5R?=
 =?utf-8?B?QXBoUnk1dk01Q2VDdnRHWjRwZVNtbksxeWJZbnh6THJvTU9oQjdpditNOUND?=
 =?utf-8?B?RDNOcHlSbGxPdUhnblg1OGVUT0FpMWdtZDhDNG1IWnBNR0hjNVBQQlc5Sjdy?=
 =?utf-8?B?WHdXTWFLWWV0c1VFSEUreHRiYTRZb2Y3QU90NEdURkJ4N2t3OFZEaEdndTVq?=
 =?utf-8?B?NG5oeFl0bkVqMGxhdURnWXBaWG84NUZtZzFUTzhQOTA4a2Y1TUJ5NUVJelZ4?=
 =?utf-8?B?aFdQT3g3ZmpaQkJSNTRpaHNLT2NtTC85TkNNM0IyNlo4dllQNXZzS09WMmJi?=
 =?utf-8?B?cUFsQU16QUJNYlV4eCt2Ky93cDhjZStHLy9RYkdMRS92QWF5Nld6c0Z0T2gz?=
 =?utf-8?B?YkFJNzd6cjM2cDRvYnppZTBXa1pTRC9lNWlXaFpsVU9NUWZERGd3MHgyais5?=
 =?utf-8?B?SkMxNi93Z1VGaVZyR2ZRMDljMEtjWkVCRjRDVXlZZVMwY3p1Y29WTkVVa0FU?=
 =?utf-8?B?WmxUNzZkVEhqWmhOMDhKY2Q0NjA2T0J2V1BldGJ1VTBiN3dva2l2NWRBZ0RG?=
 =?utf-8?B?ODRDb0x5MUVPZmZFelFobnVEYTlxbXVhUGwwb0hYKy9kMWNhSmwvWEVFcXdO?=
 =?utf-8?B?dFhIR2dVNHU5MWw1MmhJdCtmSkVyTmwyTktWZm0vWHRDM2pESTdzNEdhUjNJ?=
 =?utf-8?B?QXZjaVpkQkRRMEx4ZWQzWEYyRkhqc2wrOE1TZHN2NE40bE9SdThuK05yUUhU?=
 =?utf-8?B?bG4zY3J4a0M1UzVDdXFpaWhSWE5NQVNMUUxZMVpNWTdJNGZ1ekxjTmZrNmRt?=
 =?utf-8?Q?DuYgUeO9Vww1VuqExrJwEt8=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UnOkLFcq/39ASue9uNdu7VMj+0BRYi4fSsTMSAfw0cw0iynDPZ5mb3EWnEZWw+Oronyx65G9Y+EnEbU9vyGvC/IuXC01s6aYS2Sn7BmcNWmy5eAtlFWQL3V5sq7Rj0w+mdnBuEmSYj+7edDwnLeiuJn4EBhQEOBxXON9vp306sYAq+1PJVU6kGlTcDf9Q5Tz2KEcwfBw4W6bwlbB95ejeHKFlRKR3xkduSdTPYCxrIYkB9RzRnjJ7/5f/BpkpPNh73fuk70cIZ7r9DVIQelTA0821RXYBjZSSu6msJbcjAADGp6ToMFPX3AFzMNxqYrGb2Ow1lg8gMsc7PER2HbLdCuQPk056zbI9OsyGeIMFn9DN5Q56MP/j6mX3ZjIqthP+9D6dDywiakJ1KULXz6ce6pEEu0l/wYjAt/uWNoROnXJsnNqH6HwlVg1WAAekQcM
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 08:07:52.6494 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 531bafa8-82c3-4d85-d805-08de648da957
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F99.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB6938
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>
Subject: [Uboot-stm32] [PATCH 3/3] pinctrl: pinctrl_stm32: support IO
 synchronization parameters
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.89 / 15.00];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[52.209.6.89:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[10.48.87.93:received,2603:10a6:20b:46f:cafe::a3:received,164.130.1.60:received,10.75.128.132:received];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BB099EFBAA
X-Rspamd-Action: no action

From: Fabien Dessenne <fabien.dessenne@foss.st.com>

Support the following IO synchronization parameters:
- Delay (in ns)
- Delay path (input / output)
- Clock edge (single / double edge)
- Clock inversion
- Retiming
These settings allow a fine tuning of the high speed interface signals.

Enable this feature for the stm32mp257 SOC.

Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 drivers/gpio/stm32_gpio_priv.h  | 58 +++++++++++++++++++++++++++---
 drivers/pinctrl/pinctrl_stm32.c | 80 +++++++++++++++++++++++++++++++++--------
 2 files changed, 119 insertions(+), 19 deletions(-)

diff --git a/drivers/gpio/stm32_gpio_priv.h b/drivers/gpio/stm32_gpio_priv.h
index d89e9b8ed60..69868787af0 100644
--- a/drivers/gpio/stm32_gpio_priv.h
+++ b/drivers/gpio/stm32_gpio_priv.h
@@ -51,7 +51,45 @@ enum stm32_gpio_af {
 	STM32_GPIO_AF15
 };
 
+enum stm32_gpio_delay_path {
+	STM32_GPIO_DELAY_PATH_OUT = 0,
+	STM32_GPIO_DELAY_PATH_IN
+};
+
+enum stm32_gpio_clk_edge {
+	STM32_GPIO_CLK_EDGE_SINGLE = 0,
+	STM32_GPIO_CLK_EDGE_DOUBLE
+};
+
+enum stm32_gpio_clk_type {
+	STM32_GPIO_CLK_TYPE_NOT_INVERT = 0,
+	STM32_GPIO_CLK_TYPE_INVERT
+};
+
+enum stm32_gpio_retime {
+	STM32_GPIO_RETIME_DISABLED = 0,
+	STM32_GPIO_RETIME_ENABLED
+};
+
+enum stm32_gpio_delay {
+	STM32_GPIO_DELAY_NONE = 0,
+	STM32_GPIO_DELAY_0_3,
+	STM32_GPIO_DELAY_0_5,
+	STM32_GPIO_DELAY_0_75,
+	STM32_GPIO_DELAY_1_0,
+	STM32_GPIO_DELAY_1_25,
+	STM32_GPIO_DELAY_1_5,
+	STM32_GPIO_DELAY_1_75,
+	STM32_GPIO_DELAY_2_0,
+	STM32_GPIO_DELAY_2_25,
+	STM32_GPIO_DELAY_2_5,
+	STM32_GPIO_DELAY_2_75,
+	STM32_GPIO_DELAY_3_0,
+	STM32_GPIO_DELAY_3_25
+};
+
 #define STM32_GPIO_FLAG_SEC_CTRL	BIT(0)
+#define STM32_GPIO_FLAG_IO_SYNC_CTRL	BIT(1)
 
 struct stm32_gpio_dsc {
 	u8	port;
@@ -59,11 +97,16 @@ struct stm32_gpio_dsc {
 };
 
 struct stm32_gpio_ctl {
-	enum stm32_gpio_mode	mode;
-	enum stm32_gpio_otype	otype;
-	enum stm32_gpio_speed	speed;
-	enum stm32_gpio_pupd	pupd;
-	enum stm32_gpio_af	af;
+	enum stm32_gpio_mode		mode;
+	enum stm32_gpio_otype		otype;
+	enum stm32_gpio_speed		speed;
+	enum stm32_gpio_pupd		pupd;
+	enum stm32_gpio_af		af;
+	enum stm32_gpio_delay_path	delay_path;
+	enum stm32_gpio_clk_edge	clk_edge;
+	enum stm32_gpio_clk_type	clk_type;
+	enum stm32_gpio_retime		retime;
+	enum stm32_gpio_delay		delay;
 };
 
 struct stm32_gpio_regs {
@@ -79,6 +122,11 @@ struct stm32_gpio_regs {
 	u32 brr;	/* GPIO port bit reset */
 	u32 rfu;	/* Reserved */
 	u32 seccfgr;	/* GPIO secure configuration */
+	u32 rfu2;	/* Reserved (privcfgr) */
+	u32 rfu3;	/* Reserved (rcfglock) */
+	u32 rfu4;	/* Reserved */
+	u32 delayr[2];	/* GPIO port delay */
+	u32 advcfgr[2];	/* GPIO port PIO control */
 };
 
 struct stm32_gpio_priv {
diff --git a/drivers/pinctrl/pinctrl_stm32.c b/drivers/pinctrl/pinctrl_stm32.c
index 1758f9a909c..7d5a0471a65 100644
--- a/drivers/pinctrl/pinctrl_stm32.c
+++ b/drivers/pinctrl/pinctrl_stm32.c
@@ -29,6 +29,12 @@
 #define OTYPE_MSK			1
 #define AFR_MASK			0xF
 #define SECCFG_MSK			1
+#define ADVCFGR_MASK			0xF
+#define DELAYR_MASK			0xF
+#define ADVCFGR_DLYPATH_POS		0
+#define ADVCFGR_DE_POS			1
+#define ADVCFGR_INVCLK_POS		2
+#define ADVCFGR_RET_POS			3
 
 struct stm32_pinctrl_priv {
 	struct hwspinlock hws;
@@ -43,6 +49,7 @@ struct stm32_gpio_bank {
 
 struct stm32_pinctrl_data {
 	bool secure_control;
+	bool io_sync_control;
 };
 
 #ifndef CONFIG_XPL_BUILD
@@ -304,7 +311,7 @@ static int stm32_gpio_config(ofnode node,
 	struct stm32_gpio_regs *regs = priv->regs;
 	struct stm32_pinctrl_priv *ctrl_priv;
 	int ret;
-	u32 index;
+	u32 index, io_sync, advcfg;
 
 	/* Check access protection */
 	ret = stm32_pinctrl_get_access(desc->dev, desc->offset);
@@ -318,6 +325,14 @@ static int stm32_gpio_config(ofnode node,
 	    ctl->pupd > 2 || ctl->speed > 3)
 		return -EINVAL;
 
+	io_sync = dev_get_driver_data(desc->dev) & STM32_GPIO_FLAG_IO_SYNC_CTRL;
+	if (io_sync && (ctl->delay_path > STM32_GPIO_DELAY_PATH_IN ||
+			ctl->clk_edge > STM32_GPIO_CLK_EDGE_DOUBLE ||
+			ctl->clk_type > STM32_GPIO_CLK_TYPE_INVERT ||
+			ctl->retime > STM32_GPIO_RETIME_ENABLED ||
+			ctl->delay > STM32_GPIO_DELAY_3_25))
+		return -EINVAL;
+
 	ctrl_priv = dev_get_priv(dev_get_parent(desc->dev));
 	ret = hwspinlock_lock_timeout(&ctrl_priv->hws, 10);
 	if (ret == -ETIME) {
@@ -339,6 +354,20 @@ static int stm32_gpio_config(ofnode node,
 	index = desc->offset;
 	clrsetbits_le32(&regs->otyper, OTYPE_MSK << index, ctl->otype << index);
 
+	if (io_sync) {
+		index = (desc->offset & 0x07) * 4;
+		advcfg = (ctl->delay_path << ADVCFGR_DLYPATH_POS) |
+			 (ctl->clk_edge << ADVCFGR_DE_POS) |
+			 (ctl->clk_type << ADVCFGR_INVCLK_POS) |
+			 (ctl->retime << ADVCFGR_RET_POS);
+
+		clrsetbits_le32(&regs->advcfgr[desc->offset >> 3],
+				ADVCFGR_MASK << index, advcfg << index);
+
+		clrsetbits_le32(&regs->delayr[desc->offset >> 3],
+				DELAYR_MASK << index, ctl->delay << index);
+	}
+
 	uc_priv->name[desc->offset] = strdup(ofnode_get_name(node));
 
 	hwspinlock_unlock(&ctrl_priv->hws);
@@ -391,10 +420,24 @@ static int prep_gpio_ctl(struct stm32_gpio_ctl *gpio_ctl, u32 gpio_fn,
 	else
 		gpio_ctl->pupd = STM32_GPIO_PUPD_NO;
 
+	gpio_ctl->delay_path = ofnode_read_u32_default(node, "st,io-delay-path", 0);
+	gpio_ctl->clk_edge = ofnode_read_u32_default(node, "st,io-clk-edge", 0);
+	gpio_ctl->clk_type = ofnode_read_u32_default(node, "st,io-clk-type", 0);
+	gpio_ctl->retime = ofnode_read_u32_default(node, "st,io-retime", 0);
+	gpio_ctl->delay = ofnode_read_u32_default(node, "st,io-delay", 0);
+
 	log_debug("gpio fn= %d, slew-rate= %x, op type= %x, pull-upd is = %x\n",
 		  gpio_fn, gpio_ctl->speed, gpio_ctl->otype,
 		  gpio_ctl->pupd);
 
+	if (gpio_ctl->retime || gpio_ctl->clk_type || gpio_ctl->clk_edge || gpio_ctl->delay_path ||
+	    gpio_ctl->delay)
+		log_debug("	Retime:%d InvClk:%d DblEdge:%d DelayIn:%d\n",
+			  gpio_ctl->retime, gpio_ctl->clk_type, gpio_ctl->clk_edge,
+			  gpio_ctl->delay_path);
+	if (gpio_ctl->delay)
+		log_debug("	Delay: %d (%d ps)\n", gpio_ctl->delay, gpio_ctl->delay * 250);
+
 	return 0;
 }
 
@@ -466,7 +509,9 @@ static int stm32_pinctrl_bind(struct udevice *dev)
 		return -EINVAL;
 	}
 	if (drv_data->secure_control)
-		gpio_data = STM32_GPIO_FLAG_SEC_CTRL;
+		gpio_data |= STM32_GPIO_FLAG_SEC_CTRL;
+	if (drv_data->io_sync_control)
+		gpio_data |= STM32_GPIO_FLAG_IO_SYNC_CTRL;
 
 	dev_for_each_subnode(node, dev) {
 		dev_dbg(dev, "bind %s\n", ofnode_get_name(node));
@@ -546,25 +591,32 @@ static struct pinctrl_ops stm32_pinctrl_ops = {
 #endif
 };
 
-static const struct stm32_pinctrl_data stm32_pinctrl_no_sec = {
+static const struct stm32_pinctrl_data stm32_pinctrl_base = {
 	.secure_control = false,
+	.io_sync_control = false,
+};
+
+static const struct stm32_pinctrl_data stm32_pinctrl_sec = {
+	.secure_control = true,
+	.io_sync_control = false,
 };
 
-static const struct stm32_pinctrl_data stm32_pinctrl_with_sec = {
+static const struct stm32_pinctrl_data stm32_pinctrl_sec_iosync = {
 	.secure_control = true,
+	.io_sync_control = true,
 };
 
 static const struct udevice_id stm32_pinctrl_ids[] = {
-	{ .compatible = "st,stm32f429-pinctrl",    .data = (ulong)&stm32_pinctrl_no_sec },
-	{ .compatible = "st,stm32f469-pinctrl",    .data = (ulong)&stm32_pinctrl_no_sec },
-	{ .compatible = "st,stm32f746-pinctrl",    .data = (ulong)&stm32_pinctrl_no_sec },
-	{ .compatible = "st,stm32f769-pinctrl",    .data = (ulong)&stm32_pinctrl_no_sec },
-	{ .compatible = "st,stm32h743-pinctrl",    .data = (ulong)&stm32_pinctrl_no_sec },
-	{ .compatible = "st,stm32mp157-pinctrl",   .data = (ulong)&stm32_pinctrl_no_sec },
-	{ .compatible = "st,stm32mp157-z-pinctrl", .data = (ulong)&stm32_pinctrl_no_sec },
-	{ .compatible = "st,stm32mp135-pinctrl",   .data = (ulong)&stm32_pinctrl_with_sec },
-	{ .compatible = "st,stm32mp257-pinctrl",   .data = (ulong)&stm32_pinctrl_with_sec },
-	{ .compatible = "st,stm32mp257-z-pinctrl", .data = (ulong)&stm32_pinctrl_with_sec },
+	{ .compatible = "st,stm32f429-pinctrl",    .data = (ulong)&stm32_pinctrl_base },
+	{ .compatible = "st,stm32f469-pinctrl",    .data = (ulong)&stm32_pinctrl_base },
+	{ .compatible = "st,stm32f746-pinctrl",    .data = (ulong)&stm32_pinctrl_base },
+	{ .compatible = "st,stm32f769-pinctrl",    .data = (ulong)&stm32_pinctrl_base },
+	{ .compatible = "st,stm32h743-pinctrl",    .data = (ulong)&stm32_pinctrl_base },
+	{ .compatible = "st,stm32mp157-pinctrl",   .data = (ulong)&stm32_pinctrl_base },
+	{ .compatible = "st,stm32mp157-z-pinctrl", .data = (ulong)&stm32_pinctrl_base },
+	{ .compatible = "st,stm32mp135-pinctrl",   .data = (ulong)&stm32_pinctrl_sec },
+	{ .compatible = "st,stm32mp257-pinctrl",   .data = (ulong)&stm32_pinctrl_sec_iosync },
+	{ .compatible = "st,stm32mp257-z-pinctrl", .data = (ulong)&stm32_pinctrl_sec_iosync },
 	{ }
 };
 

-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
