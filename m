Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJzjNYYdg2nehwMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 04 Feb 2026 11:20:54 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C430E4659
	for <lists+uboot-stm32@lfdr.de>; Wed, 04 Feb 2026 11:20:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4093EC87ECC;
	Wed,  4 Feb 2026 10:20:54 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013061.outbound.protection.outlook.com [40.107.159.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8108AC87ECA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Feb 2026 10:20:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h/SLhfwsPrH4A28gjSy7lLNAnCWU6LyqQYUeGh9hbDUxcxo+bdnUz9fiexkbBupKpp0dq9V+ZmOXpeFjCucfWrOXsm9LFRUejxPeZWaqMwJYRLIUB+l6UCJ4tq1ODUlhorWqa6jj7ncTa+an/KfYmYNFKZti2hctyT7Q0WijWDyvJtsHTcqABBCYm7cBkNzXyd0V2caFos/fSo64qQ+wB/8++d2dna4bbGL9cvkNEcbrEzLEaPbjQ2wwLb7HSXj/3/KiOYKm7uYj/Ef9DOfwrbFGNZA9TDK5FFbQXf4Y794j3Pe/xRQwPTjDO3Ub2hOXALE0rK1NwQWD/VijJHBOIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ab5f28d74dYmS3DHGlR5sfq+9Ev4MGmK0OgPDyHICm4=;
 b=Qb0KT8Dm6Qrpo50AuXtG8I0qVN8wu6k+7FSe2k8Bc7xGvIrvrfKL8/7JfsGrd5dTQBGE238nn0bXoJf465/TyZAbhCnP/dGM5Rn9UwvbAV0eJqb1yMOvy2oZFGzXdElahHaZi8sBCWGzQwJUBuq+JIBFmz9FMbeWXHg52j8v2KgJ3Bn+vHeW2rt9iQwWUiMLm6SeT6AandTCtmNbScBsFkpX+3X3pCXqEV9x6vI4/JxqBB5vOeTzp5UbisyhocDK4OUFECTqXYK2v283cNZ/z5NUeRM4RC5eLk7VG+znz7PYw+AvsXiTP96J5EX2IMsMX6hom2v0DHwNmP061nyCpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ab5f28d74dYmS3DHGlR5sfq+9Ev4MGmK0OgPDyHICm4=;
 b=A6txDXvFpEkmb4cHJErTZy6IFyW3Vh6aaitUEIbmOIkiwsNn957qnUeYmcZM9UEm/0L7du2fwVLKCzbmT88/TajAZgRg6RrmRU9UGq606v7qZ78jgEP7b3CTKduFk/Z0Un+XjpZ52kRGHaNwm/3OMRayUUxgmIoIEsk5ZfdAQ6ley2fgFNHVwgNUdl85FvwrtoQH0lpr7lKx15HsiJVx+TDqblXid/vMNu88lclHwVWJCDNVEx+qW7e12eUT0qOy/0Xosb0EAqedunzJe+4P5iHNyJvA3KTuXdu0Laj4FG+bV18rQGGKRwv8wOXlzPnDjsfaI3cisIZDh1shuOvqmQ==
Received: from AS9PR06CA0761.eurprd06.prod.outlook.com (2603:10a6:20b:484::16)
 by AS4PR10MB5767.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4f5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 10:20:50 +0000
Received: from AMS0EPF00000197.eurprd05.prod.outlook.com
 (2603:10a6:20b:484:cafe::d3) by AS9PR06CA0761.outlook.office365.com
 (2603:10a6:20b:484::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Wed,
 4 Feb 2026 10:20:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF00000197.mail.protection.outlook.com (10.167.16.219) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 10:20:49 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Feb
 2026 11:22:28 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Feb
 2026 11:20:48 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 4 Feb 2026 11:20:46 +0100
MIME-Version: 1.0
Message-ID: <20260204-upstream_update_stm32_cmdkey-c-v1-1-d95374395840@foss.st.com>
References: <20260204-upstream_update_stm32_cmdkey-c-v1-0-d95374395840@foss.st.com>
In-Reply-To: <20260204-upstream_update_stm32_cmdkey-c-v1-0-d95374395840@foss.st.com>
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000197:EE_|AS4PR10MB5767:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ae7e40b-8df6-4f11-7d55-08de63d71190
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024|7142099003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEdtU2d0dXZHcm84dWtlQkR4T2hOSERHem5CZlpWWGFnOHF2UW40K2sxamJ0?=
 =?utf-8?B?VHQxQVV4cDFSSG9TeVU2NDY2TlBrREV0OTVvZnpQUitMR25TWTI5N3lnb2N5?=
 =?utf-8?B?RzBWZUNYRmc1MFY5RHQ0Q1VhSkpKUktFSXlJUkNSOGNtUThMMGhSdGtlK2Ro?=
 =?utf-8?B?TnoxYjd3cWw5ZkthdWVXdHBSa3JsWDlVWGRJMFlCVmZUcFF3amY5eFRTVENL?=
 =?utf-8?B?R1RGSTFyNDU3WUhPd1RDcS9rSG83V0ZZV05FVkhkSDNFYlBrLzRsWW9mU083?=
 =?utf-8?B?RHBFWGVFOUs0VjZjVmpqYWNwaG1LcTRTeUxXVHQyMmhxUWtMV1dRVlA1WUZx?=
 =?utf-8?B?WUdhd2R1elJ4dGEveTQ2STFDdUEvOG84Rm9uVEpnK0pmNWZjenRsRURJdU95?=
 =?utf-8?B?cDVEbnVZVEdiaGRCbHZ2M1BtMTlzWWZwbkNOREdNLy96OExlNFFGeVZnbGJv?=
 =?utf-8?B?bncwS09oU3ZvcjVsQzcxakcvZG9wNENWWHFmT0YxOWdxcHdBRU9WTXJ4L2Zi?=
 =?utf-8?B?TTJsck5CRXJIbnZzK3pQZ0RXM0Z1ZDRrcXVlN3Y3L3Ezbmx4ZmNuZWtwZEM5?=
 =?utf-8?B?NGpmMHB4bkwvYk9ielIyQUZrVVdrTVhTbTNjV2hQZTFXZXhPdGtBVXZrVy9K?=
 =?utf-8?B?REJwbS9NejN0aDAxYXRlR1IzMjlobGxLUjFYNUFuUjBqZElGMnMxMEM2bjFB?=
 =?utf-8?B?RjRyNHJFOEF4VHRBYU4zZTh5bk9QdWlEQzJyNzdRaVNHWG9OVEM4YjI4N2Vs?=
 =?utf-8?B?cjJxRjIwL2RUaW9BYmovbDFTa1JUSHNwaGd1Y3RmUnVZRU45WFdscHhPK3hR?=
 =?utf-8?B?emhxaW0wTXU3Y3o2aEdKTWNtTmJhZGMyNkdmRnJmQjIwQjZWTDRqcjhzZjJN?=
 =?utf-8?B?TFE4UGRIaE13ZzRQL1ZNVTlsQkp3bUZabDBmMkV0WDdZOEM4cndVWUtoM2Mw?=
 =?utf-8?B?cmxxQjBnemI5VzU5dGJFVlhGZXR3bjAyV0s1V2xpL055b3A3d3JjeWNtblNW?=
 =?utf-8?B?OXRqRW9MdTdSdS9jUGpoVks2QVJBdkFrb0ZlQTZ3ZjJOS1ZEUWFWSm5sWDJB?=
 =?utf-8?B?cWtPWlo4K0RyYjRVVGVXblJUbVZlOFVRUFRzaWE5MlB6RHMydko0eUpEdW5M?=
 =?utf-8?B?cTlEb1dxeitKRm5qbzhWV2hJYTN3dlppNS9Xcmx2Rk40eFhYZ0ZRcWwyUmpD?=
 =?utf-8?B?YTV2OSt6RnpNQU1MYlAwY1krTU80b1phSzAyanBKYkJSTlhSaUtMUmY2QVU5?=
 =?utf-8?B?YU1pNzZycElPVUdsK2FqMTRGZmhhYitFcnVLN2MwZ0JDT21VY3FHekNQNkRD?=
 =?utf-8?B?YVRjRjl6cE9iMGx1UXBqTi9KeWt3MVN0ZC9HS1JpV0FSeWdoWHZZbkVaNGdw?=
 =?utf-8?B?bmg2K0NoSHE3anEvemtGUzNaMGdQOGRCT0RhOXZLMzFqTktadVRBanpMOGNG?=
 =?utf-8?B?VmY1SythdllrTEljQm5SSjBCdzc0a3RlV3FFVDVYOWxicC92Q1ZWNGptWno3?=
 =?utf-8?B?bFl0Mk91ZVlkYlA2NGZRTmRvSGZ5bXFsTjgwdGZGUGFCdlNDOWpDUUtqRkF3?=
 =?utf-8?B?S2lLS1h6V0NhVloxUFpVTS9YdEJQakFwdTVzWkJXLytsRXNmWkNpaGlNbzdT?=
 =?utf-8?B?TmJzMGxCVUtwcjd0bHZ2aW8ybXpTY1REeGx1VzZEa3RMSDBib24rRXlSMVor?=
 =?utf-8?B?dUdJdGVlalpBMGtjSldraVF2ZHF0VzBkcWZWOU44NnFkMWZRWlZtR3ZaR2ZB?=
 =?utf-8?B?OEZycEs4KzBxMzVjVFc5L2NMeU1rYnRsdFBPMWxQT0xtVzJOTXh0Z2JIbU56?=
 =?utf-8?B?OUJHbEUwNlBkNm05SUQrMzBYUS9sUzZjb2VBeERLWFJlV3gxaDVNYy9Wd3Vn?=
 =?utf-8?B?ZEQ2V25raDZOcmVmSGg2UGE0cmVvSUJHUE84ZnMyVEZrVFpOOExjbndKeVl4?=
 =?utf-8?B?OGtyMzdzRFNydXh4MDErSElyVm9oa1ZUK2p6akM1QURaRkdsTE1XbXNvV2p6?=
 =?utf-8?B?OWgrM3libjE1QTRrOGVBdHI4bUtLNFN3dURySW8wUTg0SGFLVDg2Ukd0QkRK?=
 =?utf-8?B?ckd5U3dlYlRxV0J6RVRuVDF0QXZDbkd1Tm9nc1VjbFc1ejJNMHZ0SWJwNmdh?=
 =?utf-8?B?YnFjMUZTWmtqa2hIK215dzBpTHBGM3kzVkQ3U2NSS0ZuSm1XaXZpbzFNeFZY?=
 =?utf-8?B?ell3OExQVmVZTUdiazB4OUh6Z1Q0OFUyOUdwbEdPM2lIYnhUZG9RR0tySEll?=
 =?utf-8?B?OTIwV0htZWxiQW9xOFRYUDhLNUtRPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(7142099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: feBD9/EGt19kdX08uID0j6iKDfRPvrFB/vO8iDyklIUDV8EKsgaaKAO0/bPwf1/hnlTGV1+Thlt+uoxCk92yFLVnqxO43lnQa1SXGfuJzIXbpQ4PgAEWEILocO3I6b1qtQidbKWfSxkYcA1jL1/nHLSKP2hQnjlMvlytkhIk7AeWvd7NGfbFYgMvWKZxYWxXvYoSsHm2aoFq+JJguGJiRkTJ/9cKCQI9764x5Cb0cCNuN0tDGEaTeURDJ9Mm05XqpWxbDDMEjY25rm6z++9WIDU8vnmkpEPOUyqr8yLGzteZy4R9RuT6HRwXDPNlW1vfloAiAQ68vZTgyrtTQDcZhj3TKPJhJjiu9sCOcLd+6+yEB8kvphPYNFzFzpSmiN4XFMdNWbzreLFgXcl11zsIEppCymHz/ZYpXilInAP7qaIuoW6ciI95GeA9CCT8CPtB
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 10:20:49.6222 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae7e40b-8df6-4f11-7d55-08de63d71190
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5767
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Gwenael Treuveur <gwenael.treuveur@foss.st.com>,
 Nicolas Le Bayon <nicolas.le.bayon@st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
Subject: [Uboot-stm32] [PATCH 1/6] stm32mp: cmd_stm32key: add support of
	STM32MP21x SoC
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,foss.st.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st.com:email,st-md-mailman.stormreply.com:rdns];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8C430E4659
X-Rspamd-Action: no action

From: Thomas Bourgoin <thomas.bourgoin@foss.st.com>

Update stm32key to support stm32mp21 OTP mapping.
Create a new list of key to support the following differences :
  - STM32MP21x SoC support 128b and 25b FSBL encryption keys.
  - OEM-KEY1 and OEM-KEY2 used for authentication are in different OTP
    from MP25 and MP23.

stm32key is compatible with platform STM32MP2 (aarch64)
Hence, use unsigned long to handle argument addr of function
read_key_value() instead of u32.

Signed-off-by: Thomas Bourgoin <thomas.bourgoin@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/mach-stm32mp/cmd_stm32key.c | 97 ++++++++++++++++++++++++++++++++----
 1 file changed, 88 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c
index f1e0a3e817c..1ceb640e6b2 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32key.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32key.c
@@ -40,7 +40,7 @@ struct stm32key {
 	char *desc;
 	u16 start;
 	u8 size;
-	int (*post_process)(struct udevice *dev);
+	int (*post_process)(struct udevice *dev, const struct stm32key *key);
 };
 
 const struct stm32key stm32mp13_list[] = {
@@ -67,7 +67,56 @@ const struct stm32key stm32mp15_list[] = {
 	}
 };
 
-static int post_process_oem_key2(struct udevice *dev);
+static int post_process_oem_key2(struct udevice *dev, const struct stm32key *key);
+static int post_process_edmk_128b(struct udevice *dev, const struct stm32key *key);
+
+const struct stm32key stm32mp21_list[] = {
+	[STM32KEY_PKH] = {
+		.name = "OEM-KEY1",
+		.desc = "Hash of the 8 ECC Public Keys Hashes Table (ECDSA is the authentication algorithm) for FSBLA or M",
+		.start = 152,
+		.size = 8,
+	},
+	{
+		.name = "OEM-KEY2",
+		.desc = "Hash of the 8 ECC Public Keys Hashes Table (ECDSA is the authentication algorithm) for FSBLM",
+		.start = 160,
+		.size = 8,
+		.post_process = post_process_oem_key2,
+	},
+	{
+		.name = "FIP-EDMK",
+		.desc = "Encryption/Decryption Master Key for FIP",
+		.start = 260,
+		.size = 8,
+	},
+	{
+		.name = "EDMK1-128b",
+		.desc = "Encryption/Decryption Master 128b Key for FSBLA or M",
+		.start = 356,
+		.size = 4,
+		.post_process = post_process_edmk_128b,
+	},
+	{
+		.name = "EDMK1-256b",
+		.desc = "Encryption/Decryption Master 256b Key for FSBLA or M",
+		.start = 356,
+		.size = 8,
+	},
+	{
+		.name = "EDMK2-128b",
+		.desc = "Encryption/Decryption Master 128b Key for FSBLM",
+		.start = 348,
+		.size = 4,
+		.post_process = post_process_edmk_128b,
+	},
+	{
+		.name = "EDMK2-256b",
+		.desc = "Encryption/Decryption Master 256b Key for FSBLM",
+		.start = 348,
+		.size = 8,
+	},
+};
 
 const struct stm32key stm32mp2x_list[] = {
 	[STM32KEY_PKH] = {
@@ -171,8 +220,10 @@ static u8 get_key_nb(void)
 	if (IS_ENABLED(CONFIG_STM32MP15X))
 		return ARRAY_SIZE(stm32mp15_list);
 
-	if (IS_ENABLED(CONFIG_STM32MP21X) || IS_ENABLED(CONFIG_STM32MP23X) ||
-	    IS_ENABLED(CONFIG_STM32MP25X))
+	if (IS_ENABLED(CONFIG_STM32MP21X))
+		return ARRAY_SIZE(stm32mp21_list);
+
+	if (IS_ENABLED(CONFIG_STM32MP23X) || IS_ENABLED(CONFIG_STM32MP25X))
 		return ARRAY_SIZE(stm32mp2x_list);
 }
 
@@ -184,8 +235,10 @@ static const struct stm32key *get_key(u8 index)
 	if (IS_ENABLED(CONFIG_STM32MP15X))
 		return &stm32mp15_list[index];
 
-	if (IS_ENABLED(CONFIG_STM32MP21X) || IS_ENABLED(CONFIG_STM32MP23X) ||
-	    IS_ENABLED(CONFIG_STM32MP25X))
+	if (IS_ENABLED(CONFIG_STM32MP21X))
+		return &stm32mp21_list[index];
+
+	if (IS_ENABLED(CONFIG_STM32MP23X) || IS_ENABLED(CONFIG_STM32MP25X))
 		return &stm32mp2x_list[index];
 }
 
@@ -237,7 +290,8 @@ static void read_key_value(const struct stm32key *key, unsigned long addr)
 	}
 }
 
