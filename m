Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eErYCpXVnWk0SQQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 17:45:09 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C224D189FD0
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 17:45:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5832BC8F28A;
	Tue, 24 Feb 2026 16:45:08 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012014.outbound.protection.outlook.com [52.101.66.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD7C4C8F289
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 16:45:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mnkFMfC92gzxBo3t0DdWFu5fh0N4k9gcKvKlr9smGy/KenCVlr5pbXTVxYl5pYZlZs0cc0h+XgZBrEckLUfG5tBhwMGB1DcS2LnQCcfnSXH7HwWrwgY7GGhhuszML9vc54myN6oQNB2AKedDcncRa3hbIN1t6iFAlUiO12H8GNztpznGZQwlL9CAl4pueB3Vvj1RE7vfFS9Q+LqahPkKm7EvwIeGu7rVB3xBe3SveUp/LoOME+ckkFPALQ0OwbXq3L1d1jCCIXmXz45MiFKdaZ2Qe10JPd2B/rOD40GyHWtGCrj2nRaErZS64TCtH3PWlnVfHdA81+czyKhrhP6vbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EnvQeaBrUV8ujfYczlCwB291dQfkDJ9w/AEqRhHEpuk=;
 b=JUpUY57TpZGKvzMMaV51YxZOjQhAcmph7lIhHKqgMDsMJ4WlvGvaG1SzElaCLZZJgK0LZCNr2u8J7AL2/EjS/Afp3gR00hqWLDB3Bm1+Zp363cOXp0nGZHLTJTWxaCpfXvWoMYFQBXvSKEPlUDcsKOsVDfQGVFH94Vu+CBRvZoFQZYjES0p/gg5yUH+llXraN1uX4AVoD5CK/T9uhRcj8RwH10+oSM4frMCO9Lw5vJyIJVFupZ3Y9VR0wHpJSlXoHHeRAa/x38bHTtducD3tftvNVxo30ielGk14EMqfv2gNLqjuMllcOlthoQzZgcaJWkfOdDmMXjiyti4PcHqADg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EnvQeaBrUV8ujfYczlCwB291dQfkDJ9w/AEqRhHEpuk=;
 b=mCGULqggpE+LXg8gJvM8o5Up5/Aa/bJbKz9PxR6H7CL3vF+v6d5q3A0nGadSt4bhgWJ5Q2TEBhB+Of5K0dh1UMERE6jSiucQby08rzzYaUJ2DOgI/GilimjucxTuibnDEu2aMbFUDneJNLwkNSiTFA4pw8faRyEGWs6fbkpFeRtciHooWePrYtIQ19Jvc1aSwe1Xf+yzdWVwyxOGsFQJgn489x9ZNRCvYIypNClInckK3H7TGUyZKBJ95agvhQUOUvOR4WzwszLc83sSrjO7GaYNGUCl2wfPfO1cH1SMrk7m0AIkAkV0kSAd/YyB8lwGWnatBvUjk1XGUqe22rCY6g==
Received: from DU7P195CA0027.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::20)
 by PAWPR10MB7366.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2e2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 16:45:02 +0000
