Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMYgDigngmnPPgMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 17:49:44 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 164ADDC426
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 17:49:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0D3BC87EC9;
	Tue,  3 Feb 2026 16:49:43 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010057.outbound.protection.outlook.com [52.101.69.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7B34C58D7A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 16:49:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TnsvuaJgcw3qJ2zv3oOi4V9w/uA0nbhKNJp7VaSVQgX60UvqPK/strKHJlVdV2y8vmJUN5eWQOy7h2iBJp9OBkxJH35wueI08r4IXQqSa76PuzBLx1/tpGgbB5e2i/V26ZYFUtnRrRDvki+U1M57cu8ue32sjAdSoIEQPpqTMffIr/xnjslxJDhtPGQblGuKy85JMWLaDTIZsFTjE5OIXiFltbqS7ZH7D7oNBSFFHx2bkg+tXgbuYMLaAOKVyuo3K5/0o+gN2Fhhjktj/nNF55Ol2ZV9OWrWBFxpiJxk6HmcHsLF1yl7KHhoOMrZ0rQ/hVFq6GdZsZlOrzZHes3wqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrj4Cct043ydOzs2AZvoQjZEU5fF5kDOraFlb+S9uIw=;
 b=pm45rRGzgyTZbhZ9lk0Yk3WtOx2VWi7gsh1W1lC58GKmdAxey//+gvJb2nk0mcN0ma5e8UOguE6qy/cDC55u9gJD6iJYSFkbRwEzOKiZOP/SAlVvbt8lpTqEzLrwXEBvlBqRvP68pLHjulfbXCnjEaivoT3hzRS5ajzpbjishC2aGtSBF7MUKHDoYmczrDCX7VQN3vekfBxutaVdDsryky98DH9VBkmUEIvg3IdOdD/m1kvFsv3JAZKg7IG2YQqN7VkbfubQkKV/l5pef9HVE46Ni96G3E2k4crIWERRwCkUaVRSV4Q/EFjdsmauWmJ9U3+G7goOdyWzUWaPf2SZ8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrj4Cct043ydOzs2AZvoQjZEU5fF5kDOraFlb+S9uIw=;
 b=BewFDYfzkFxezp0LNUJI7b+DpBfdjnTVwZP3yqJdpLUi8jr5p893TnHTcUg3brRsnEJf4TiDY+Z6hhhg8eieK6G+cNVmncT+fmn6lb60g0AOXi9/nm5sZ3dDbYcT2NVVjga6OFfkGQT0V8SAlWTzVSt0o1Srsk+lXBZow8Rt/RxPRZKrj05eLSSbrVgNGIygJk1xWaMpGuL3o8UtlVGFOobYOsALuhCiCb6yquQpGQ6d0dgx+/VH1NBHcoowItaGigUClOe8+rLlpFyoo8eh7HG+KjkiVvPaXu42XVSZyMwhj+IlV/RN2BuuUO3OhXtlsK9bCgqW1PF0e/1QOoAgNg==
Received: from DUZPR01CA0004.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::20) by AS8PR10MB7427.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5ab::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 16:49:39 +0000
Received: from DB3PEPF00008860.eurprd02.prod.outlook.com
 (2603:10a6:10:3c3:cafe::12) by DUZPR01CA0004.outlook.office365.com
 (2603:10a6:10:3c3::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 16:49:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB3PEPF00008860.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 16:49:39 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 3 Feb
 2026 17:51:17 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 3 Feb
 2026 17:49:38 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 3 Feb 2026 17:49:27 +0100
MIME-Version: 1.0
Message-ID: <20260203-upstream_add_stm32mp21_support-v1-7-48ca3409cce1@foss.st.com>
References: <20260203-upstream_add_stm32mp21_support-v1-0-48ca3409cce1@foss.st.com>
In-Reply-To: <20260203-upstream_add_stm32mp21_support-v1-0-48ca3409cce1@foss.st.com>
To: <u-boot@lists.denx.de>, <uboot-stm32@st-md-mailman.stormreply.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF00008860:EE_|AS8PR10MB7427:EE_
X-MS-Office365-Filtering-Correlation-Id: cdfc2172-5737-4166-8b4c-08de63443891
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHQ2ZnlMOGJueWxqLzBhdEg5MzVoNXRoTnZEalRLQVRNeUJkSmJIWHVYbFdK?=
 =?utf-8?B?UHFJWTNVa0I0QXRIRk12TEVsaDFickNSQzZzQ1J5WTlFT0VtaGhQRzhOeXRq?=
 =?utf-8?B?SGRyeDNDWWxMQlp1bG9vNDFOcTVxMXZ4c3Nzd24rV3U1QkhTeTVYQTNQYXU1?=
 =?utf-8?B?UkMxd2l6MTVTblBETStBWTZGUXNxSVlMTkpoaTFwMXZNVVFmSGpBb1ozd2lV?=
 =?utf-8?B?QzduditTM3NUekhRRGN3eDk0cVBXK01SZ1RUdkNENEgxMEJBRHZiZHliaFpB?=
 =?utf-8?B?djJ0bExiRTgrK3VuRUVLOTMyd3lnUnVwUkl3bjZjRlBVc0RwN2h6bkdEbzhh?=
 =?utf-8?B?Y2VtY25sTFdkUXF1UDhBTE5aTEJSNzBsdGIzMU9IR2Q3VlIybU1qSDlXUFI3?=
 =?utf-8?B?MXgySFJ1bTFLTitud2FkYk8xMnp4ZXJFSlIvQm9mL2VrS0xiOXhMSkxFNzFL?=
 =?utf-8?B?U2Z3azFWQUx2bW12bFFJazJTN3NHemx3L3FDTHVXZ0Q1RnduY2FoaE82SEtV?=
 =?utf-8?B?SmlGT0RiL3VDbzFSTVB1SjBUSWRIcGJpR0U1MTVJSDh5bUxOaTllRDZWdFRW?=
 =?utf-8?B?K1NaclVmOUE1ekk0bzI4enRhSWRBQlU2WkpINURwUTd6VVNXZXBmaEdJRmo3?=
 =?utf-8?B?KzgzNmJpMVplYi95UExmUStkVWRzUzhmdTQ2VHhEazE5Z2kxZTlURit6YTRD?=
 =?utf-8?B?R3gvUGUzUVBqNmlqNERucXprNG5vcGhFMzF3bFMvdHZCaWxtb3VwUmRLQ0xV?=
 =?utf-8?B?SnlOV1V5aG1DSm1nM05PRHUzNnZleFhrNW9rZmFGamN3UWpaL1RiWklvNlZ5?=
 =?utf-8?B?d2ZzZGZWN25HTzdVazlqcGRYK0Y1bUc2K0lwNzNyLzMwWUYxUWd6Nnl0Smtr?=
 =?utf-8?B?R1BSQUJWQmFlNkx0Z1hPcVBMb0JMdk10QXQycUNrK2lhbnhRR2xCaGxIZ080?=
 =?utf-8?B?UFVna3F1Q1l0YUYwdDY5b2ZxMis4aXQxdDhaL2lCSnAwYXh3Z0dwR0xTVFFP?=
 =?utf-8?B?c0pmVXBaZFJWMVlZMDFpNjNma2V1QmJzQXl4M0FiMENJZVdWRTErZmVIamRa?=
 =?utf-8?B?R3NRa3dZejNMQ2c3VWUweGdncmg5S21lMC8zQzRuN1pCclZ2UWgxb1NTQURY?=
 =?utf-8?B?NXVwTGhoUTdlK2lrQXp4cjU5bEpmOEtmYWM2blJKZjVlZzJVRkFyMnhOYXZx?=
 =?utf-8?B?dnZnSVNyMXE0cTAxZTNkL29tTStuaWsxUENrb3pBUm9USERaWnlKeGRySW41?=
 =?utf-8?B?N2txMTZvSWhBRDhtSm44eXZoaEQ5czFDMFVlM2NPS0pYaFJFUUJaVWNzWXEv?=
 =?utf-8?B?dmxmWXFQblZFUnBHTDljNHVaMFpaVldiN3MxampDbnI3OUVwNFFNc3JKVisr?=
 =?utf-8?B?T2h6WENFYU4rU2RpclFzSUpzNlEyaXJDN3Z4alNJZGh6RSs0OWhsTWhCYlg1?=
 =?utf-8?B?S0t3NXRiNENCY3prQTVKN0Y4cFB1VENyVGdGRWhOUDBaRERFbUY0WHMzQmZt?=
 =?utf-8?B?NzM1WkJmb1ZrWTNhNGRCbFhldGNxRjZWdHdaZ3MrUDlFakk5b1FybDFGa1FS?=
 =?utf-8?B?dFhEeTQxS1V5aHdTaWxzaE5HMUNtWUxCN1ZpQ0kwcDR6RFVBMmd6bjE2enVS?=
 =?utf-8?B?VWV1U29IV3ZoU294ZGFaSEk2SGozR1hVeVlzS0xkMUtyNXhNWlM3S0lvYWlF?=
 =?utf-8?B?YjdabFdzVkU4ZjRLZ3gyZldSeTUwUkJzeGJvTFd0Vk9wS3dYdzhOc1JCcUJz?=
 =?utf-8?B?bjhLOVR6Q2VrcHA4aVY0VUQ2MERZVW1rL0Z1aUx6UUJ4bnJvamladTVlTzhG?=
 =?utf-8?B?ekFuSWo1WHJuRkFXaUVGbGVtZWtvWUs3cVVnYVZoa3pFR3lLQno0bTRxNzdk?=
 =?utf-8?B?L1hQWHJ5eWFQWVN1R1dXSHlpNnByZ2kvaFhOZ3d6RVUrRUllaWFMc0VPbnhk?=
 =?utf-8?B?cUhsQTMxajYzN3dJVTJyTGFLOFlUejRwN29KSFAyMFY0Mm5nY0VyY1ZWSSt5?=
 =?utf-8?B?NWZ0dUZSbDkwOHphTkhSY3l2L1kxMkkyVmloOTQrdE1iejlUeGUvVEpQZGJz?=
 =?utf-8?B?VytuYXdkbzNWdVFFR0dpT0tsRzJmbDI4R2JPeHlmdGRLazJJNSsrS1BWSlRY?=
 =?utf-8?B?UWY5dGhjTzVGMURXcGdwbVFaVzRrbHkyRy9BSTRSNmhoQ29ublNPOUpIeTVY?=
 =?utf-8?B?VFFkL0MrNmVFaXBQSUpQSFg2MzJWdkNXK2FxZUYrTlNRL29KYXFnaGhxaCtC?=
 =?utf-8?Q?U3ztPnqT9Tilpj24+QGD5xq2SnkOOyKdP4Ixq4ZGh8=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: x3Qe+orqMkyIkJexZ5/OvHee6QZFsBJ81aE6lbhg7+ORzAYlc1NSsOWtZYE82ASSRwE+LhPmO/+n9HQbGxzY8YWom/PxLQ/5sCqS+mNn5zwdEDhjbm+PUD7y3ACoo0fcGZToI4XdspvfsTwSMwaTjeRbw5qLmdSaA8lC4D0HwWa8bB7Ws7HsNXZIQpVyAe/cg67BJ5TRqPN9Tf9lAAUx0Ctp7p/uEQI07bzSzBdSvibot6GQeGN6hi62g+jlO4tJyWGV4HyFIAD/siGIqnSIBAcb+RIWDbCGNWd5CTUecdHuwpdAIDyLZwUMBAsjgr7p/Y6Pu+cB9jlL25UsFuXRN7gyBUB/3LaOGGUax44oBF2+//G2dSJa8GdrwAC6Ti19D3uR/RQJdCbifELNWKtCuqKxgapW1M/4tR4c1Q+j20GwH9BHNQfc461iXIZnnw4b
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 16:49:39.0010 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdfc2172-5737-4166-8b4c-08de63443891
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7427
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Marek Vasut <marek.vasut@mailbox.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Cheick Traore <cheick.traore@foss.st.com>, Lukasz Majewski <lukma@denx.de>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Nicolas Le Bayon <nicolas.le.bayon@st.com>, Patrick
 Delaunay <patrick.delaunay@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [Uboot-stm32] [PATCH 7/7] ARM: dts: stm32: Add bootph-all in
 stm32mp215f-dk-u-boot.dtsi
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
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:trini@konsulko.com,m:valentin.caron@foss.st.com,m:dario.binacchi@amarulasolutions.com,m:michael@amarulasolutions.com,m:marek.vasut@mailbox.org,m:quentin.schulz@cherry.de,m:cheick.traore@foss.st.com,m:lukma@denx.de,m:gabriel.fernandez@foss.st.com,m:fabrice.gasnier@foss.st.com,m:nicolas.le.bayon@st.com,m:patrick.delaunay@foss.st.com,m:lionel.debieve@foss.st.com,m:gatien.chevallier@foss.st.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 164ADDC426
X-Rspamd-Action: no action

Add temporarily bootph-all property in usart2 and syscfg nodes
to allows stm32mp215f-dk board to boot.
When DT kernel series [1] will be merged and synchronized in U-Boot
this patch will be reverted.

[1] https://lore.kernel.org/linux-arm-kernel/20260203-upstream_uboot_properties-v6-0-0a2280e84d31@foss.st.com/

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/dts/stm32mp215f-dk-u-boot.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/dts/stm32mp215f-dk-u-boot.dtsi b/arch/arm/dts/stm32mp215f-dk-u-boot.dtsi
index e4b44af6df9..0046b22db7a 100644
--- a/arch/arm/dts/stm32mp215f-dk-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp215f-dk-u-boot.dtsi
@@ -9,3 +9,11 @@
 		u-boot,mmc-env-partition = "u-boot-env";
 	};
 };
+
+&syscfg {
+	bootph-all;
+};
+
+&usart2 {
+	bootph-all;
+};

-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
