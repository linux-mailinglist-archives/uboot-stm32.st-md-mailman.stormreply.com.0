Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MO1nKgKmnWmgQwQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 14:22:10 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C4C187900
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 14:22:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA1C9C8F288;
	Tue, 24 Feb 2026 13:22:09 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013002.outbound.protection.outlook.com
 [40.107.162.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CEF74C8F287
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 13:22:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WlUQS6cWyHUvpffBDA33tQCcmkSnseQdwHOIUork9ui5fXpvnLoAFwJuvL3/RxL7nQAZPYtuwTHSQb2hTnaxGZsEQT7vv7PGOBrY5A3J+6VHor+qImTiTD9kfTlq2hE7yNUYwFfqD8Q/L7vB/LHFqZqqwgYJeQ/NuXYGL4TD27UrmE9DzyIVULuKjCSRqKCRjfVrFJM7irQ9cscWqnanGzFkU3Frh68mughvcrF1ynAHZAbNZ7xcT9l8uOWJN8RnJ+vNGbguLTZJeXZvJMjfQuL5MV3EwVh8prVtkvEJxXvMNvjYa4bba+KG8OhpuU8yIewvZX84SGYIax9rqqCIyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TU5eNOsRXEafq8tYJWMfAcrimH0EoAY97uaIjo486EE=;
 b=Vx0AVXKADZTRpo6UpifY6LkqHK4x4UNV1Qg77OlOrZf1JHGBJLUxkt/n99oD8H1p8RG5OmKA8BM5Ukxofx02EI9hN5hsHXLuR+9mWlYgAKZvvhfAtemctpRaaOR4B+dkoHP1PSatzPHfuXZHTHtMTrebRluzph9sjCsZYzQZc6vgXK1iJG1H/GwkaZudGwczGtcJf6459qMutRV4AUm2zGJorT25Qm4IGoA1psmhE5zKMlF7jKV8NG2YKjmrpsbio03bhvSP7vQI5r+ZiFzCAh7zwi5rxlGEuv/p+jucXCtv5A9LQp2Ro0hTBNDaHD8anVI8DatkJP5wWr3JA7XijA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TU5eNOsRXEafq8tYJWMfAcrimH0EoAY97uaIjo486EE=;
 b=O1ZWSQMO8ETPlmVif9ydwyxRTTecdQNOJ/II37umJBVLyvfEMW1KMKj/XC9KW9IPTw6w4X93s/fDkJGvztDYAd0zOniSvM9IIJZ87tEQBEzjM/w3UFwCBMW+I7xR4xvhOtT94fgvXDmMrC4LnYA8FvJHm+Ynac2nEmQS+UjoDFddK8wbKG2vaz5TSuBO0QLvWU9rok32bIhp+H1D690q4YEH0/bH9V79yEZ/PFpJahDPv1FBmj+qVSk5k4f+STofFKth7GVF9ynFQXM3Vq9R0qEp0GcL+WiNqEvTGbUdtHrfdFrf9/lRkWl3f/91+IO7FQFK9ALo+LPN46npvvY09A==
Received: from AS4P190CA0058.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:656::7)
 by PA4PR10MB5778.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:267::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 13:22:04 +0000