Received: from DU6PEPF0000A7E1.eurprd02.prod.outlook.com
 (2603:10a6:10:54d:cafe::54) by DU7P195CA0027.outlook.office365.com
 (2603:10a6:10:54d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 16:44:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000A7E1.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 16:45:01 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 17:47:07 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 17:44:49 +0100
Message-ID: <5a0dc899-7d6b-4b65-9343-5631ceb4e303@foss.st.com>
Date: Tue, 24 Feb 2026 17:44:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260204-upstream_factorize_and_update_read_idc-v2-0-7f0baa41d2f1@foss.st.com>
 <20260204-upstream_factorize_and_update_read_idc-v2-3-7f0baa41d2f1@foss.st.com>
 <584c4aa5-e7b9-4c90-8cc1-7c4f7c3477e9@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <584c4aa5-e7b9-4c90-8cc1-7c4f7c3477e9@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E1:EE_|PAWPR10MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: 88d1358f-551f-4712-7924-08de73c40e12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlRvV0EybHhRdFJkenk1eDFNM25iSTdhY1hPYjlxbklObGZmcloyQ25oTHZF?=
 =?utf-8?B?TElVRjlrcnNmQnh5KzhaektIcldGSGdXZGJPNnRrOWVGdy9jS1F0MERReEpD?=
 =?utf-8?B?a0xoWW8wd0JaUElKak9jZWlXMy94b2xieExTZ0pndWlPVlQ4aWU0a3ovWk5T?=
 =?utf-8?B?aTJjcFY3RUEyNkZpemxac3BZWXlQT2dNK0tzc3VDWnE5V3VPY2NTR0pBSi9z?=
 =?utf-8?B?Y2xDekdNdDlrbVVXdks0aXpML1BHaFFwbFJDcm1qelQ5ZVIrd0xnTG5KRWwv?=
 =?utf-8?B?VDRmZ1ZXRXpxa1c0YUg5SWM4TDdXbEtpQ2tZditNVlBwM2M2U0RISmlkRXQ4?=
 =?utf-8?B?TThHVTJSUWQ0aGV5bGF0eGsvTUxnMS9tSGYweVZKMkc0MUFuQlhWWUp5STRq?=
 =?utf-8?B?SU9hMStqTGNoTXRiK2I0MldkMDJYZldpa3h5N0RaeUQ4UW9HdlRqWmpZRGV2?=
 =?utf-8?B?OXFDWGpyN1hPOVJhVjVIZ0szSVlIN3ozcytDMjEwaGpsNSthd0RGTktDajNt?=
 =?utf-8?B?YVk4Y0VndTlVcmtQUWpQVXRSZFY5aFA0ZVVKRUNUYndlbjNaRlJ5MlE5Z0gy?=
 =?utf-8?B?YTRZNjN0UU9ZbFNzbVI4TXpLdVhQZ2RoQzNiblJ3anZqMENwTEtRczcrY1dY?=
 =?utf-8?B?Ti9tZkpobStVZ1pMMXIySUhhL0hsWU82Q3BZNnZiSFVaajhLU3BkWWhIdm52?=
 =?utf-8?B?WjhZTXR3M0MyLzFTMGsycW1rQzJzTDM1MDJVbEV1S0VJZUIxcTA5SWUxVUJv?=
 =?utf-8?B?cjdJanQxUk5JWVU3a2Z5MWxQOFA4MkYvcnlTcmc3UEIrR0hmZlRmcDUvOGhF?=
 =?utf-8?B?WmNZcnFFNEI0ZHpZcWVlREo3MjB4Y2tNT2NlKytNTUdwd2dzbDhTcXg0QXBt?=
 =?utf-8?B?UDFJT25YbnhBTTdBZXJaSmtreGNzT25XUW0wUUs5YS92dGRhbXU0UkxNSUNY?=
 =?utf-8?B?ZW9FNHAyc1BYK2NzM3UzK2hLdjNwamFQN0VaNzVGUFhmTUo4RkRhZnFZeUQ3?=
 =?utf-8?B?S25jSndFbVZmeGFraUhJYmhyRUNmbHJWUzQxUVlhWGxLc3V4ejRnemd2Umt5?=
 =?utf-8?B?dDh6NjRvaGlxSTZKQTQvell6cDVyTnRLNGJTSFl3aklkN09BUkZ6c2xxMmpT?=
 =?utf-8?B?QVN0cFdBV0hyaDlwN05GRlNqb2NWL1VESHJUSmwvTlBZdGRZYTRyVFZkSWJ0?=
 =?utf-8?B?T2tJODlsa3h1WldJK2NrSmJtL3lnb2VrT3B3OW9jbDUycm04VDhWQzUvR2VM?=
 =?utf-8?B?cll1dmx3b0FSK2s2U1pHckJYV05qNHRxZXdBWG9aQzVHMmZRZFF0clhIM0tG?=
 =?utf-8?B?S0NHTElsVTA2VnBPd0I2bDlId2FFRTVPWnNsMlBKbktjME92NzNkb1lKK3Za?=
 =?utf-8?B?L2N4UEIyckV2TktBMVgzcng4dUlrZmNiZFZob1FkYTNkNjBIL0J3L0E4cU5E?=
 =?utf-8?B?MUdoYzBNazNwd3RvcHJhcGxzU0Q1bmh1aldiSEVkVUNqcnhCYUJEYkRZelov?=
 =?utf-8?B?czZMWUw1RFlpTW9iTEhjejhOL2pyUWVVV1ZvN0dueG1jTlNOeTByd0FCNDdD?=
 =?utf-8?B?UVFyWndFT25FelVUMkEzY1JvTllBaDZWMlFmUUhLd0d1VlZWb1ZhNlowSC9k?=
 =?utf-8?B?NlZyZGY2WkNGdnVHZ2NqaVNjaFFDd2Q5UEV2Nmt0YXhSUFJjKytaL2NFUnow?=
 =?utf-8?B?TmxnenM2NDFpMG1xS3IrVHFJalR4dHp1ekdFekdhZ085eXJmYk5TbUcyTCt0?=
 =?utf-8?B?UzhLK1ZFV1ZNai9TUk8rTzMzNEs5K056SnhjcEJwM1d6M0ZlSFVUemM0VTJY?=
 =?utf-8?B?OERFMjhBR3lTQ211NDhBVWNyT3dVd3B2NCtkaERnN3ZvVnpYVjZkc3RlTlZO?=
 =?utf-8?B?SXoweGtJOWt3dFdHYzZPQmtWT2NOczBtNUVuTStqSlJrZVVEOGtwTjdaeHN4?=
 =?utf-8?B?ZGRBMmMxN1BINmpVK2ZWLzJHRUtXekdRNFlybi9rOExNbERMTURqdXYyVnU2?=
 =?utf-8?B?YVlEOUV0MVFGYUY0VXF1TS9aaFhvdFprdkk3VmFzOGxKY1FZNFd6UmlYVitZ?=
 =?utf-8?B?VFlDM3BiRUZGRmlrWkxhVFFpOUdMN2VFTE9FZGdtNWFDRjFId245ckdMTEJ2?=
 =?utf-8?B?RkRCL3I5WmMxbFMzSmZKbHpnQXRVWVJBcG1qKzZmQ2E5SmhIZEQ3VnVxekY3?=
 =?utf-8?B?OGRxc3NnQndFa0lRRDQyWHIxejVTaWtKOU9YQmdXc0lqMVVrY3VySjhNZXBt?=
 =?utf-8?B?SHhVdG5vNmJqYmVyWXJGVzNFZmFRPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: GXIeewwf2cM/HjQEXtSCQddya/L4V6DR3n58Rksn90vMdgrxUYP7xKLTTLQp/UYGyS/xoFuQ+92FodaAfIXsXboOtovQdLX7ip5HgMSEl21kClxAvOr1i2+bNuUYTduCvJNpTD3ANM0WKQ/AsirchHKGAEcq9XA0O7sZdY3cTx9uTUqPrYj4rKrrvCv7LDnJMYvvcwV7QtiAWCAyMn5qpS/0g/qnO46jOUB9Pc8WMZAEa8384qftb8UnoJFWoRLkatrvW4iukWrxY/aM+1Kmt7/85z5xstEF8Ufp1XyZph8DuySAth+y3bnsEBkr+5Ig1BrRXSq4KKiOf88rmcTllbnWZQ7Vkn5RycqpkwsMg5yb0esHnBWgAcbL0hVEPCdHMD3pjjTBvjZ/1Copg8NLbD4zbOXsVllXKAamlOvsReW7GwR1F8Pna1acO8Ui8cT0
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 16:45:01.8860 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d1358f-551f-4712-7924-08de73c40e12
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7366
Cc: Marek Vasut <marek.vasut@mailbox.org>, Tom Rini <trini@konsulko.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Asadeds <md.asadullah@eds-india.com>
Subject: Re: [Uboot-stm32] [PATCH v2 3/3] stm32mp1: Add check on
 syscon_get_first_range() return value
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.99 / 15.00];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:patrick.delaunay@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:marek.vasut@mailbox.org,m:trini@konsulko.com,m:gatien.chevallier@foss.st.com,m:md.asadullah@eds-india.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,foss.st.com:mid,st-md-mailman.stormreply.com:rdns];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.290];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C224D189FD0
X-Rspamd-Action: no action

