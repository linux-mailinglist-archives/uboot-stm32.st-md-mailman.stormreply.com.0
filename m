Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EM3uLkemnWmgQwQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 14:23:19 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6228B187952
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 14:23:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F7E7C8F288;
	Tue, 24 Feb 2026 13:23:19 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011055.outbound.protection.outlook.com [52.101.70.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC38EC8F287
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 13:23:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YAMkymkf3AZHq8f0+wkB4A9KHVlfuUf7VwqCC2vjRd0MC3Hd0fEMYxXB7Ve3BjNBwbg7DKI2p3U8hsdIkcsrQdJSHB9Xp3l7fHBR403dCzmfn7Wy5KAzuoAiwYCAzR3jQ4GeObSjA3fBJ1Hzt4zzBJVAloMpor01gA70ypRknw/HeGNq8KujjxAYS2LGcKsYcHd5qjvDXZbaccZB8ytx2atDYGTvg5OTDE0U0hRGR8Q1XmFjBDCtzjM7jaQahAht9b2ym98rPaQxIBgE0ZWeLm/ethATvVplafLHoClGAls9iwA27QwUiGyL32nwACHvmHF9KQd0IX7Ni87p7audVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZsl9zHi9w02+yR3dqA9ldEvhS59aHtFz2pmPB8/NN8=;
 b=u+MhJXabxZcpzsDHo6KjvxyuvfYQvSMn1YBmRIxEOgHQ3ic3/C/7uXNwWPcCJyFWSMS3sFoTWe9B2zafTSlgL5EKu7Z4e6MMfxIX1eZ6qml3NBKbmMcbAsstho0t1bRS+5q+nWERvpX5KW8wZdfiBqcJ6afM0B6wUapC1F2Gutggi1AohzkhhDVSd0GT/n4J3IDsp9q8gQ1L7SImPH1JaKHXdHGq4kVtW+WJf27sy+gF1njjRMOBrPRz8/LzjQ6aLaWwsCrAGdNEDdWx+Q2zGX3+uq/vgVBaJs6uPxFV8/OZc9EZekSJGYYqvOcGy4xDl8QzRI7AwpPPfpU0mcAgMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZsl9zHi9w02+yR3dqA9ldEvhS59aHtFz2pmPB8/NN8=;
 b=newmT4tGmYku5HtLlobOvIkuwTc9+PlP5+Hr0UM/+PKMoF34yfs7XkLAoRyC5WCG8M8+BAKNxP3Jgmps3xqXLPlEUzvFusrhcg80/WVvc1IBECS7h+/vB2jBN3jbiq5pb3LM6ARF8tOhADsu/i8efFex/wyl/PGFlT01lNEI6623zMMYvDrHz6n4XniwbXKjL2vpVXXNR46pZlMf/OhncHmagInon5Ld2GLoBZOHYav9WXrqhBncimvllpQqf0ei1hqAPZlaDcKme8mqMut+5ppACJid1Dn6MopHFUK0Q26rLZWLobIh406iA/E29SejTod021NyHokHY5jHoRl3eg==
Received: from AS4P189CA0055.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::22)
 by FRWPR10MB9291.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:d10:184::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 13:23:15 +0000