Received: from AM3PEPF0000A794.eurprd04.prod.outlook.com
 (2603:10a6:20b:656:cafe::6c) by AS4P190CA0058.outlook.office365.com
 (2603:10a6:20b:656::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 13:22:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM3PEPF0000A794.mail.protection.outlook.com (10.167.16.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 13:22:03 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 14:24:19 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 14:22:02 +0100
Message-ID: <ae32ab05-9573-42d7-b105-fc7282aa7860@foss.st.com>
Date: Tue, 24 Feb 2026 14:22:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260205-upstream_pinctrl_stm32_update-v1-0-3a3797af498d@foss.st.com>
 <20260205-upstream_pinctrl_stm32_update-v1-2-3a3797af498d@foss.st.com>
 <7180c899-fab2-486a-be1d-83deb800cba8@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <7180c899-fab2-486a-be1d-83deb800cba8@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A794:EE_|PA4PR10MB5778:EE_
X-MS-Office365-Filtering-Correlation-Id: a21ad308-5c0a-4eb2-f2d3-08de73a7b323
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WDJ1NkRKTUREUzlpeHA2cC9BOXZkYnhOL2ZKS1p1dzVxRGM0RjRxbzEzL054?=
 =?utf-8?B?TGwzRHl6Ym1sTDhEbk1Db05OV1IwTkRxbVVaZ0JqVWowOWNDdHVNMXgybFQr?=
 =?utf-8?B?VW1hL0NGd01JUENZV0cwSGJXWW1GajFvdDhXb3kzb0hLeXV4Rml3L283d3Ji?=
 =?utf-8?B?ZFdzdlJaZHRPK3FJbVYvTFprb1RRK0QzZitKRnBjdHNWNGlGU3pnWUZuOWVI?=
 =?utf-8?B?U2o3NkZFOVdGNjJ5eVFJMmRoUEE3NzkwYis2ZnQ3NWxTRTN5UVFzbFU2OTNL?=
 =?utf-8?B?eEVsa2d0bUNZNm1BSDQxOWpCS0RMODMxSTVybkVVU1pXMEpKekg1QnJqZmtX?=
 =?utf-8?B?dU85REhHOHRWVkpmNUlQbWNTcEtlOUY3MXZBbFdCUXp4T1pYWkhoQ1htYUlN?=
 =?utf-8?B?RWV5cTNCeGUwMjh1ZE9zTGh4dzhIRDBRdkxjTXdTdXZEK2ZUMVhtRnpaWDZI?=
 =?utf-8?B?VkJxamFqSE9tS3prYkJ0aDNjd1ZWV0FzUFdtSlNxQ2g2UWQ2T3pQTFkvdXUy?=
 =?utf-8?B?SXNUZEZ4Y29UZ2pFUXpmb21Ec0kxNUo3VkFnOXZ1RG1mSm82bkt4LzYzTEgv?=
 =?utf-8?B?cy9EK2U4VGZkUm1HOGdRTjRzUlhSQUE2WHZDYTVidk9UUy9sSTdkeGg1RFBq?=
 =?utf-8?B?UVNuU1BUWWx3b0JhdUl0SjdOR3pvSmkxMEc5NHFFNTJLUzIrckM5UTJNMnA1?=
 =?utf-8?B?aTNSeFZxNEQ0b3JCckx3TzNYMXFyQmV4NkF4MTdlMjBGc1ZnTU1QVGRzVWxS?=
 =?utf-8?B?U0tGclNkVG9qdDN3cFl1QnpvTHcyOUJwQVFGaysyT2tuWm9QY3g5ZVJFTmpO?=
 =?utf-8?B?aGFQSE9JdVRTaFlzRnMySHR6RU9sTExOTHhQclFOMHZzeXNBT2dXNURHRWNB?=
 =?utf-8?B?aGUvV1VuOXRxTHpVN1gyVnQwSHVneDZqV2FWMXpsWkhQaWpFOEcvc3BFazM1?=
 =?utf-8?B?TlRvWWdVd0lJdkpjUXByZitqamdSc3NyNjhpZWdCakVPNUljMjJ3ZzZFaU13?=
 =?utf-8?B?cXA4amFwRGpHcjlUS2xsQ1V1dzRIR1pGU1FISmozL1V1TkdnRUV4MDVIYW12?=
 =?utf-8?B?Q0RtMlNzdldNMGhDY2RyWHRMMzVNY3cwcGhBdXdnblBxZUhlcDZSNWR1dVov?=
 =?utf-8?B?QkFtV3hGKzdOUE5PSCtzOW8vWXFBMDRHV1l1RzhHRFZPcEZUekNUTkRNS1F6?=
 =?utf-8?B?amRLMjg1UnQ5M1VqK1JselUrM09jRkMvM2tML0g0MW5TR1o4N3Ayb2VnbHN1?=
 =?utf-8?B?UGRJcW9CRisvUXdydllSQVRYRzZVaUVuSFMraCsyZjVkcjBDRFJZRXBDK2E4?=
 =?utf-8?B?RmNMS2xFNjNWTFZZU1VFZ3lVRzE4OGM3S0E0SVRTN2MzSTZVaTN0UTllMzJ4?=
 =?utf-8?B?d0VzTXZnK0trRWxwUklESUVUKzNoaEVPUGJreEpBVStneFlEcVlzVmcyV2I4?=
 =?utf-8?B?OTZzUDlLcnl0NlZrSjhCa1VUejVMeXVPT1JmUlhHOVNTMHFJbEJ0bWFGVzdm?=
 =?utf-8?B?WFNDVUtTY3FtSDEvZjZ2OTA3SGc4a1dYbjZwdm5rSmZuajVsQzNaaVRWOXhC?=
 =?utf-8?B?ZllsZHZYRzI1d0dCSW8zWDd3OW5ucERES3lESUxqMDJkK2RCckVpKy83TDFk?=
 =?utf-8?B?SDBEdmR2TG5iRWZWTGEyM2xtWUJUOTNLUjFwT3NzeUY5SEFQUGc2UmFEaXpi?=
 =?utf-8?B?UDg2T2R5ZFk5RTYwbGtxajZrTC80UFovVHNQZTNuSWpOanYvcklrR3NJRGZj?=
 =?utf-8?B?SHl3aEEzMDZpVWQwRHQwckhlaW9BUGhIQmNoUktHdlYrdno3Y0srcG53TGFJ?=
 =?utf-8?B?WFR2dk1KYzNCUWRnRmM5WVRBaU1aWG9sOFFvano1UC9mTnVPYlZrS0g1ZUhC?=
 =?utf-8?B?eHlaYnpoamtmQWsrMzZlY0pjVURFWWJnR2gxM2EyZFB5bzFVc21JS2sxOUFM?=
 =?utf-8?B?T01FdStsaXJ1ZjM3UW5aeXJaRmlBRVYzNWpsTDZXb2E0MWM0N3N0MnR5M3Bv?=
 =?utf-8?B?VklHeGdSOTBlU21JbzgrNEQ4UytNMEd6TUZycUx2VWZvY3FVYk5hcEJ0OVRF?=
 =?utf-8?B?SlhQaWJ2emllNy9sdk5BeDZuanREYzN1bzhBOVFCaDVGa245cXBFOU0vaGly?=
 =?utf-8?B?UmxXSVkyYjRVdEQyT3Z6VnNnSUdUWi9FT09EK29hSTBaYXVJa1l5MFV2bjRS?=
 =?utf-8?B?NmJVS1dDSTJTY0wrRFhFY2dRYUcyVDA2Q2lZNDFKSlFpdFBpR0RLZy9FWTVr?=
 =?utf-8?B?dWxUa0hPSWUvT0hEZlJtZ2JENWl3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QNlYhxrt09a8ZFWtBfFEVX2flFVSk8wgTEMfRk/i16iVpcAaJ7+ABY2jk+xdKRfzRGsrQ1yMTavvftlinD7Uyfsndq0LCSdl/+8HecRs/gKLDkY0P/sblukv4l4ivZ9WxLBtt4SIRnxthUpNykXBSbEoCM/kFpfefCEoo7Qfz7GiLNMKw5+nxAZDyqRlCdjO3V/CP4pLLFkkYIVqSlGqOmHB6QahBejIanHKqBh4Sk/t1AfnO+TzB6VElvYRLEbcs0xKqRdgC6yvo9o778p9XZ2B/8nocpoyRGy2oQqKXst1R0Higs9piL+swfts0K0FgFLDgoO89qRU5nxLiEQzlnf8azkcA2iot7MvAVQATInq2TrTA2M0uyapnNEphFVWPNBmPm9mn9/hVW+xfY8FPsMeyi6D40uciYttxzmtmoWzNI/dPmttQCGcjxadDUJ8
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 13:22:03.4593 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a21ad308-5c0a-4eb2-f2d3-08de73a7b323
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A794.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5778
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 2/3] pinctrl: pinctrl_stm32: prevent the
 use of the secure protected pins
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
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:patrick.delaunay@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:valentin.caron@foss.st.com,m:fabien.dessenne@foss.st.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,foss.st.com:mid,st.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.185];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 55C4C187900
X-Rspamd-Action: no action