CgpPbiAyLzI0LzI2IDEzOjU2LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDIvNC8yNiAxMToxNiwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBzeXNjb25fZ2V0X2ZpcnN0
X3JhbmdlKCkncyByZXR1cm4gdmFsdWUgaXMgdXNlZCBhcyBiYXNlIGFkZHJlc3MgdG8gcGVyZm9y
bQo+PiBhIHJlYWQsIHdpdGhvdXQgYW55IGNoZWNrcy4KPj4gSW4gY2FzZSBzdG1wMzJtcF9zeXNj
b24gaXMgbm90IGJpbmRlZCwgc3lzY29uX2dldF9maXJzdF9yYW5nZSgpIHJldHVybnMKPj4gLUVO
T0RFViB3aGljaCBsZWFkcyB0byBhICJTeW5jaHJvbm91cyBhYm9ydCIuCj4+Cj4+IEFkZCBzeXNj
b25fZ2V0X2ZpcnN0X3JhbmdlKCkgY2hlY2sgb24gcmV0dXJuIHZhbHVlLgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4g
LS0tCj4+IMKgIGFyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMS9zdG0zMm1wMTN4LmMgfCA3
ICsrKysrKysKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N0bTMybXAxL3N0bTMybXAxM3guYyBiL2Fy
Y2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMS9zdG0zMm1wMTN4LmMKPj4gaW5kZXggNzliMmYy
ZDBiYmEuLjZkMmQ2OWYzNDQyIDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybS9tYWNoLXN0bTMybXAv
c3RtMzJtcDEvc3RtMzJtcDEzeC5jCj4+ICsrKyBiL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0z
Mm1wMS9zdG0zMm1wMTN4LmMKPj4gQEAgLTE3LDYgKzE3LDcgQEAKPj4gwqAgI2luY2x1ZGUgPGRt
L2RldmljZS5oPgo+PiDCoCAjaW5jbHVkZSA8ZG0vdWNsYXNzLmg+Cj4+IMKgICNpbmNsdWRlIDxs
aW51eC9iaXRmaWVsZC5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L2Vyci5oPgo+PiDCoCAjaW5jbHVk
ZSA8bWFsbG9jLmg+Cj4+IMKgIMKgIC8qIFJDQyByZWdpc3RlciAqLwo+PiBAQCAtMjMxLDYgKzIz
MiwxMiBAQCBzdGF0aWMgdTMyIHJlYWRfaWRjKHZvaWQpCj4+IMKgIHsKPj4gwqDCoMKgwqDCoCB2
b2lkICpzeXNjZmcgPSBzeXNjb25fZ2V0X2ZpcnN0X3JhbmdlKFNUTTMyTVBfU1lTQ09OX1NZU0NG
Ryk7Cj4+IMKgICvCoMKgwqAgaWYgKElTX0VSUihzeXNjZmcpKSB7Cj4+ICvCoMKgwqDCoMKgwqDC
oCBwcl9lcnIoIkVycm9yLCBjYW4ndCBnZXQgU1lTQ09OIHJhbmdlICglbGQpXG4iLCBQVFJfRVJS
KHN5c2NmZykpOwo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gUFRSX0VSUihzeXNjZmcp
Owo+PiArwqDCoMKgIH0KPj4gKwo+PiDCoMKgwqDCoMKgIHJldHVybiByZWFkbChzeXNjZmcgKyBT
WVNDRkdfSURDX09GRlNFVCk7Cj4+IMKgIH0KPj4gwqAKPiAKPiAKPiBSZXZpZXdlZC1ieTogUGF0
cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPiAKPiBUaGFua3MK
PiBQYXRyaWNrCj4gCj4gCgpBcHBsaWVkIHRvIHUtYm9vdC1zdG0zMi9tYXN0ZXIKClRoYW5rcwpQ
YXRyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVi
b290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL3Vib290LXN0bTMyCg==