Received: from AM3PEPF0000A78E.eurprd04.prod.outlook.com
 (2603:10a6:20b:659:cafe::11) by AS4P189CA0055.outlook.office365.com
 (2603:10a6:20b:659::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 13:23:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM3PEPF0000A78E.mail.protection.outlook.com (10.167.16.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 13:23:15 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 14:25:03 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 14:22:46 +0100
Message-ID: <ed28af54-f9e3-4127-a686-0c728ea83c03@foss.st.com>
Date: Tue, 24 Feb 2026 14:22:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260211-upstream_update_cmd_stboard-v1-0-63fd9b767bcc@foss.st.com>
 <20260211-upstream_update_cmd_stboard-v1-1-63fd9b767bcc@foss.st.com>
 <8890c780-53d8-4e43-a267-8215998f8b9b@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <8890c780-53d8-4e43-a267-8215998f8b9b@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A78E:EE_|FRWPR10MB9291:EE_
X-MS-Office365-Filtering-Correlation-Id: 02b80bca-5256-4760-5566-08de73a7ddfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SlcwU2t4RHQ5UWczNUlVSXlLcmljZXZFN012by9tMmVCSjZlRlNOWW01bUth?=
 =?utf-8?B?MjRGV3M0Z2dNOGV2VktUK2N0bmY2L1hZS1ArRFRkYUNkcHZ6TmVuUzB2RDll?=
 =?utf-8?B?V0dGNXhQdUsrd1RnSXZqekVSVFAwQk55b2FYMEd0MTRkb1pDK1lvU3h3TU1J?=
 =?utf-8?B?Y0pGTXhQL3V6VnlxTkl1azhDcXpkdTZUWmVYNTV4YnQwTElQOG5YV2pnZWp0?=
 =?utf-8?B?blZkQWxyam4zVjZEZzVrQlZwU25qS1B6RVF5Ym11QWF0R2YveEZvTjBIL1Rl?=
 =?utf-8?B?NlVxYnhpcDZqdDhrZWVUQUdZNlNPRGtBTGkxRm10NXRBVTNFU2dSd00xSE9s?=
 =?utf-8?B?Mzd4N20vNVE1VXNmbkNDcnI0MTdFVzVpSXZ0NkNMSGxVWFowTUVZWGN3QTM0?=
 =?utf-8?B?WGd2MXhuL3hXY0RIaS9WcFBnVWFRMHJjUUdtWEI0U3JBVHhzUGpNVEtnbWJJ?=
 =?utf-8?B?djNIZXVLMU1iSWNIK0YwNlNXMUZxa0hZUjEwZE5QbG9jY2FxT0ZoalhCWVpN?=
 =?utf-8?B?VEt1UEdtTzlWSktMRy84bFZIVXF3ZVVCcjNwZEdlSnp0L1NRNEtQQXlRbWlW?=
 =?utf-8?B?djBuVVNkRWJTY3FTT3BtNTQvcjBMQ241cmxHeUVqMmFuNmw1RDI2UFBvazB6?=
 =?utf-8?B?K0RVdDVkRzEvOTFzMVRCMDk1d2Q3dWFlZVJ5RHpHUWROa1dzaUN1OVZwa05s?=
 =?utf-8?B?a2FxRDBOeWNaRzh5V3R4OVZWZ3d0K0poaTN0SUszY2l0M0dXSkpjdmJ3L2pK?=
 =?utf-8?B?TVoxYjFtK3NheFJNQWRjSmVoZmJZang1dWtuRHZieSswYVFFVncrcWY2NkR0?=
 =?utf-8?B?WFFiV1dOa2tUVytvTGRCcTBFMzB1QkkrZGZLN0xaYnY2elpOSURieVdIamxH?=
 =?utf-8?B?Z1V2Mm9DSVIzRnYrZ1BFZ093MTFFQlFRL2lhVWFVQkRUaHo0d1lzVDhqRjYy?=
 =?utf-8?B?RzZRcWZHeTM5RlFnMUJpK0NwUldiYVkzWFV5R29UK2Z0cndyYlBrRjZ4V1E3?=
 =?utf-8?B?bmlneXZQU3NmY0hwQm5LSy83S0hnaDNZNktJZnZZL2g4WnFWTXV4ZnNlSlN2?=
 =?utf-8?B?ellhNkZ4eFlqY3ZDMHE4OXVJMTl4QTNNSUIwSWIxMDBCWEhWWTEzaXlRWDNJ?=
 =?utf-8?B?OWZpLzVCOEVLYmhmSjNvVCsxQTlpcUp2NGRqUUJJZlgyblkyQ29kZXF5aEt6?=
 =?utf-8?B?bTFTQ2FNNlR2RERwMU1pNkV1OFNCeHVCWlVJbzVvK1kwdUJNRkxUeDZSWXl5?=
 =?utf-8?B?REVMeWFySkJWMXdINWRFK2FyNzV4Kzc3SDlXaGRjSXBrYUxTVlpWWkVoRHR5?=
 =?utf-8?B?V2lFMGdiQUZia0NxdG4yUFZ4NmF5NEJkL1pCbThIRGJyTkhCNEVlekVlYisy?=
 =?utf-8?B?K3RXMlNpTVI0NEpSR1hnVGNIWHpRMHZ2dm9yYkw5eVZmdzR1VzZUVjlVdTRo?=
 =?utf-8?B?TjBYaXhwM1ZHTUVmbTFsN3R1K1dJczE0cG4xc3VJcTdSV3JDVG1qTGhzNGw1?=
 =?utf-8?B?ak1TT0xjWE1nb0JwUTRHQWRNelJVZVNmR1JFMzFQODMxZG9UUWtveng5RDRU?=
 =?utf-8?B?Zkl3a1ppR1RDNG1XUk13Mno4T21JUFNrTVhDeXRFNkplaUVmY2RuajNZREdX?=
 =?utf-8?B?NFdYSTR5ekk0ZktoQk5zdUlYVDYvSkNzQzg4SDdsT1dLOG9ndFAyWTJpVi9E?=
 =?utf-8?B?aGRoL2tvTld5djNCRitRNVVENlZCTEkrWUNsRGlVZjU0NVpLclJHM3pQZksw?=
 =?utf-8?B?RFUvN1JXOTVyaCtNOTNtaFNoNUdyL1FlRmt6QjZMblo5THd2bzFLaTFRT2Va?=
 =?utf-8?B?dkFwTE1UTDJyQXQwUlA4c1RyamY1Wko4bzJydHdlVnlhZmpOckRnOFNXT0lw?=
 =?utf-8?B?ZFpaTUVwR0plKzZoV2hXTjFaTk8wdTJpelZnUmpkOG9LNmV5c2RQN04ra1dU?=
 =?utf-8?B?N3BMankwTUFLZDR5VmJYNWpGWnpZRFNQTldzWGhmN1JVdUR5NGw2L1ZYTU9R?=
 =?utf-8?B?aGNUemZYbUZlMFpINWpZempLTElrSVVvUkdxYWRTMXRkYTJzcTZzVWRFNGJZ?=
 =?utf-8?B?eWsrbW1uZlBjMXV3dWd5eEFJSmJ6ZU5JQmsySHpUdUp2TTJkTWhoSFBHbWdF?=
 =?utf-8?B?MGw1cjd5Q2tKVHM2R0o2V2RvSVp2MFJSWFA4NTl4NCtDU3FVZUF3Y3R3Yi9Z?=
 =?utf-8?B?Qnh4b1pUbFU5R3NkUFlqaHUyQ2xBUzVzaVF5c3dZdHhHZ0NkRGVTZm9vRWJ3?=
 =?utf-8?B?MlhUVlVqWWtieElpMW5ja3o4MFd3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZgG1OL8f/82m3NZ2sMm8La7kc4/ah3GdMw/DTkdhIs1VvGy4d963L9nANCkEiwHOJwMV4guAtvh8guLbi+AXjiIrK7JjgsnqIwVh2qzD+t+A+VsE4zDnvxSg6IeTHYKOwCzVhgURXiZk2/3ODN7taD+yASxtDesSXOMyJDTVLKoF/8Ny9pRfTGD90woJC7PxYTpwD/3rUx7jcvNA5uWFZ02uwu47gztCXmwsmCQdFzMdbdO/9DaoDPy90QwYUX9KhfQrzyel2eKlupPhN1gB1lJ33qKqihPVROUFpPfwZ+oxtjAK3Y2CKMWsZvyCy0ER6g4Ng7jR54uq/TbHalfNcC0gnfjW7snArtNpFcPqLREeW0+7RAlDbLsszGr6SyEUp2Niir8FUNcwvybsB5quhafCu6cWFmupTZB4XXCqNnc84amtJg76tTK6pD8rQzFU
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 13:23:15.3210 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02b80bca-5256-4760-5566-08de73a7ddfa
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR10MB9291
Cc: Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] board: st: common: Add support of
 stm32mp21xx-dk board
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
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,st.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:patrick.delaunay@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.337];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6228B187952
X-Rspamd-Action: no action