CgpPbiAyLzI0LzI2IDEwOjIzLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDIvNS8yNiAwOTowNywgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBGcm9tOiBGYWJpZW4gRGVz
c2VubmUgPGZhYmllbi5kZXNzZW5uZUBmb3NzLnN0LmNvbT4KPj4KPj4gVGhlIGhhcmR3YXJlIGRl
bmllcyBhbnkgYWNjZXNzIGZyb20gdGhlIFUtQm9vdCBub24tc2VjdXJlIHdvcmxkIHRvIHRoZQo+
PiBzZWN1cmUtcHJvdGVjdGVkIHBpbnMuIEhlbmNlLCBwcmV2ZW50IGFueSBkcml2ZXIgdG8gY29u
ZmlndXJlIHN1Y2ggYSBwaW4uCj4+IElkZW50aWZ5IHRoZSBzZWN1cmUgcGlucyB3aXRoICJOTyBB
Q0NFU1MiIHRocm91Z2ggdGhlICdwaW5tdXggc3RhdHVzIC1hJwo+PiBjb21tYW5kLgo+PiBVc2Ug
YSBkcml2ZXIgZGF0YSBzdHJ1Y3R1cmUgdG8gaWRlbnRpZnkgd2hpY2ggaGFyZHdhcmUgdmVyc2lv
bnMgc3VwcG9ydAo+PiB0aGlzIGZlYXR1cmUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEZhYmllbiBE
ZXNzZW5uZSA8ZmFiaWVuLmRlc3Nlbm5lQGZvc3Muc3QuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBQ
YXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+IMKg
IGRyaXZlcnMvcGluY3RybC9waW5jdHJsX3N0bTMyLmMgfCA4MyArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0tLS0tLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNzEgaW5zZXJ0aW9u
cygrKSwgMTIgZGVsZXRpb25zKC0pCj4+Cj4gCj4gCj4gUmV2aWV3ZWQtYnk6IFBhdHJpY2sgRGVs
YXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gCj4gVGhhbmtzCj4gUGF0cmlj
awo+IAoKQXBwbGllZCB0byB1LWJvb3Qtc3RtMzIvbWFzdGVyCgpUaGFua3MKUGF0cmljZQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBt
YWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1z
dG0zMgo=