-static int read_key_otp(struct udevice *dev, const struct stm32key *key, bool print, bool *locked)
+static int read_key_otp(struct udevice *dev, const struct stm32key *key,
+			bool print, bool *locked)
 {
 	int i, word, ret;
 	int nb_invalid = 0, nb_zero = 0, nb_lock = 0, nb_lock_err = 0;
@@ -351,7 +405,7 @@ static int write_close_status(struct udevice *dev)
 	return 0;
 }
 
-static int post_process_oem_key2(struct udevice *dev)
+static int post_process_oem_key2(struct udevice *dev, const struct stm32key *key)
 {
 	int ret;
 	u32 val;
@@ -372,6 +426,31 @@ static int post_process_oem_key2(struct udevice *dev)
 	return 0;
 }
 
+static int post_process_edmk_128b(struct udevice *dev, const struct stm32key *key)
+{
+	int ret, word, start_otp;
+	u32 val;
+
+	start_otp = key->start + key->size;
+
+	/* On MP21, when using a 128bit key, program 0xffffffff and lock the unused OTPs. */
+	for (word = start_otp; word < (start_otp + 4); word++) {
+		val = GENMASK(31, 0);
+		ret = misc_write(dev, STM32_BSEC_OTP(word), &val, 4);
+		if (ret != 4)
+			log_warning("Fuse %s OTP padding %i failed, continue\n", key->name, word);
+
+		val = BSEC_LOCK_PERM;
+		ret = misc_write(dev, STM32_BSEC_LOCK(word), &val, 4);
+		if (ret != 4) {
+			log_err("Failed to lock unused OTP : %d\n", word);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static int fuse_key_value(struct udevice *dev, const struct stm32key *key, unsigned long addr,
 			  bool print)
 {
@@ -550,7 +629,7 @@ static int do_stm32key_fuse(struct cmd_tbl *cmdtp, int flag, int argc, char *con
 		return CMD_RET_FAILURE;
 
 	if (key->post_process) {
-		if (key->post_process(dev)) {
+		if (key->post_process(dev, key)) {
 			printf("Error: %s for post process\n", key->name);
 			return CMD_RET_FAILURE;
 		}

-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