CgpPbiAyLzI0LzI2IDExOjM0LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDIvMTEvMjYgMTU6MzIsIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gQWRkIGJvYXJkIGlkZW50
aWZpZXIgZm9yIFNUTTMyTVAyMSBkaXNjb3ZlcnkgYm9hcmQgPSBNQjIwNTkuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+
PiAtLS0KPj4gwqAgYm9hcmQvc3QvY29tbW9uL2NtZF9zdGJvYXJkLmMgfCAxICsKPj4gwqAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9ib2FyZC9zdC9j
b21tb24vY21kX3N0Ym9hcmQuYyBiL2JvYXJkL3N0L2NvbW1vbi9jbWRfc3Rib2FyZC5jCj4+IGlu
ZGV4IGI5ZDBhYmRiYTdkLi5kNzcwNDY0OTlhMCAxMDA2NDQKPj4gLS0tIGEvYm9hcmQvc3QvY29t
bW9uL2NtZF9zdGJvYXJkLmMKPj4gKysrIGIvYm9hcmQvc3QvY29tbW9uL2NtZF9zdGJvYXJkLmMK
Pj4gQEAgLTUxLDYgKzUxLDcgQEAgc3RhdGljIGJvb2wgY2hlY2tfc3Rib2FyZCh1MTYgYm9hcmQp
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAweDE2MDUsIC8qIHN0bTMybXAyNXh4LWRrICovCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCAweDE2MzUsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAweDE5MzYsIC8q
IHN0bTMybXAyNXh4LWV2MSAqLwo+PiArwqDCoMKgwqDCoMKgwqAgMHgyMDU5LCAvKiBzdG0zMm1w
MjF4eC1kayAqLwo+PiDCoMKgwqDCoMKgIH07Cj4+IMKgIMKgwqDCoMKgwqAgZm9yIChpID0gMDsg
aSA8IEFSUkFZX1NJWkUoc3RfYm9hcmRfaWQpOyBpKyspCj4+Cj4gCj4gCj4gUmV2aWV3ZWQtYnk6
IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gCj4gVGhh
bmtzCj4gUGF0cmljawo+IApBcHBsaWVkIHRvIHUtYm9vdC1zdG0zMi9tYXN0ZXIKClRoYW5rcwpQ
YXRyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVi
b290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL3Vib290LXN0bTMyCg==
