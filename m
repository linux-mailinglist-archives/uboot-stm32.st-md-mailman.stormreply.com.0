Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HIeBycngmnPPgMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 17:49:43 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE544DC417
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 17:49:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF554C58D7A;
	Tue,  3 Feb 2026 16:49:42 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013036.outbound.protection.outlook.com
 [52.101.83.36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DFE1C87EC6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 16:49:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ipZ9iu+F6jwFiKPTw+VVWEEl6yEMwV03HIfOyWEf1kl5qBuYtxKeRqBziAUzMPrGcWcyXRM9yQmHTD3E53k/RnHvMPeGBoKjd/g+Vrev56aX15at+t9sEa6VXx/lifUA4xv5TJVWaaXQFlyQSQUAMf0U86vQg+eOB65LYu/6bCcxuZtV8w03mXAL2rE9iC0cy/xbL9U8Flg9/XEhIOFghUXvnPtFiXjBTMvMT6IEC88EkXWFLcZqQQJdmZI4itaKIuVODMTZhpj9B+OXDUk1TUr4AsEtAfvKFLhtqEAeMeVRVMiJGuO4E4D2GCUnM4thVKKZMtmcugI/8uFUKiROXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zs1/pL0ez70gareasprsVUqHP6fekNG1nJTAYQZUGu0=;
 b=tadzqTTIuDmVC/FxWS83qeiMRUHBoK2S615xrT5RG8xsQ+D/JXli0hlhkKyOStu71s5I+KYHmrJUWCZxOagb9nTCJVuYCkLFTAOZ7sTuNEMp7Emkd0gDvgIN8dnfIUyZ4BHuTwq61bXJk3AwyTgHJLN5tmduGRAyidcB4YQNyFcJGH6mBb8/RgoxkRA/Gzjf6dbesdIaR5/G9GyZgPhB+jTVaI0rjbYNWSY+uneNlfBHXkZnAmBP+o4zHvbJkbWslhR48J7GNSB2qXY/55fBz76zbVpy5E6aT4mReQEKIY6ZrvDwUfVsOw2sKGas7sIwNabV0taG/Ho4VWC6ss/C5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zs1/pL0ez70gareasprsVUqHP6fekNG1nJTAYQZUGu0=;
 b=Np/PRRuHUHsHjLYQHxp1cVhG0XQtXeNcO2ndiHYSfIyc5k/+a25JkTnu4BVA+6aBNqm2SvMgTc8I535OXEVGYCyYDQptVa6vE8dLJ4opEvXhf+u2bM2NrMewMn6aQBrY7aaZY4iLPg3WCDSjdgITfQKVr3fd86+Htls+Xla/qBhvMbGJYQeydQwsK1VkRNgppmb//3uo+9KY24ZF2V/02RT6zFTOtNavFB7H9czFezYH8cd04dC0jdvIeTiW4G5Hn8tyKetQTDiQbTbyl3n0GJ+iELWj44jeGf/iCBsUwKyAs55JXcc3N7cx/GtoJd/FLMW1aXH2kgISgAyYnl1NDQ==
Received: from DU7PR01CA0019.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::22) by DU4PR10MB9189.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:55a::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 16:49:35 +0000
Received: from DB3PEPF0000885C.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::7e) by DU7PR01CA0019.outlook.office365.com
 (2603:10a6:10:50f::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 16:49:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB3PEPF0000885C.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 16:49:34 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 3 Feb
 2026 17:51:13 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 3 Feb
 2026 17:49:33 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 3 Feb 2026 17:49:21 +0100
MIME-Version: 1.0
Message-ID: <20260203-upstream_add_stm32mp21_support-v1-1-48ca3409cce1@foss.st.com>
References: <20260203-upstream_add_stm32mp21_support-v1-0-48ca3409cce1@foss.st.com>
In-Reply-To: <20260203-upstream_add_stm32mp21_support-v1-0-48ca3409cce1@foss.st.com>
To: <u-boot@lists.denx.de>, <uboot-stm32@st-md-mailman.stormreply.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885C:EE_|DU4PR10MB9189:EE_
X-MS-Office365-Filtering-Correlation-Id: 25c2be5d-56f0-45d1-ad7f-08de63443620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026|7142099003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UXFaNmN1V0lCdGdyaVllQTM0cjIrbUwreUVkQVdLQmNqc0hDSmRJTm5hN0Fs?=
 =?utf-8?B?bkI4Y2pGd001Sm5RMWZPcGxHVWlCbDdJUzdYQlhtbVJQc3hnSkk5K2FZUnQx?=
 =?utf-8?B?bFFhYWUrQkFwMUV4V3FIamhuOVBoZnJZVWk2RDJoVUJaTzMrZXVMTVRKVHNY?=
 =?utf-8?B?dThPdDVGZjkzb1FOc1N3TE1lamhiQk96Tmt0MjJSWUQwdnc4c2JXdWNVeTlv?=
 =?utf-8?B?aDN3MGNaOTZKV2phSkRTekE4YzFDcTFqdmJ4eThiV1ZyTXFtSzhCR084cTNT?=
 =?utf-8?B?YmNWNlllV0I3UnZJM1BkeEhMalVBWkZBditHeU0yN0FpRDVHQ1h3WFkrRW9E?=
 =?utf-8?B?amlMdW42NllpdTQwbnNDOUdRbWZyeUR0d1VhTEYrMTNyTGRVZTJEQy9hc0hl?=
 =?utf-8?B?b0t6U0tJcUEwWDJHWDRQaUdudjhtRXZNUGh2akFwb3RCZDJsSVh0UTVTZW5k?=
 =?utf-8?B?TnpLaXZwQ0dPd2lncS82UGYrYSszZkVWaXNKR2NuYzZOOHVsZWdyNk5RSTdu?=
 =?utf-8?B?MTRvV0g3aldwU0s0MmRJQUhqQlRKa2k3eXVyNkR5d1E2WTRFZ052TVF6OGFr?=
 =?utf-8?B?NlhQQmlLRk5JWDR5aURIK0doaUc4RHg2UlJvd3V2NTN3UWtTTXBPaEVNOEZ5?=
 =?utf-8?B?ZE51S0xLZzRVSDlvU0JYY1pwYzloc1RwOWxtSENxZzBweU9sNWRjUldjdkVV?=
 =?utf-8?B?NWpZbjhOcnZVMU1UOHdBVGk1RnBCR0J6QWZCTS9xenJ1dWhHUjZqZ3JjKzZn?=
 =?utf-8?B?cm5ZNzl2UFFEV1BEQnFLaGo3aUJLWWdYRlNIKytleG8yZGw3c3pYUVJpOFdZ?=
 =?utf-8?B?bndrWW9pWEhETHdnL3JTMCsxaGhJQ3F6cUYyYmN0VVE4d3FrK1BBSytHdHB0?=
 =?utf-8?B?QTdaUHVGSDNLaTRJUXVFUUw2V3RKUEFZVUpTVXl1VkFtTUZHK0pNNU5FcEhU?=
 =?utf-8?B?S0JScFNZOHN2b05sS0dVbE9MMnJMdXczTkxvWmlxWk9velpEelhkNTFQbFRw?=
 =?utf-8?B?SEFFWGo5NDhsQVFDc25ObUFxS3k1S0RqRFVzNnFNTGt2akovRUozd3l1QXk1?=
 =?utf-8?B?UUFyN1lPLzRnLzVMcVpacEhncmJqV3VybEJPbDN5V0RUMk5Lb3pzM1NMUkUw?=
 =?utf-8?B?SDROTGZ5OVRXTU04TkY1cFNvRDNIY3FrOHRXVVBRam5mTEtFSTJ5NXpNZ2Vy?=
 =?utf-8?B?dnNLblJjRWVIL3RhRkFEanZMNE0vY1UyU3c3Z0dENEJSSFlHMjlsZlpDbHJM?=
 =?utf-8?B?U1gzWUk4Sm9qSGhsTWxsQ1I4WTlxa05lME5FcWFPMUNEZTJMSXJTbENGTXJQ?=
 =?utf-8?B?b2ZSaklDckxoYXNQU2h0Kzd6ZTduaEUvYmNOalRpdFVPcDUyT2I3cEJrQUFK?=
 =?utf-8?B?cmVrMkg0ckM1TVZtaDArNWF4T3JLNXpkczdwV1RwOG1iakdIb2ZRREFUNk5T?=
 =?utf-8?B?OEZOMmhVbVpDbjF2TWhsYXdCTDhxdXhIZCt3ZE5kK3hCWXdpdXo2bFk4UWgz?=
 =?utf-8?B?ampnV3pFM0FDVTVNVS9kMmx4WEJ2cDFVdWYyMzFvVHQ2cGJ6TElQS0JGVzdl?=
 =?utf-8?B?OWtoTXY2aFdUSysvWHFaMmt4dkJlVGV6V3lhRWVaaXdKZm4rV1lXNUk3OVh1?=
 =?utf-8?B?RVpGTlNacURtUmVBRi9Hem1IWndnZHV3cTBEdksvaXZDS2dIQTlhcGMxczNT?=
 =?utf-8?B?WDh6Mjcwa1c3S2FlZE5LQUQraVFOVzZrUC9sQ21WNHQ4c2U5UHRzajlzUElE?=
 =?utf-8?B?NGxTeUZhd1luZEwxaHFyREtBMXpON0lNRTRuaVNlN1B6WWgvZk5iaGJxdlJQ?=
 =?utf-8?B?aGQ4UDJSSXpPVUNZcVpiVDhzZmYwN3NmbG9RSWR6bWNrc2g1c0o0OUpydTdh?=
 =?utf-8?B?ZFJJeG85SGcrWTZKeCswTzhhaUlvem1FMFRobm8reFhzYWlQenlaQmI3RmE2?=
 =?utf-8?B?RExCMjhheHY4Z1RCNlhER05iRkhVZGoxYmNiV004U28zMEpYSFZmWVJ6cDZS?=
 =?utf-8?B?czd2c3FadldHdTVaZXErNFpsem5lWTM1dmN0U2xIWSswR1FSc0wxOXpPb2lX?=
 =?utf-8?B?a1p5aGh5YlJ1YTZkL1E4aUZvN3dBMXgyT1paY2N4TVh1b0NKRHNZc2g3Tmtm?=
 =?utf-8?B?bS9YUmxhSlBjRW0yWmsreFY0eTI5YUloYktjbG5aTncyVWpkOUFucDNRL1VM?=
 =?utf-8?B?OFNWOHREK1dKQlRvL0IzQkttQ1BSVHk0WXBzRlFDTUZCMkRKMjBGdjBEUllv?=
 =?utf-8?B?WGlQb2xMck8rL3dPeUdKb2paNmpRPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7142099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: l5D/21VYY/PNHWH4gfl9R3iznINZu7p36DEu5YNi2sHD8IkdDcp9qXNioUBqmTCs7sUGCfYRVZdB2QyVU44wrS+DqufEwtWODt9tBu6GY+Bh7prMrLAqNgMFRpT5m0f9eI7FkQf4DmRrvWKlOn4/x1mwgIbk4xF+oNRko60Jtz/0TrFn0DcDC6ZCifX5ea4pDUWtfeH92Y2G5OecOHjb9TVck+U2beMZNoTMOwre8Nr9ZGmyMrCjjyra3fGupZulprZPcqynB/pW9o/rCq7i+JClJxcF/FJTYHQVNYrXaCakHwUsXa/DiI82NG0nDXkt6iyK+6CLyInKUqP8vAFFaRuD3wr1yapZ7nGXn4qOFQv7P0fZeB6TfHyK0iAFm+akZtKo1dTbL6CwTBG3v9Z2RlEoFc3b8eVAixD2QxQ1m18w44dyQoSlPB01lmOwEfFG
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 16:49:34.9095 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25c2be5d-56f0-45d1-ad7f-08de63443620
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB9189
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
Subject: [Uboot-stm32] [PATCH 1/7] clk: stm32mp21: Add clock driver support
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
X-Rspamd-Queue-Id: EE544DC417
X-Rspamd-Action: no action

Add clock driver support for STM32MP21 SoCs.

Signed-off-by: Nicolas Le Bayon <nicolas.le.bayon@st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 drivers/clk/stm32/Kconfig         |   9 +
 drivers/clk/stm32/Makefile        |   1 +
 drivers/clk/stm32/clk-stm32mp21.c | 709 ++++++++++++++++++++++++++++++++++++++
 include/stm32mp21_rcc.h           | 651 ++++++++++++++++++++++++++++++++++
 4 files changed, 1370 insertions(+)

diff --git a/drivers/clk/stm32/Kconfig b/drivers/clk/stm32/Kconfig
index ea856be1662..4e488136eac 100644
--- a/drivers/clk/stm32/Kconfig
+++ b/drivers/clk/stm32/Kconfig
@@ -37,6 +37,15 @@ config CLK_STM32MP13
 	  Enable the STM32 clock (RCC) driver. Enable support for
 	  manipulating STM32MP13's on-SoC clocks.
 
+config CLK_STM32MP21
+	bool "Enable RCC clock driver for STM32MP21"
+	depends on ARCH_STM32MP && CLK
+	default y if STM32MP21X
+	select CLK_STM32_CORE
+	help
+	  Enable the STM32 clock (RCC) driver. Enable support for
+	  manipulating STM32MP21's on-SoC clocks.
+
 config CLK_STM32MP25
 	bool "Enable RCC clock driver for STM32MP25"
 	depends on ARCH_STM32MP && CLK
diff --git a/drivers/clk/stm32/Makefile b/drivers/clk/stm32/Makefile
index 56adb8a4bbb..0b849c52a3b 100644
--- a/drivers/clk/stm32/Makefile
+++ b/drivers/clk/stm32/Makefile
@@ -7,4 +7,5 @@ obj-$(CONFIG_CLK_STM32F) += clk-stm32f.o
 obj-$(CONFIG_CLK_STM32H7) += clk-stm32h7.o
 obj-$(CONFIG_CLK_STM32MP1) += clk-stm32mp1.o
 obj-$(CONFIG_CLK_STM32MP13) += clk-stm32mp13.o
+obj-$(CONFIG_CLK_STM32MP21) += clk-stm32mp21.o
 obj-$(CONFIG_CLK_STM32MP25) += clk-stm32mp25.o
diff --git a/drivers/clk/stm32/clk-stm32mp21.c b/drivers/clk/stm32/clk-stm32mp21.c
new file mode 100644
index 00000000000..ad990b6ad93
--- /dev/null
+++ b/drivers/clk/stm32/clk-stm32mp21.c
@@ -0,0 +1,709 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
+/*
+ * Copyright (C) 2026, STMicroelectronics - All Rights Reserved
+ */
+
+#include <clk-uclass.h>
+#include <dm.h>
+#include <dt-bindings/clock/st,stm32mp21-rcc.h>
+#include <linux/bitfield.h>
+#include <linux/clk-provider.h>
+#include <linux/io.h>
+#include <mach/rif.h>
+
+#include "clk-stm32-core.h"
+#include "stm32mp21_rcc.h"
+
+/* Clock security definition */
+#define SECF_NONE		-1
+
+#define RCC_REG_SIZE	32
+#define RCC_SECCFGR(x)	(((x) / RCC_REG_SIZE) * 0x4 + RCC_SECCFGR0)
+#define RCC_CIDCFGR(x)	((x) * 0x8 + RCC_R0CIDCFGR)
+#define RCC_SEMCR(x)	((x) * 0x8 + RCC_R0SEMCR)
+#define RCC_CID1	1
+
+/* Register: RIFSC_CIDCFGR */
+#define RCC_CIDCFGR_CFEN	BIT(0)
+#define RCC_CIDCFGR_SEM_EN	BIT(1)
+#define RCC_CIDCFGR_SEMWLC1_EN	BIT(17)
+#define RCC_CIDCFGR_SCID_MASK	GENMASK(6, 4)
+
+/* Register: RIFSC_SEMCR */
+#define RCC_SEMCR_SEMCID_MASK	GENMASK(6, 4)
+
+#define STM32MP21_RIFRCC_DBG_ID		73
+#define STM32MP21_RIFRCC_MCO1_ID	108
+#define STM32MP21_RIFRCC_MCO2_ID	109
+#define STM32MP21_RIFRCC_OSPI1_ID	110
+
+#define SEC_RIFSC_FLAG		BIT(31)
+#define SEC_RIFRCC(_id)		(STM32MP21_RIFRCC_##_id##_ID)
+#define SEC_RIFSC(_id)		((_id) | SEC_RIFSC_FLAG)
+
+/* must match scmi clock order found in DT */
+enum {
+	IDX_HSE,
+	IDX_HSI,
+	IDX_MSI,
+	IDX_LSE,
+	IDX_LSI,
+	IDX_HSE_DIV2,
+	IDX_ICN_HS_MCU,
+	IDX_ICN_LS_MCU,
+	IDX_ICN_SDMMC,
+	IDX_ICN_DDR,
+	IDX_ICN_DISPLAY,
+	IDX_ICN_HSL,
+	IDX_ICN_NIC,
+	IDX_FLEXGEN_07,
+	IDX_FLEXGEN_08,
+	IDX_FLEXGEN_09,
+	IDX_FLEXGEN_10,
+	IDX_FLEXGEN_11,
+	IDX_FLEXGEN_12,
+	IDX_FLEXGEN_13,
+	IDX_FLEXGEN_14,
+	IDX_FLEXGEN_16,
+	IDX_FLEXGEN_17,
+	IDX_FLEXGEN_18,
+	IDX_FLEXGEN_19,
+	IDX_FLEXGEN_20,
+	IDX_FLEXGEN_21,
+	IDX_FLEXGEN_22,
+	IDX_FLEXGEN_23,
+	IDX_FLEXGEN_24,
+	IDX_FLEXGEN_25,
+	IDX_FLEXGEN_26,
+	IDX_FLEXGEN_27,
+	IDX_FLEXGEN_28,
+	IDX_FLEXGEN_29,
+	IDX_FLEXGEN_30,
+	IDX_FLEXGEN_31,
+	IDX_FLEXGEN_33,
+	IDX_FLEXGEN_36,
+	IDX_FLEXGEN_37,
+	IDX_FLEXGEN_38,
+	IDX_FLEXGEN_39,
+	IDX_FLEXGEN_40,
+	IDX_FLEXGEN_41,
+	IDX_FLEXGEN_42,
+	IDX_FLEXGEN_43,
+	IDX_FLEXGEN_44,
+	IDX_FLEXGEN_45,
+	IDX_FLEXGEN_46,
+	IDX_FLEXGEN_47,
+	IDX_FLEXGEN_48,
+	IDX_FLEXGEN_50,
+	IDX_FLEXGEN_51,
+	IDX_FLEXGEN_52,
+	IDX_FLEXGEN_53,
+	IDX_FLEXGEN_54,
+	IDX_FLEXGEN_55,
+	IDX_FLEXGEN_56,
+	IDX_FLEXGEN_57,
+	IDX_FLEXGEN_58,
+	IDX_FLEXGEN_61,
+	IDX_FLEXGEN_62,
+	IDX_FLEXGEN_63,
+	IDX_ICN_APB1,
+	IDX_ICN_APB2,
+	IDX_ICN_APB3,
+	IDX_ICN_APB4,
+	IDX_ICN_APB5,
+	IDX_ICN_APBDBG,
+	IDX_TIMG1,
+	IDX_TIMG2,
+};
+
+static const struct clk_parent_data adc1_src[] = {
+	{ .index = IDX_FLEXGEN_46 },
+	{ .index = IDX_ICN_LS_MCU },
+};
+
+static const struct clk_parent_data adc2_src[] = {
+	{ .index = IDX_FLEXGEN_47 },
+	{ .index = IDX_ICN_LS_MCU },
+	{ .index = IDX_FLEXGEN_46 },
+};
+
+static const struct clk_parent_data usb2phy1_src[] = {
+	{ .index = IDX_FLEXGEN_57 },
+	{ .index = IDX_HSE_DIV2 },
+};
+
+static const struct clk_parent_data usb2phy2_src[] = {
+	{ .index = IDX_FLEXGEN_58 },
+	{ .index = IDX_HSE_DIV2 },
+};
+
+static const struct clk_parent_data dts_src[] = {
+	{ .index = IDX_HSI },
+	{ .index = IDX_HSE },
+	{ .index = IDX_MSI },
+};
+
+static const struct clk_parent_data mco1_src[] = {
+	{ .index = IDX_FLEXGEN_61 },
+	{ .name = "ck_obs0" },
+};
+
+static const struct clk_parent_data mco2_src[] = {
+	{ .index = IDX_FLEXGEN_62 },
+	{ .name = "ck_obs1" },
+};
+
+enum enum_mux_cfg {
+	MUX_MCO1,
+	MUX_MCO2,
+	MUX_ADC1,
+	MUX_ADC2,
+	MUX_USB2PHY1,
+	MUX_USB2PHY2,
+	MUX_DTS,
+	MUX_NB
+};
+
+#define MUX_CFG(id, src, _offset, _shift, _witdh)[id] = {\
+		.num_parents	= ARRAY_SIZE(src),\
+		.parent_data	= src,\
+		.reg_off	= (_offset),\
+		.shift		= (_shift),\
+		.width		= (_witdh),\
+}
+
+static const struct stm32_mux_cfg stm32mp21_muxes[MUX_NB] = {
+	MUX_CFG(MUX_ADC1,		adc1_src,	RCC_ADC1CFGR,		12,	1),
+	MUX_CFG(MUX_ADC2,		adc2_src,	RCC_ADC2CFGR,		12,	2),
+	MUX_CFG(MUX_DTS,		dts_src,	RCC_DTSCFGR,		12,	2),
+	MUX_CFG(MUX_MCO1,		mco1_src,	RCC_MCO1CFGR,		0,	1),
+	MUX_CFG(MUX_MCO2,		mco2_src,	RCC_MCO2CFGR,		0,	1),
+	MUX_CFG(MUX_USB2PHY1,		usb2phy1_src,	RCC_USB2PHY1CFGR,	15,	1),
+	MUX_CFG(MUX_USB2PHY2,		usb2phy2_src,	RCC_USB2PHY2CFGR,	15,	1),
+};
+
+enum enum_gate_cfg {
+	GATE_ADC1,
+	GATE_ADC2,
+	GATE_CRC,
+	GATE_CRYP1,
+	GATE_CRYP2,
+	GATE_CSI,
+	GATE_DBG,
+	GATE_DCMIPP,
+	GATE_DTS,
+	GATE_ETH1,
+	GATE_ETH1MAC,
+	GATE_ETH1RX,
+	GATE_ETH1STP,
+	GATE_ETH1TX,
+	GATE_ETH2,
+	GATE_ETH2MAC,
+	GATE_ETH2RX,
+	GATE_ETH2STP,
+	GATE_ETH2TX,
+	GATE_ETR,
+	GATE_FDCAN,
+	GATE_HASH1,
+	GATE_HASH2,
+	GATE_HDP,
+	GATE_I2C1,
+	GATE_I2C2,
+	GATE_I2C3,
+	GATE_I3C1,
+	GATE_I3C2,
+	GATE_I3C3,
+	GATE_IWDG1,
+	GATE_IWDG2,
+	GATE_IWDG3,
+	GATE_IWDG4,
+	GATE_LPTIM1,
+	GATE_LPTIM2,
+	GATE_LPTIM3,
+	GATE_LPTIM4,
+	GATE_LPTIM5,
+	GATE_LPUART1,
+	GATE_LTDC,
+	GATE_MCO1,
+	GATE_MCO2,
+	GATE_MDF1,
+	GATE_OSPI1,
+	GATE_PKA,
+	GATE_RNG1,
+	GATE_RNG2,
+	GATE_SAES,
+	GATE_SAI1,
+	GATE_SAI2,
+	GATE_SAI3,
+	GATE_SAI4,
+	GATE_SDMMC1,
+	GATE_SDMMC2,
+	GATE_SDMMC3,
+	GATE_SERC,
+	GATE_SPDIFRX,
+	GATE_SPI1,
+	GATE_SPI2,
+	GATE_SPI3,
+	GATE_SPI4,
+	GATE_SPI5,
+	GATE_SPI6,
+	GATE_STGEN,
+	GATE_STM,
+	GATE_TIM1,
+	GATE_TIM2,
+	GATE_TIM3,
+	GATE_TIM4,
+	GATE_TIM5,
+	GATE_TIM6,
+	GATE_TIM7,
+	GATE_TIM8,
+	GATE_TIM10,
+	GATE_TIM11,
+	GATE_TIM12,
+	GATE_TIM13,
+	GATE_TIM14,
+	GATE_TIM15,
+	GATE_TIM16,
+	GATE_TIM17,
+	GATE_TRACE,
+	GATE_UART4,
+	GATE_UART5,
+	GATE_UART7,
+	GATE_USART1,
+	GATE_USART2,
+	GATE_USART3,
+	GATE_USART6,
+	GATE_USBH,
+	GATE_USBOTG,
+	GATE_USB2PHY1,
+	GATE_USB2PHY2,
+	GATE_VREF,
+	GATE_WWDG1,
+	GATE_NB
+};
+
+#define GATE_CFG(id, _offset, _bit_idx, _offset_clr)[id] = {\
+	.reg_off	= (_offset),\
+	.bit_idx	= (_bit_idx),\
+	.set_clr	= (_offset_clr),\
+}
+
+static const struct stm32_gate_cfg stm32mp21_gates[GATE_NB] = {
+	GATE_CFG(GATE_MCO1,		RCC_MCO1CFGR,		8,	0),
+	GATE_CFG(GATE_MCO2,		RCC_MCO2CFGR,		8,	0),
+	GATE_CFG(GATE_OSPI1,		RCC_OSPI1CFGR,		1,	0),
+	GATE_CFG(GATE_DBG,		RCC_DBGCFGR,		8,	0),
+	GATE_CFG(GATE_TRACE,		RCC_DBGCFGR,		9,	0),
+	GATE_CFG(GATE_STM,		RCC_STMCFGR,		1,	0),
+	GATE_CFG(GATE_ETR,		RCC_ETRCFGR,		1,	0),
+	GATE_CFG(GATE_TIM1,		RCC_TIM1CFGR,		1,	0),
+	GATE_CFG(GATE_TIM2,		RCC_TIM2CFGR,		1,	0),
+	GATE_CFG(GATE_TIM3,		RCC_TIM3CFGR,		1,	0),
+	GATE_CFG(GATE_TIM4,		RCC_TIM4CFGR,		1,	0),
+	GATE_CFG(GATE_TIM5,		RCC_TIM5CFGR,		1,	0),
+	GATE_CFG(GATE_TIM6,		RCC_TIM6CFGR,		1,	0),
+	GATE_CFG(GATE_TIM7,		RCC_TIM7CFGR,		1,	0),
+	GATE_CFG(GATE_TIM8,		RCC_TIM8CFGR,		1,	0),
+	GATE_CFG(GATE_TIM10,		RCC_TIM10CFGR,		1,	0),
+	GATE_CFG(GATE_TIM11,		RCC_TIM11CFGR,		1,	0),
+	GATE_CFG(GATE_TIM12,		RCC_TIM12CFGR,		1,	0),
+	GATE_CFG(GATE_TIM13,		RCC_TIM13CFGR,		1,	0),
+	GATE_CFG(GATE_TIM14,		RCC_TIM14CFGR,		1,	0),
+	GATE_CFG(GATE_TIM15,		RCC_TIM15CFGR,		1,	0),
+	GATE_CFG(GATE_TIM16,		RCC_TIM16CFGR,		1,	0),
+	GATE_CFG(GATE_TIM17,		RCC_TIM17CFGR,		1,	0),
+	GATE_CFG(GATE_LPTIM1,		RCC_LPTIM1CFGR,		1,	0),
+	GATE_CFG(GATE_LPTIM2,		RCC_LPTIM2CFGR,		1,	0),
+	GATE_CFG(GATE_LPTIM3,		RCC_LPTIM3CFGR,		1,	0),
+	GATE_CFG(GATE_LPTIM4,		RCC_LPTIM4CFGR,		1,	0),
+	GATE_CFG(GATE_LPTIM5,		RCC_LPTIM5CFGR,		1,	0),
+	GATE_CFG(GATE_SPI1,		RCC_SPI1CFGR,		1,	0),
+	GATE_CFG(GATE_SPI2,		RCC_SPI2CFGR,		1,	0),
+	GATE_CFG(GATE_SPI3,		RCC_SPI3CFGR,		1,	0),
+	GATE_CFG(GATE_SPI4,		RCC_SPI4CFGR,		1,	0),
+	GATE_CFG(GATE_SPI5,		RCC_SPI5CFGR,		1,	0),
+	GATE_CFG(GATE_SPI6,		RCC_SPI6CFGR,		1,	0),
+	GATE_CFG(GATE_SPDIFRX,		RCC_SPDIFRXCFGR,	1,	0),
+	GATE_CFG(GATE_USART1,		RCC_USART1CFGR,		1,	0),
+	GATE_CFG(GATE_USART2,		RCC_USART2CFGR,		1,	0),
+	GATE_CFG(GATE_USART3,		RCC_USART3CFGR,		1,	0),
+	GATE_CFG(GATE_UART4,		RCC_UART4CFGR,		1,	0),
+	GATE_CFG(GATE_UART5,		RCC_UART5CFGR,		1,	0),
+	GATE_CFG(GATE_USART6,		RCC_USART6CFGR,		1,	0),
+	GATE_CFG(GATE_UART7,		RCC_UART7CFGR,		1,	0),
+	GATE_CFG(GATE_LPUART1,		RCC_LPUART1CFGR,	1,	0),
+	GATE_CFG(GATE_I2C1,		RCC_I2C1CFGR,		1,	0),
+	GATE_CFG(GATE_I2C2,		RCC_I2C2CFGR,		1,	0),
+	GATE_CFG(GATE_I2C3,		RCC_I2C3CFGR,		1,	0),
+	GATE_CFG(GATE_SAI1,		RCC_SAI1CFGR,		1,	0),
+	GATE_CFG(GATE_SAI2,		RCC_SAI2CFGR,		1,	0),
+	GATE_CFG(GATE_SAI3,		RCC_SAI3CFGR,		1,	0),
+	GATE_CFG(GATE_SAI4,		RCC_SAI4CFGR,		1,	0),
+	GATE_CFG(GATE_MDF1,		RCC_MDF1CFGR,		1,	0),
+	GATE_CFG(GATE_FDCAN,		RCC_FDCANCFGR,		1,	0),
+	GATE_CFG(GATE_HDP,		RCC_HDPCFGR,		1,	0),
+	GATE_CFG(GATE_ADC1,		RCC_ADC1CFGR,		1,	0),
+	GATE_CFG(GATE_ADC2,		RCC_ADC2CFGR,		1,	0),
+	GATE_CFG(GATE_ETH1MAC,		RCC_ETH1CFGR,		1,	0),
+	GATE_CFG(GATE_ETH1STP,		RCC_ETH1CFGR,		4,	0),
+	GATE_CFG(GATE_ETH1,		RCC_ETH1CFGR,		5,	0),
+	GATE_CFG(GATE_ETH1TX,		RCC_ETH1CFGR,		8,	0),
+	GATE_CFG(GATE_ETH1RX,		RCC_ETH1CFGR,		10,	0),
+	GATE_CFG(GATE_ETH2MAC,		RCC_ETH2CFGR,		1,	0),
+	GATE_CFG(GATE_ETH2STP,		RCC_ETH2CFGR,		4,	0),
+	GATE_CFG(GATE_ETH2,		RCC_ETH2CFGR,		5,	0),
+	GATE_CFG(GATE_ETH2TX,		RCC_ETH2CFGR,		8,	0),
+	GATE_CFG(GATE_ETH2RX,		RCC_ETH2CFGR,		10,	0),
+	GATE_CFG(GATE_USBH,		RCC_USBHCFGR,		1,	0),
+	GATE_CFG(GATE_USB2PHY1,		RCC_USB2PHY1CFGR,	1,	0),
+	GATE_CFG(GATE_USBOTG,		RCC_OTGCFGR,		1,	0),
+	GATE_CFG(GATE_USB2PHY2,		RCC_USB2PHY2CFGR,	1,	0),
+	GATE_CFG(GATE_STGEN,		RCC_STGENCFGR,		1,	0),
+	GATE_CFG(GATE_SDMMC1,		RCC_SDMMC1CFGR,		1,	0),
+	GATE_CFG(GATE_SDMMC2,		RCC_SDMMC2CFGR,		1,	0),
+	GATE_CFG(GATE_SDMMC3,		RCC_SDMMC3CFGR,		1,	0),
+	GATE_CFG(GATE_LTDC,		RCC_LTDCCFGR,		1,	0),
+	GATE_CFG(GATE_CSI,		RCC_CSICFGR,		1,	0),
+	GATE_CFG(GATE_DCMIPP,		RCC_DCMIPPCFGR,		1,	0),
+	GATE_CFG(GATE_RNG1,		RCC_RNG1CFGR,		1,	0),
+	GATE_CFG(GATE_RNG2,		RCC_RNG2CFGR,		1,	0),
+	GATE_CFG(GATE_PKA,		RCC_PKACFGR,		1,	0),
+	GATE_CFG(GATE_SAES,		RCC_SAESCFGR,		1,	0),
+	GATE_CFG(GATE_HASH1,		RCC_HASH1CFGR,		1,	0),
+	GATE_CFG(GATE_HASH2,		RCC_HASH2CFGR,		1,	0),
+	GATE_CFG(GATE_CRYP1,		RCC_CRYP1CFGR,		1,	0),
+	GATE_CFG(GATE_CRYP2,		RCC_CRYP2CFGR,		1,	0),
+	GATE_CFG(GATE_IWDG1,		RCC_IWDG1CFGR,		1,	0),
+	GATE_CFG(GATE_IWDG2,		RCC_IWDG2CFGR,		1,	0),
+	GATE_CFG(GATE_IWDG3,		RCC_IWDG3CFGR,		1,	0),
+	GATE_CFG(GATE_IWDG4,		RCC_IWDG4CFGR,		1,	0),
+	GATE_CFG(GATE_WWDG1,		RCC_WWDG1CFGR,		1,	0),
+	GATE_CFG(GATE_VREF,		RCC_VREFCFGR,		1,	0),
+	GATE_CFG(GATE_DTS,		RCC_DTSCFGR,		1,	0),
+	GATE_CFG(GATE_CRC,		RCC_CRCCFGR,		1,	0),
+	GATE_CFG(GATE_SERC,		RCC_SERCCFGR,		1,	0),
+	GATE_CFG(GATE_I3C1,		RCC_I3C1CFGR,		1,	0),
+	GATE_CFG(GATE_I3C2,		RCC_I3C2CFGR,		1,	0),
+	GATE_CFG(GATE_I3C3,		RCC_I3C3CFGR,		1,	0),
+};
+
+static int stm32_rcc_get_access(struct udevice *dev, u32 index)
+{
+	fdt_addr_t rcc_base = dev_read_addr(dev->parent);
+	u32 seccfgr, cidcfgr, semcr;
+	int bit, cid;
+
+	bit = index % RCC_REG_SIZE;
+
+	seccfgr = readl(rcc_base + RCC_SECCFGR(index));
+	if (seccfgr & BIT(bit))
+		return -EACCES;
+
+	cidcfgr = readl(rcc_base + RCC_CIDCFGR(index));
+	if (!(cidcfgr & RCC_CIDCFGR_CFEN))
+		/* CID filtering is turned off: access granted */
+		return 0;
+
+	if (!(cidcfgr & RCC_CIDCFGR_SEM_EN)) {
+		/* Static CID mode */
+		cid = FIELD_GET(RCC_CIDCFGR_SCID_MASK, cidcfgr);
+		if (cid != RCC_CID1)
+			return -EACCES;
+		return 0;
+	}
+
+	/* Pass-list with semaphore mode */
+	if (!(cidcfgr & RCC_CIDCFGR_SEMWLC1_EN))
+		return -EACCES;
+
+	semcr = readl(rcc_base + RCC_SEMCR(index));
+
+	cid = FIELD_GET(RCC_SEMCR_SEMCID_MASK, semcr);
+	if (cid != RCC_CID1)
+		return -EACCES;
+
+	return 0;
+}
+
+static int stm32mp21_check_security(struct udevice *dev, void __iomem *base,
+				    const struct clock_config *cfg)
+{
+	int ret = 0;
+
+	if (cfg->sec_id != SECF_NONE) {
+		u32 index = (u32)cfg->sec_id;
+
+		if (index & SEC_RIFSC_FLAG)
+			ret = stm32_rifsc_grant_access_by_id(dev_ofnode(dev),
+							     index & ~SEC_RIFSC_FLAG);
+		else
+			ret = stm32_rcc_get_access(dev, index);
+	}
+
+	return ret;
+}
+
+#define STM32_COMPOSITE_NODIV(_id, _name, _flags, _sec_id, _gate_id, _mux_id)\
+	STM32_COMPOSITE(_id, _name, _flags, _sec_id, _gate_id, _mux_id, NO_STM32_DIV)
+
+static const struct clock_config stm32mp21_clock_cfg[] = {
+	/* ADC */
+	STM32_GATE(CK_BUS_ADC1, "ck_icn_p_adc1", IDX_ICN_LS_MCU, 0, GATE_ADC1,
+		   SEC_RIFSC(58)),
+	STM32_COMPOSITE_NODIV(CK_KER_ADC1, "ck_ker_adc12", 0, SEC_RIFSC(58),
+			      GATE_ADC1, MUX_ADC1),
+	STM32_GATE(CK_BUS_ADC2, "ck_icn_p_adc2", IDX_ICN_LS_MCU, 0, GATE_ADC2, SEC_RIFSC(59)),
+	STM32_COMPOSITE_NODIV(CK_KER_ADC2, "ck_ker_adc2", 0, SEC_RIFSC(59), GATE_ADC2, MUX_ADC2),
+
+	/* CSI-HOST */
+	STM32_GATE(CK_BUS_CSI, "ck_icn_p_csi", IDX_ICN_APB4, 0, GATE_CSI, SEC_RIFSC(86)),
+	STM32_GATE(CK_KER_CSI, "ck_ker_csi", IDX_FLEXGEN_29, 0, GATE_CSI, SEC_RIFSC(86)),
+	STM32_GATE(CK_KER_CSITXESC, "ck_ker_csitxesc", IDX_FLEXGEN_30, 0, GATE_CSI,
+		   SEC_RIFSC(86)),
+
+	/* CSI-PHY */
+	STM32_GATE(CK_KER_CSIPHY, "ck_ker_csiphy", IDX_FLEXGEN_31, 0, GATE_CSI,
+		   SEC_RIFSC(86)),
+
+	/* DCMIPP */
+	STM32_GATE(CK_BUS_DCMIPP, "ck_icn_p_dcmipp", IDX_ICN_APB4, 0, GATE_DCMIPP,
+		   SEC_RIFSC(87)),
+
+	/* CRC */
+	STM32_GATE(CK_BUS_CRC, "ck_icn_p_crc", IDX_ICN_LS_MCU, 0, GATE_CRC, SEC_RIFSC(109)),
+
+	/* CRYP */
+	STM32_GATE(CK_BUS_CRYP1, "ck_icn_p_cryp1", IDX_ICN_LS_MCU, 0, GATE_CRYP1,
+		   SEC_RIFSC(98)),
+	STM32_GATE(CK_BUS_CRYP2, "ck_icn_p_cryp2", IDX_ICN_LS_MCU, 0, GATE_CRYP2,
+		   SEC_RIFSC(99)),
+
+	/* DBG & TRACE*/
+	/* Trace and debug clocks are managed by SCMI */
+
+	/* Display subsystem */
+	/* LTDC */
+	STM32_GATE(CK_BUS_LTDC, "ck_icn_p_ltdc", IDX_ICN_APB4, 0, GATE_LTDC, SEC_RIFSC(80)),
+	STM32_GATE(CK_KER_LTDC, "ck_ker_ltdc", IDX_FLEXGEN_27, CLK_SET_RATE_PARENT, GATE_LTDC,
+		   SEC_RIFSC(80)),
+
+	/* DTS */
+	STM32_COMPOSITE_NODIV(CK_KER_DTS, "ck_ker_dts", 0, SEC_RIFSC(107), GATE_DTS, MUX_DTS),
+
+	/* ETHERNET */
+	STM32_GATE(CK_BUS_ETH1, "ck_icn_p_eth1", IDX_ICN_LS_MCU, 0, GATE_ETH1, SEC_RIFSC(60)),
+	STM32_GATE(CK_ETH1_STP, "ck_ker_eth1stp", IDX_ICN_LS_MCU, 0, GATE_ETH1STP,
+		   SEC_RIFSC(60)),
+	STM32_GATE(CK_KER_ETH1, "ck_ker_eth1", IDX_FLEXGEN_54, 0, GATE_ETH1, SEC_RIFSC(60)),
+	STM32_GATE(CK_KER_ETH1, "ck_ker_eth1ptp", IDX_FLEXGEN_56, 0, GATE_ETH1, SEC_RIFSC(60)),
+	STM32_GATE(CK_ETH1_MAC, "ck_ker_eth1mac", IDX_ICN_LS_MCU, 0, GATE_ETH1MAC,
+		   SEC_RIFSC(60)),
+	STM32_GATE(CK_ETH1_TX, "ck_ker_eth1tx", IDX_ICN_LS_MCU, 0, GATE_ETH1TX, SEC_RIFSC(60)),
+	STM32_GATE(CK_ETH1_RX, "ck_ker_eth1rx", IDX_ICN_LS_MCU, 0, GATE_ETH1RX, SEC_RIFSC(60)),
+
+	STM32_GATE(CK_BUS_ETH2, "ck_icn_p_eth2", IDX_ICN_LS_MCU, 0, GATE_ETH2, SEC_RIFSC(61)),
+	STM32_GATE(CK_ETH2_STP, "ck_ker_eth2stp", IDX_ICN_LS_MCU, 0, GATE_ETH2STP,
+		   SEC_RIFSC(61)),
+	STM32_GATE(CK_KER_ETH2, "ck_ker_eth2", IDX_FLEXGEN_54, 0, GATE_ETH2, SEC_RIFSC(61)),
+	STM32_GATE(CK_KER_ETH2, "ck_ker_eth2ptp", IDX_FLEXGEN_56, 0, GATE_ETH2, SEC_RIFSC(61)),
+	STM32_GATE(CK_ETH2_MAC, "ck_ker_eth2mac", IDX_ICN_LS_MCU, 0, GATE_ETH2MAC,
+		   SEC_RIFSC(61)),
+	STM32_GATE(CK_ETH2_TX, "ck_ker_eth2tx", IDX_ICN_LS_MCU, 0, GATE_ETH2TX, SEC_RIFSC(61)),
+	STM32_GATE(CK_ETH2_RX, "ck_ker_eth2rx", IDX_ICN_LS_MCU, 0, GATE_ETH2RX, SEC_RIFSC(61)),
+
+	/* FDCAN */
+	STM32_GATE(CK_BUS_FDCAN, "ck_icn_p_fdcan", IDX_ICN_APB2, 0, GATE_FDCAN, SEC_RIFSC(56)),
+	STM32_GATE(CK_KER_FDCAN, "ck_ker_fdcan", IDX_FLEXGEN_26, 0, GATE_FDCAN, SEC_RIFSC(56)),
+
+	/* HASH */
+	STM32_GATE(CK_BUS_HASH1, "ck_icn_p_hash1", IDX_ICN_LS_MCU, 0, GATE_HASH1, SEC_RIFSC(96)),
+	STM32_GATE(CK_BUS_HASH2, "ck_icn_p_hash2", IDX_ICN_LS_MCU, 0, GATE_HASH2, SEC_RIFSC(97)),
+
+	/* HDP */
+	STM32_GATE(CK_BUS_HDP, "ck_icn_p_hdp", IDX_ICN_APB3, 0, GATE_HDP, SEC_RIFSC(57)),
+
+	/* I2C */
+	STM32_GATE(CK_KER_I2C1, "ck_ker_i2c1", IDX_FLEXGEN_13, 0, GATE_I2C1, SEC_RIFSC(41)),
+	STM32_GATE(CK_KER_I2C2, "ck_ker_i2c2", IDX_FLEXGEN_13, 0, GATE_I2C2, SEC_RIFSC(42)),
+	STM32_GATE(CK_KER_I2C3, "ck_ker_i2c3", IDX_FLEXGEN_38, 0, GATE_I2C3, SEC_RIFSC(43)),
+
+	/* I3C */
+	STM32_GATE(CK_KER_I3C1, "ck_ker_i3c1", IDX_FLEXGEN_14, 0, GATE_I3C1, SEC_RIFSC(114)),
+	STM32_GATE(CK_KER_I3C2, "ck_ker_i3c2", IDX_FLEXGEN_14, 0, GATE_I3C2, SEC_RIFSC(115)),
+	STM32_GATE(CK_KER_I3C3, "ck_ker_i3c3", IDX_FLEXGEN_36, 0, GATE_I3C3, SEC_RIFSC(116)),
+
+	/* IWDG */
+	STM32_GATE(CK_BUS_IWDG1, "ck_icn_p_iwdg1", IDX_ICN_APB3, 0, GATE_IWDG1, SEC_RIFSC(100)),
+	STM32_GATE(CK_BUS_IWDG2, "ck_icn_p_iwdg2", IDX_ICN_APB3, 0, GATE_IWDG2, SEC_RIFSC(101)),
+	STM32_GATE(CK_BUS_IWDG3, "ck_icn_p_iwdg3", IDX_ICN_APB3, 0, GATE_IWDG3, SEC_RIFSC(102)),
+	STM32_GATE(CK_BUS_IWDG4, "ck_icn_p_iwdg4", IDX_ICN_APB3, 0, GATE_IWDG4, SEC_RIFSC(103)),
+
+	/* LPTIM */
+	STM32_GATE(CK_KER_LPTIM1, "ck_ker_lptim1", IDX_FLEXGEN_07, 0, GATE_LPTIM1,
+		   SEC_RIFSC(17)),
+	STM32_GATE(CK_KER_LPTIM2, "ck_ker_lptim2", IDX_FLEXGEN_07, 0, GATE_LPTIM2,
+		   SEC_RIFSC(18)),
+	STM32_GATE(CK_KER_LPTIM3, "ck_ker_lptim3", IDX_FLEXGEN_40, 0, GATE_LPTIM3,
+		   SEC_RIFSC(19)),
+	STM32_GATE(CK_KER_LPTIM4, "ck_ker_lptim4", IDX_FLEXGEN_41, 0, GATE_LPTIM4,
+		   SEC_RIFSC(20)),
+	STM32_GATE(CK_KER_LPTIM5, "ck_ker_lptim5", IDX_FLEXGEN_42, 0, GATE_LPTIM5,
+		   SEC_RIFSC(21)),
+
+	/* LPUART */
+	STM32_GATE(CK_KER_LPUART1, "ck_ker_lpuart1", IDX_FLEXGEN_39, 0, GATE_LPUART1,
+		   SEC_RIFSC(40)),
+
+	/* MCO1 & MCO2 */
+	STM32_COMPOSITE_NODIV(CK_MCO1, "ck_mco1", 0, SEC_RIFRCC(MCO1), GATE_MCO1, MUX_MCO1),
+	STM32_COMPOSITE_NODIV(CK_MCO2, "ck_mco2", 0, SEC_RIFRCC(MCO2), GATE_MCO2, MUX_MCO2),
+
+	/* MDF */
+	STM32_GATE(CK_KER_MDF1, "ck_ker_mdf1", IDX_FLEXGEN_21, 0, GATE_MDF1, SEC_RIFSC(54)),
+
+	/* PKA */
+	STM32_GATE(CK_BUS_PKA, "ck_icn_p_pka", IDX_ICN_LS_MCU, 0, GATE_PKA, SEC_RIFSC(94)),
+
+	/* RNG */
+	STM32_GATE(CK_BUS_RNG1, "ck_icn_p_rng1", IDX_ICN_LS_MCU, CLK_IGNORE_UNUSED, GATE_RNG1,
+		   SEC_RIFSC(92)),
+	STM32_GATE(CK_BUS_RNG2, "ck_icn_p_rng2", IDX_ICN_LS_MCU, CLK_IGNORE_UNUSED, GATE_RNG2,
+		   SEC_RIFSC(93)),
+
+	/* SAES */
+	STM32_GATE(CK_BUS_SAES, "ck_icn_p_saes", IDX_ICN_LS_MCU, 0, GATE_SAES, SEC_RIFSC(95)),
+
+	/* SAI [1..4] */
+	STM32_GATE(CK_BUS_SAI1, "ck_icn_p_sai1", IDX_ICN_APB2, 0, GATE_SAI1, SEC_RIFSC(49)),
+	STM32_GATE(CK_BUS_SAI2, "ck_icn_p_sai2", IDX_ICN_APB2, 0, GATE_SAI2, SEC_RIFSC(50)),
+	STM32_GATE(CK_BUS_SAI3, "ck_icn_p_sai3", IDX_ICN_APB2, 0, GATE_SAI3, SEC_RIFSC(51)),
+	STM32_GATE(CK_BUS_SAI4, "ck_icn_p_sai4", IDX_ICN_APB2, 0, GATE_SAI4, SEC_RIFSC(52)),
+	STM32_GATE(CK_KER_SAI1, "ck_ker_sai1", IDX_FLEXGEN_22, 0, GATE_SAI1, SEC_RIFSC(49)),
+	STM32_GATE(CK_KER_SAI2, "ck_ker_sai2", IDX_FLEXGEN_23, 0, GATE_SAI2, SEC_RIFSC(50)),
+	STM32_GATE(CK_KER_SAI3, "ck_ker_sai3", IDX_FLEXGEN_24, 0, GATE_SAI3, SEC_RIFSC(51)),
+	STM32_GATE(CK_KER_SAI4, "ck_ker_sai4", IDX_FLEXGEN_25, 0, GATE_SAI4, SEC_RIFSC(52)),
+
+	/* SDMMC */
+	STM32_GATE(CK_KER_SDMMC1, "ck_ker_sdmmc1", IDX_FLEXGEN_51, 0, GATE_SDMMC1,
+		   SEC_RIFSC(76)),
+	STM32_GATE(CK_KER_SDMMC2, "ck_ker_sdmmc2", IDX_FLEXGEN_52, 0, GATE_SDMMC2,
+		   SEC_RIFSC(77)),
+	STM32_GATE(CK_KER_SDMMC3, "ck_ker_sdmmc3", IDX_FLEXGEN_53, 0, GATE_SDMMC3,
+		   SEC_RIFSC(78)),
+
+	/* SERC */
+	STM32_GATE(CK_BUS_SERC, "ck_icn_p_serc", IDX_ICN_APB3, 0, GATE_SERC, SEC_RIFSC(110)),
+
+	/* SPDIF */
+	STM32_GATE(CK_KER_SPDIFRX, "ck_ker_spdifrx", IDX_FLEXGEN_12, 0, GATE_SPDIFRX,
+		   SEC_RIFSC(30)),
+
+	/* SPI */
+	STM32_GATE(CK_KER_SPI1, "ck_ker_spi1", IDX_FLEXGEN_16, 0, GATE_SPI1, SEC_RIFSC(22)),
+	STM32_GATE(CK_KER_SPI2, "ck_ker_spi2", IDX_FLEXGEN_10, 0, GATE_SPI2, SEC_RIFSC(23)),
+	STM32_GATE(CK_KER_SPI3, "ck_ker_spi3", IDX_FLEXGEN_11, 0, GATE_SPI3, SEC_RIFSC(24)),
+	STM32_GATE(CK_KER_SPI4, "ck_ker_spi4", IDX_FLEXGEN_17, 0, GATE_SPI4, SEC_RIFSC(25)),
+	STM32_GATE(CK_KER_SPI5, "ck_ker_spi5", IDX_FLEXGEN_17, 0, GATE_SPI5, SEC_RIFSC(26)),
+	STM32_GATE(CK_KER_SPI6, "ck_ker_spi6", IDX_FLEXGEN_37, 0, GATE_SPI6, SEC_RIFSC(27)),
+
+	/* STGEN */
+	STM32_GATE(CK_KER_STGEN, "ck_ker_stgen", IDX_FLEXGEN_33, CLK_IGNORE_UNUSED, GATE_STGEN,
+		   SEC_RIFSC(73)),
+
+	/* Timers */
+	STM32_GATE(CK_KER_TIM2, "ck_ker_tim2", IDX_TIMG1, 0, GATE_TIM2, SEC_RIFSC(1)),
+	STM32_GATE(CK_KER_TIM3, "ck_ker_tim3", IDX_TIMG1, 0, GATE_TIM3, SEC_RIFSC(2)),
+	STM32_GATE(CK_KER_TIM4, "ck_ker_tim4", IDX_TIMG1, 0, GATE_TIM4, SEC_RIFSC(3)),
+	STM32_GATE(CK_KER_TIM5, "ck_ker_tim5", IDX_TIMG1, 0, GATE_TIM5, SEC_RIFSC(4)),
+	STM32_GATE(CK_KER_TIM6, "ck_ker_tim6", IDX_TIMG1, 0, GATE_TIM6, SEC_RIFSC(5)),
+	STM32_GATE(CK_KER_TIM7, "ck_ker_tim7", IDX_TIMG1, 0, GATE_TIM7, SEC_RIFSC(6)),
+	STM32_GATE(CK_KER_TIM10, "ck_ker_tim10", IDX_TIMG1, 0, GATE_TIM10, SEC_RIFSC(8)),
+	STM32_GATE(CK_KER_TIM11, "ck_ker_tim11", IDX_TIMG1, 0, GATE_TIM11, SEC_RIFSC(9)),
+	STM32_GATE(CK_KER_TIM12, "ck_ker_tim12", IDX_TIMG1, 0, GATE_TIM12, SEC_RIFSC(10)),
+	STM32_GATE(CK_KER_TIM13, "ck_ker_tim13", IDX_TIMG1, 0, GATE_TIM13, SEC_RIFSC(11)),
+	STM32_GATE(CK_KER_TIM14, "ck_ker_tim14", IDX_TIMG1, 0, GATE_TIM14, SEC_RIFSC(12)),
+
+	STM32_GATE(CK_KER_TIM1, "ck_ker_tim1", IDX_TIMG2, 0, GATE_TIM1, SEC_RIFSC(0)),
+	STM32_GATE(CK_KER_TIM8, "ck_ker_tim8", IDX_TIMG2, 0, GATE_TIM8, SEC_RIFSC(7)),
+	STM32_GATE(CK_KER_TIM15, "ck_ker_tim15", IDX_TIMG2, 0, GATE_TIM15, SEC_RIFSC(13)),
+	STM32_GATE(CK_KER_TIM16, "ck_ker_tim16", IDX_TIMG2, 0, GATE_TIM16, SEC_RIFSC(14)),
+	STM32_GATE(CK_KER_TIM17, "ck_ker_tim17", IDX_TIMG2, 0, GATE_TIM17, SEC_RIFSC(15)),
+
+	/* UART/USART */
+	STM32_GATE(CK_KER_USART2, "ck_ker_usart2", IDX_FLEXGEN_08, 0, GATE_USART2,
+		   SEC_RIFSC(32)),
+	STM32_GATE(CK_KER_UART4, "ck_ker_uart4", IDX_FLEXGEN_08, 0, GATE_UART4,
+		   SEC_RIFSC(34)),
+	STM32_GATE(CK_KER_USART3, "ck_ker_usart3", IDX_FLEXGEN_09, 0, GATE_USART3,
+		   SEC_RIFSC(33)),
+	STM32_GATE(CK_KER_UART5, "ck_ker_uart5", IDX_FLEXGEN_09, 0, GATE_UART5,
+		   SEC_RIFSC(35)),
+	STM32_GATE(CK_KER_USART1, "ck_ker_usart1", IDX_FLEXGEN_18, 0, GATE_USART1,
+		   SEC_RIFSC(31)),
+	STM32_GATE(CK_KER_USART6, "ck_ker_usart6", IDX_FLEXGEN_19, 0, GATE_USART6,
+		   SEC_RIFSC(36)),
+	STM32_GATE(CK_KER_UART7, "ck_ker_uart7", IDX_FLEXGEN_20, 0, GATE_UART7,
+		   SEC_RIFSC(37)),
+
+	/* USB2PHY1 */
+	STM32_COMPOSITE_NODIV(CK_KER_USB2PHY1, "ck_ker_usb2phy1", 0, SEC_RIFSC(63),
+			      GATE_USB2PHY1, MUX_USB2PHY1),
+
+	/* USB2H */
+	STM32_GATE(CK_BUS_USBHOHCI, "ck_icn_m_usbhohci", IDX_ICN_HSL, 0, GATE_USBH,
+		   SEC_RIFSC(63)),
+	STM32_GATE(CK_BUS_USBHEHCI, "ck_icn_m_usbhehci", IDX_ICN_HSL, 0, GATE_USBH,
+		   SEC_RIFSC(63)),
+
+	/* USBOTG */
+	STM32_GATE(CK_BUS_OTG, "ck_icn_m_otg", IDX_ICN_HSL, 0, GATE_USBOTG,
+		   SEC_RIFSC(66)),
+
+	/* USB2PHY2 */
+	STM32_COMPOSITE_NODIV(CK_KER_USB2PHY2EN, "ck_ker_usb2phy2_en", 0, SEC_RIFSC(66),
+			      GATE_USB2PHY2, MUX_USB2PHY2),
+
+	/* VREF */
+	STM32_GATE(CK_BUS_VREF, "ck_icn_p_vref", IDX_ICN_APB3, 0, RCC_VREFCFGR,
+		   SEC_RIFSC(106)),
+
+	/* WWDG */
+	STM32_GATE(CK_BUS_WWDG1, "ck_icn_p_wwdg1", IDX_ICN_APB3, 0, GATE_WWDG1,
+		   SEC_RIFSC(104)),
+};
+
+static const struct stm32_clock_match_data stm32mp21_data = {
+	.tab_clocks	= stm32mp21_clock_cfg,
+	.num_clocks	= ARRAY_SIZE(stm32mp21_clock_cfg),
+	.clock_data = &(const struct clk_stm32_clock_data) {
+		.num_gates	= ARRAY_SIZE(stm32mp21_gates),
+		.gates		= stm32mp21_gates,
+		.muxes		= stm32mp21_muxes,
+	},
+	.check_security = stm32mp21_check_security,
+
+};
+
+static int stm32mp21_clk_probe(struct udevice *dev)
+{
+	fdt_addr_t base = dev_read_addr(dev->parent);
+	struct udevice *scmi;
+
+	if (base == FDT_ADDR_T_NONE)
+		return -EINVAL;
+
+	/* force SCMI probe to register all SCMI clocks */
+	uclass_get_device_by_driver(UCLASS_CLK, DM_DRIVER_GET(scmi_clock), &scmi);
+
+	stm32_rcc_init(dev, &stm32mp21_data);
+
+	return 0;
+}
+
+U_BOOT_DRIVER(stm32mp21_clock) = {
+	.name = "stm32mp21_clk",
+	.id = UCLASS_CLK,
+	.ops = &stm32_clk_ops,
+	.priv_auto = sizeof(struct stm32mp_rcc_priv),
+	.probe = stm32mp21_clk_probe,
+};
diff --git a/include/stm32mp21_rcc.h b/include/stm32mp21_rcc.h
new file mode 100644
index 00000000000..73863412720
--- /dev/null
+++ b/include/stm32mp21_rcc.h
@@ -0,0 +1,651 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause */
+/*
+ * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
+ * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
+ */
+
+#ifndef STM32MP21_RCC_H
+#define STM32MP21_RCC_H
+
+#define RCC_SECCFGR0				0x0
+#define RCC_SECCFGR1				0x4
+#define RCC_SECCFGR2				0x8
+#define RCC_SECCFGR3				0xC
+#define RCC_PRIVCFGR0				0x10
+#define RCC_PRIVCFGR1				0x14
+#define RCC_PRIVCFGR2				0x18
+#define RCC_PRIVCFGR3				0x1C
+#define RCC_RCFGLOCKR0				0x20
+#define RCC_RCFGLOCKR1				0x24
+#define RCC_RCFGLOCKR2				0x28
+#define RCC_RCFGLOCKR3				0x2C
+#define RCC_R0CIDCFGR				0x30
+#define RCC_R0SEMCR				0x34
+#define RCC_R1CIDCFGR				0x38
+#define RCC_R1SEMCR				0x3C
+#define RCC_R2CIDCFGR				0x40
+#define RCC_R2SEMCR				0x44
+#define RCC_R3CIDCFGR				0x48
+#define RCC_R3SEMCR				0x4C
+#define RCC_R4CIDCFGR				0x50
+#define RCC_R4SEMCR				0x54
+#define RCC_R5CIDCFGR				0x58
+#define RCC_R5SEMCR				0x5C
+#define RCC_R6CIDCFGR				0x60
+#define RCC_R6SEMCR				0x64
+#define RCC_R7CIDCFGR				0x68
+#define RCC_R7SEMCR				0x6C
+#define RCC_R8CIDCFGR				0x70
+#define RCC_R8SEMCR				0x74
+#define RCC_R9CIDCFGR				0x78
+#define RCC_R9SEMCR				0x7C
+#define RCC_R10CIDCFGR				0x80
+#define RCC_R10SEMCR				0x84
+#define RCC_R11CIDCFGR				0x88
+#define RCC_R11SEMCR				0x8C
+#define RCC_R12CIDCFGR				0x90
+#define RCC_R12SEMCR				0x94
+#define RCC_R13CIDCFGR				0x98
+#define RCC_R13SEMCR				0x9C
+#define RCC_R14CIDCFGR				0xA0
+#define RCC_R14SEMCR				0xA4
+#define RCC_R15CIDCFGR				0xA8
+#define RCC_R15SEMCR				0xAC
+#define RCC_R16CIDCFGR				0xB0
+#define RCC_R16SEMCR				0xB4
+#define RCC_R17CIDCFGR				0xB8
+#define RCC_R17SEMCR				0xBC
+#define RCC_R18CIDCFGR				0xC0
+#define RCC_R18SEMCR				0xC4
+#define RCC_R19CIDCFGR				0xC8
+#define RCC_R19SEMCR				0xCC
+#define RCC_R20CIDCFGR				0xD0
+#define RCC_R20SEMCR				0xD4
+#define RCC_R21CIDCFGR				0xD8
+#define RCC_R21SEMCR				0xDC
+#define RCC_R22CIDCFGR				0xE0
+#define RCC_R22SEMCR				0xE4
+#define RCC_R23CIDCFGR				0xE8
+#define RCC_R23SEMCR				0xEC
+#define RCC_R24CIDCFGR				0xF0
+#define RCC_R24SEMCR				0xF4
+#define RCC_R25CIDCFGR				0xF8
+#define RCC_R25SEMCR				0xFC
+#define RCC_R26CIDCFGR				0x100
+#define RCC_R26SEMCR				0x104
+#define RCC_R27CIDCFGR				0x108
+#define RCC_R27SEMCR				0x10C
+#define RCC_R28CIDCFGR				0x110
+#define RCC_R28SEMCR				0x114
+#define RCC_R29CIDCFGR				0x118
+#define RCC_R29SEMCR				0x11C
+#define RCC_R30CIDCFGR				0x120
+#define RCC_R30SEMCR				0x124
+#define RCC_R31CIDCFGR				0x128
+#define RCC_R31SEMCR				0x12C
+#define RCC_R32CIDCFGR				0x130
+#define RCC_R32SEMCR				0x134
+#define RCC_R33CIDCFGR				0x138
+#define RCC_R33SEMCR				0x13C
+#define RCC_R34CIDCFGR				0x140
+#define RCC_R34SEMCR				0x144
+#define RCC_R35CIDCFGR				0x148
+#define RCC_R35SEMCR				0x14C
+#define RCC_R36CIDCFGR				0x150
+#define RCC_R36SEMCR				0x154
+#define RCC_R37CIDCFGR				0x158
+#define RCC_R37SEMCR				0x15C
+#define RCC_R38CIDCFGR				0x160
+#define RCC_R38SEMCR				0x164
+#define RCC_R39CIDCFGR				0x168
+#define RCC_R39SEMCR				0x16C
+#define RCC_R40CIDCFGR				0x170
+#define RCC_R40SEMCR				0x174
+#define RCC_R41CIDCFGR				0x178
+#define RCC_R41SEMCR				0x17C
+#define RCC_R42CIDCFGR				0x180
+#define RCC_R42SEMCR				0x184
+#define RCC_R43CIDCFGR				0x188
+#define RCC_R43SEMCR				0x18C
+#define RCC_R44CIDCFGR				0x190
+#define RCC_R44SEMCR				0x194
+#define RCC_R45CIDCFGR				0x198
+#define RCC_R45SEMCR				0x19C
+#define RCC_R46CIDCFGR				0x1A0
+#define RCC_R46SEMCR				0x1A4
+#define RCC_R47CIDCFGR				0x1A8
+#define RCC_R47SEMCR				0x1AC
+#define RCC_R48CIDCFGR				0x1B0
+#define RCC_R48SEMCR				0x1B4
+#define RCC_R49CIDCFGR				0x1B8
+#define RCC_R49SEMCR				0x1BC
+#define RCC_R50CIDCFGR				0x1C0
+#define RCC_R50SEMCR				0x1C4
+#define RCC_R51CIDCFGR				0x1C8
+#define RCC_R51SEMCR				0x1CC
+#define RCC_R52CIDCFGR				0x1D0
+#define RCC_R52SEMCR				0x1D4
+#define RCC_R53CIDCFGR				0x1D8
+#define RCC_R53SEMCR				0x1DC
+#define RCC_R54CIDCFGR				0x1E0
+#define RCC_R54SEMCR				0x1E4
+#define RCC_R55CIDCFGR				0x1E8
+#define RCC_R55SEMCR				0x1EC
+#define RCC_R56CIDCFGR				0x1F0
+#define RCC_R56SEMCR				0x1F4
+#define RCC_R57CIDCFGR				0x1F8
+#define RCC_R57SEMCR				0x1FC
+#define RCC_R58CIDCFGR				0x200
+#define RCC_R58SEMCR				0x204
+#define RCC_R59CIDCFGR				0x208
+#define RCC_R59SEMCR				0x20C
+#define RCC_R60CIDCFGR				0x210
+#define RCC_R60SEMCR				0x214
+#define RCC_R61CIDCFGR				0x218
+#define RCC_R61SEMCR				0x21C
+#define RCC_R62CIDCFGR				0x220
+#define RCC_R62SEMCR				0x224
+#define RCC_R63CIDCFGR				0x228
+#define RCC_R63SEMCR				0x22C
+#define RCC_R64CIDCFGR				0x230
+#define RCC_R64SEMCR				0x234
+#define RCC_R65CIDCFGR				0x238
+#define RCC_R65SEMCR				0x23C
+#define RCC_R66CIDCFGR				0x240
+#define RCC_R66SEMCR				0x244
+#define RCC_R67CIDCFGR				0x248
+#define RCC_R67SEMCR				0x24C
+#define RCC_R68CIDCFGR				0x250
+#define RCC_R68SEMCR				0x254
+#define RCC_R69CIDCFGR				0x258
+#define RCC_R69SEMCR				0x25C
+#define RCC_R70CIDCFGR				0x260
+#define RCC_R70SEMCR				0x264
+#define RCC_R71CIDCFGR				0x268
+#define RCC_R71SEMCR				0x26C
+#define RCC_R73CIDCFGR				0x278
+#define RCC_R73SEMCR				0x27C
+#define RCC_R74CIDCFGR				0x280
+#define RCC_R74SEMCR				0x284
+#define RCC_R75CIDCFGR				0x288
+#define RCC_R75SEMCR				0x28C
+#define RCC_R76CIDCFGR				0x290
+#define RCC_R76SEMCR				0x294
+#define RCC_R77CIDCFGR				0x298
+#define RCC_R77SEMCR				0x29C
+#define RCC_R78CIDCFGR				0x2A0
+#define RCC_R78SEMCR				0x2A4
+#define RCC_R79CIDCFGR				0x2A8
+#define RCC_R79SEMCR				0x2AC
+#define RCC_R83CIDCFGR				0x2C8
+#define RCC_R83SEMCR				0x2CC
+#define RCC_R84CIDCFGR				0x2D0
+#define RCC_R84SEMCR				0x2D4
+#define RCC_R85CIDCFGR				0x2D8
+#define RCC_R85SEMCR				0x2DC
+#define RCC_R86CIDCFGR				0x2E0
+#define RCC_R86SEMCR				0x2E4
+#define RCC_R87CIDCFGR				0x2E8
+#define RCC_R87SEMCR				0x2EC
+#define RCC_R88CIDCFGR				0x2F0
+#define RCC_R88SEMCR				0x2F4
+#define RCC_R90CIDCFGR				0x300
+#define RCC_R90SEMCR				0x304
+#define RCC_R91CIDCFGR				0x308
+#define RCC_R91SEMCR				0x30C
+#define RCC_R92CIDCFGR				0x310
+#define RCC_R92SEMCR				0x314
+#define RCC_R93CIDCFGR				0x318
+#define RCC_R93SEMCR				0x31C
+#define RCC_R94CIDCFGR				0x320
+#define RCC_R94SEMCR				0x324
+#define RCC_R95CIDCFGR				0x328
+#define RCC_R95SEMCR				0x32C
+#define RCC_R96CIDCFGR				0x330
+#define RCC_R96SEMCR				0x334
+#define RCC_R97CIDCFGR				0x338
+#define RCC_R97SEMCR				0x33C
+#define RCC_R98CIDCFGR				0x340
+#define RCC_R98SEMCR				0x344
+#define RCC_R101CIDCFGR				0x358
+#define RCC_R101SEMCR				0x35C
+#define RCC_R102CIDCFGR				0x360
+#define RCC_R102SEMCR				0x364
+#define RCC_R103CIDCFGR				0x368
+#define RCC_R103SEMCR				0x36C
+#define RCC_R104CIDCFGR				0x370
+#define RCC_R104SEMCR				0x374
+#define RCC_R105CIDCFGR				0x378
+#define RCC_R105SEMCR				0x37C
+#define RCC_R106CIDCFGR				0x380
+#define RCC_R106SEMCR				0x384
+#define RCC_R108CIDCFGR				0x390
+#define RCC_R108SEMCR				0x394
+#define RCC_R109CIDCFGR				0x398
+#define RCC_R109SEMCR				0x39C
+#define RCC_R110CIDCFGR				0x3A0
+#define RCC_R110SEMCR				0x3A4
+#define RCC_R111CIDCFGR				0x3A8
+#define RCC_R111SEMCR				0x3AC
+#define RCC_R112CIDCFGR				0x3B0
+#define RCC_R112SEMCR				0x3B4
+#define RCC_R113CIDCFGR				0x3B8
+#define RCC_R113SEMCR				0x3BC
+#define RCC_GRSTCSETR				0x400
+#define RCC_C1RSTCSETR				0x404
+#define RCC_C2RSTCSETR				0x40C
+#define RCC_HWRSTSCLRR				0x410
+#define RCC_C1HWRSTSCLRR			0x414
+#define RCC_C2HWRSTSCLRR			0x418
+#define RCC_C1BOOTRSTSSETR			0x41C
+#define RCC_C1BOOTRSTSCLRR			0x420
+#define RCC_C2BOOTRSTSSETR			0x424
+#define RCC_C2BOOTRSTSCLRR			0x428
+#define RCC_C1SREQSETR				0x42C
+#define RCC_C1SREQCLRR				0x430
+#define RCC_CPUBOOTCR				0x434
+#define RCC_STBYBOOTCR				0x438
+#define RCC_LEGBOOTCR				0x43C
+#define RCC_BDCR				0x440
+#define RCC_RDCR				0x44C
+#define RCC_C1MSRDCR				0x450
+#define RCC_PWRLPDLYCR				0x454
+#define RCC_C1CIESETR				0x458
+#define RCC_C1CIFCLRR				0x45C
+#define RCC_C2CIESETR				0x460
+#define RCC_C2CIFCLRR				0x464
+#define RCC_IWDGC1FZSETR			0x468
+#define RCC_IWDGC1FZCLRR			0x46C
+#define RCC_IWDGC1CFGSETR			0x470
+#define RCC_IWDGC1CFGCLRR			0x474
+#define RCC_IWDGC2FZSETR			0x478
+#define RCC_IWDGC2FZCLRR			0x47C
+#define RCC_IWDGC2CFGSETR			0x480
+#define RCC_IWDGC2CFGCLRR			0x484
+#define RCC_MCO1CFGR				0x488
+#define RCC_MCO2CFGR				0x48C
+#define RCC_OCENSETR				0x490
+#define RCC_OCENCLRR				0x494
+#define RCC_OCRDYR				0x498
+#define RCC_HSICFGR				0x49C
+#define RCC_MSICFGR				0x4A0
+#define RCC_LSICR				0x4A4
+#define RCC_RTCDIVR				0x4A8
+#define RCC_APB1DIVR				0x4AC
+#define RCC_APB2DIVR				0x4B0
+#define RCC_APB3DIVR				0x4B4
+#define RCC_APB4DIVR				0x4B8
+#define RCC_APB5DIVR				0x4BC
+#define RCC_APBDBGDIVR				0x4C0
+#define RCC_TIMG1PRER				0x4C8
+#define RCC_TIMG2PRER				0x4CC
+#define RCC_LSMCUDIVR				0x4D0
+#define RCC_DDRCPCFGR				0x4D4
+#define RCC_DDRCAPBCFGR				0x4D8
+#define RCC_DDRPHYCAPBCFGR			0x4DC
+#define RCC_DDRPHYCCFGR				0x4E0
+#define RCC_DDRCFGR				0x4E4
+#define RCC_DDRITFCFGR				0x4E8
+#define RCC_SYSRAMCFGR				0x4F0
+#define RCC_SRAM1CFGR				0x4F8
+#define RCC_RETRAMCFGR				0x500
+#define RCC_BKPSRAMCFGR				0x504
+#define RCC_OSPI1CFGR				0x514
+#define RCC_FMCCFGR				0x51C
+#define RCC_DBGCFGR				0x520
+#define RCC_STMCFGR				0x524
+#define RCC_ETRCFGR				0x528
+#define RCC_GPIOACFGR				0x52C
+#define RCC_GPIOBCFGR				0x530
+#define RCC_GPIOCCFGR				0x534
+#define RCC_GPIODCFGR				0x538
+#define RCC_GPIOECFGR				0x53C
+#define RCC_GPIOFCFGR				0x540
+#define RCC_GPIOGCFGR				0x544
+#define RCC_GPIOHCFGR				0x548
+#define RCC_GPIOICFGR				0x54C
+#define RCC_GPIOZCFGR				0x558
+#define RCC_HPDMA1CFGR				0x55C
+#define RCC_HPDMA2CFGR				0x560
+#define RCC_HPDMA3CFGR				0x564
+#define RCC_IPCC1CFGR				0x570
+#define RCC_RTCCFGR				0x578
+#define RCC_SYSCPU1CFGR				0x580
+#define RCC_BSECCFGR				0x584
+#define RCC_PLL2CFGR1				0x590
+#define RCC_PLL2CFGR2				0x594
+#define RCC_PLL2CFGR3				0x598
+#define RCC_PLL2CFGR4				0x59C
+#define RCC_PLL2CFGR5				0x5A0
+#define RCC_PLL2CFGR6				0x5A8
+#define RCC_PLL2CFGR7				0x5AC
+#define RCC_HSIFMONCR				0x5E0
+#define RCC_HSIFVALR				0x5E4
+#define RCC_MSIFMONCR				0x5E8
+#define RCC_MSIFVALR				0x5EC
+#define RCC_TIM1CFGR				0x700
+#define RCC_TIM2CFGR				0x704
+#define RCC_TIM3CFGR				0x708
+#define RCC_TIM4CFGR				0x70C
+#define RCC_TIM5CFGR				0x710
+#define RCC_TIM6CFGR				0x714
+#define RCC_TIM7CFGR				0x718
+#define RCC_TIM8CFGR				0x71C
+#define RCC_TIM10CFGR				0x720
+#define RCC_TIM11CFGR				0x724
+#define RCC_TIM12CFGR				0x728
+#define RCC_TIM13CFGR				0x72C
+#define RCC_TIM14CFGR				0x730
+#define RCC_TIM15CFGR				0x734
+#define RCC_TIM16CFGR				0x738
+#define RCC_TIM17CFGR				0x73C
+#define RCC_LPTIM1CFGR				0x744
+#define RCC_LPTIM2CFGR				0x748
+#define RCC_LPTIM3CFGR				0x74C
+#define RCC_LPTIM4CFGR				0x750
+#define RCC_LPTIM5CFGR				0x754
+#define RCC_SPI1CFGR				0x758
+#define RCC_SPI2CFGR				0x75C
+#define RCC_SPI3CFGR				0x760
+#define RCC_SPI4CFGR				0x764
+#define RCC_SPI5CFGR				0x768
+#define RCC_SPI6CFGR				0x76C
+#define RCC_SPDIFRXCFGR				0x778
+#define RCC_USART1CFGR				0x77C
+#define RCC_USART2CFGR				0x780
+#define RCC_USART3CFGR				0x784
+#define RCC_UART4CFGR				0x788
+#define RCC_UART5CFGR				0x78C
+#define RCC_USART6CFGR				0x790
+#define RCC_UART7CFGR				0x794
+#define RCC_LPUART1CFGR				0x7A0
+#define RCC_I2C1CFGR				0x7A4
+#define RCC_I2C2CFGR				0x7A8
+#define RCC_I2C3CFGR				0x7AC
+#define RCC_SAI1CFGR				0x7C4
+#define RCC_SAI2CFGR				0x7C8
+#define RCC_SAI3CFGR				0x7CC
+#define RCC_SAI4CFGR				0x7D0
+#define RCC_MDF1CFGR				0x7D8
+#define RCC_FDCANCFGR				0x7E0
+#define RCC_HDPCFGR				0x7E4
+#define RCC_ADC1CFGR				0x7E8
+#define RCC_ADC2CFGR				0x7EC
+#define RCC_ETH1CFGR				0x7F0
+#define RCC_ETH2CFGR				0x7F4
+#define RCC_USBHCFGR				0x7FC
+#define RCC_USB2PHY1CFGR			0x800
+#define RCC_OTGCFGR				0x808
+#define RCC_USB2PHY2CFGR			0x80C
+#define RCC_STGENCFGR				0x824
+#define RCC_SDMMC1CFGR				0x830
+#define RCC_SDMMC2CFGR				0x834
+#define RCC_SDMMC3CFGR				0x838
+#define RCC_LTDCCFGR				0x840
+#define RCC_CSICFGR				0x858
+#define RCC_DCMIPPCFGR				0x85C
+#define RCC_DCMIPSSICFGR			0x860
+#define RCC_RNG1CFGR				0x870
+#define RCC_RNG2CFGR				0x874
+#define RCC_PKACFGR				0x878
+#define RCC_SAESCFGR				0x87C
+#define RCC_HASH1CFGR				0x880
+#define RCC_HASH2CFGR				0x884
+#define RCC_CRYP1CFGR				0x888
+#define RCC_CRYP2CFGR				0x88C
+#define RCC_IWDG1CFGR				0x894
+#define RCC_IWDG2CFGR				0x898
+#define RCC_IWDG3CFGR				0x89C
+#define RCC_IWDG4CFGR				0x8A0
+#define RCC_WWDG1CFGR				0x8A4
+#define RCC_VREFCFGR				0x8AC
+#define RCC_DTSCFGR				0x8B0
+#define RCC_CRCCFGR				0x8B4
+#define RCC_SERCCFGR				0x8B8
+#define RCC_DDRPERFMCFGR			0x8C0
+#define RCC_I3C1CFGR				0x8C8
+#define RCC_I3C2CFGR				0x8CC
+#define RCC_I3C3CFGR				0x8D0
+#define RCC_MUXSELCFGR				0x1000
+#define RCC_XBAR0CFGR				0x1018
+#define RCC_XBAR1CFGR				0x101C
+#define RCC_XBAR2CFGR				0x1020
+#define RCC_XBAR3CFGR				0x1024
+#define RCC_XBAR4CFGR				0x1028
+#define RCC_XBAR5CFGR				0x102C
+#define RCC_XBAR6CFGR				0x1030
+#define RCC_XBAR7CFGR				0x1034
+#define RCC_XBAR8CFGR				0x1038
+#define RCC_XBAR9CFGR				0x103C
+#define RCC_XBAR10CFGR				0x1040
+#define RCC_XBAR11CFGR				0x1044
+#define RCC_XBAR12CFGR				0x1048
+#define RCC_XBAR13CFGR				0x104C
+#define RCC_XBAR14CFGR				0x1050
+#define RCC_XBAR15CFGR				0x1054
+#define RCC_XBAR16CFGR				0x1058
+#define RCC_XBAR17CFGR				0x105C
+#define RCC_XBAR18CFGR				0x1060
+#define RCC_XBAR19CFGR				0x1064
+#define RCC_XBAR20CFGR				0x1068
+#define RCC_XBAR21CFGR				0x106C
+#define RCC_XBAR22CFGR				0x1070
+#define RCC_XBAR23CFGR				0x1074
+#define RCC_XBAR24CFGR				0x1078
+#define RCC_XBAR25CFGR				0x107C
+#define RCC_XBAR26CFGR				0x1080
+#define RCC_XBAR27CFGR				0x1084
+#define RCC_XBAR28CFGR				0x1088
+#define RCC_XBAR29CFGR				0x108C
+#define RCC_XBAR30CFGR				0x1090
+#define RCC_XBAR31CFGR				0x1094
+#define RCC_XBAR32CFGR				0x1098
+#define RCC_XBAR33CFGR				0x109C
+#define RCC_XBAR34CFGR				0x10A0
+#define RCC_XBAR35CFGR				0x10A4
+#define RCC_XBAR36CFGR				0x10A8
+#define RCC_XBAR37CFGR				0x10AC
+#define RCC_XBAR38CFGR				0x10B0
+#define RCC_XBAR39CFGR				0x10B4
+#define RCC_XBAR40CFGR				0x10B8
+#define RCC_XBAR41CFGR				0x10BC
+#define RCC_XBAR42CFGR				0x10C0
+#define RCC_XBAR43CFGR				0x10C4
+#define RCC_XBAR44CFGR				0x10C8
+#define RCC_XBAR45CFGR				0x10CC
+#define RCC_XBAR46CFGR				0x10D0
+#define RCC_XBAR47CFGR				0x10D4
+#define RCC_XBAR48CFGR				0x10D8
+#define RCC_XBAR49CFGR				0x10DC
+#define RCC_XBAR50CFGR				0x10E0
+#define RCC_XBAR51CFGR				0x10E4
+#define RCC_XBAR52CFGR				0x10E8
+#define RCC_XBAR53CFGR				0x10EC
+#define RCC_XBAR54CFGR				0x10F0
+#define RCC_XBAR55CFGR				0x10F4
+#define RCC_XBAR56CFGR				0x10F8
+#define RCC_XBAR57CFGR				0x10FC
+#define RCC_XBAR58CFGR				0x1100
+#define RCC_XBAR59CFGR				0x1104
+#define RCC_XBAR60CFGR				0x1108
+#define RCC_XBAR61CFGR				0x110C
+#define RCC_XBAR62CFGR				0x1110
+#define RCC_XBAR63CFGR				0x1114
+#define RCC_PREDIV0CFGR				0x1118
+#define RCC_PREDIV1CFGR				0x111C
+#define RCC_PREDIV2CFGR				0x1120
+#define RCC_PREDIV3CFGR				0x1124
+#define RCC_PREDIV4CFGR				0x1128
+#define RCC_PREDIV5CFGR				0x112C
+#define RCC_PREDIV6CFGR				0x1130
+#define RCC_PREDIV7CFGR				0x1134
+#define RCC_PREDIV8CFGR				0x1138
+#define RCC_PREDIV9CFGR				0x113C
+#define RCC_PREDIV10CFGR			0x1140
+#define RCC_PREDIV11CFGR			0x1144
+#define RCC_PREDIV12CFGR			0x1148
+#define RCC_PREDIV13CFGR			0x114C
+#define RCC_PREDIV14CFGR			0x1150
+#define RCC_PREDIV15CFGR			0x1154
+#define RCC_PREDIV16CFGR			0x1158
+#define RCC_PREDIV17CFGR			0x115C
+#define RCC_PREDIV18CFGR			0x1160
+#define RCC_PREDIV19CFGR			0x1164
+#define RCC_PREDIV20CFGR			0x1168
+#define RCC_PREDIV21CFGR			0x116C
+#define RCC_PREDIV22CFGR			0x1170
+#define RCC_PREDIV23CFGR			0x1174
+#define RCC_PREDIV24CFGR			0x1178
+#define RCC_PREDIV25CFGR			0x117C
+#define RCC_PREDIV26CFGR			0x1180
+#define RCC_PREDIV27CFGR			0x1184
+#define RCC_PREDIV28CFGR			0x1188
+#define RCC_PREDIV29CFGR			0x118C
+#define RCC_PREDIV30CFGR			0x1190
+#define RCC_PREDIV31CFGR			0x1194
+#define RCC_PREDIV32CFGR			0x1198
+#define RCC_PREDIV33CFGR			0x119C
+#define RCC_PREDIV34CFGR			0x11A0
+#define RCC_PREDIV35CFGR			0x11A4
+#define RCC_PREDIV36CFGR			0x11A8
+#define RCC_PREDIV37CFGR			0x11AC
+#define RCC_PREDIV38CFGR			0x11B0
+#define RCC_PREDIV39CFGR			0x11B4
+#define RCC_PREDIV40CFGR			0x11B8
+#define RCC_PREDIV41CFGR			0x11BC
+#define RCC_PREDIV42CFGR			0x11C0
+#define RCC_PREDIV43CFGR			0x11C4
+#define RCC_PREDIV44CFGR			0x11C8
+#define RCC_PREDIV45CFGR			0x11CC
+#define RCC_PREDIV46CFGR			0x11D0
+#define RCC_PREDIV47CFGR			0x11D4
+#define RCC_PREDIV48CFGR			0x11D8
+#define RCC_PREDIV49CFGR			0x11DC
+#define RCC_PREDIV50CFGR			0x11E0
+#define RCC_PREDIV51CFGR			0x11E4
+#define RCC_PREDIV52CFGR			0x11E8
+#define RCC_PREDIV53CFGR			0x11EC
+#define RCC_PREDIV54CFGR			0x11F0
+#define RCC_PREDIV55CFGR			0x11F4
+#define RCC_PREDIV56CFGR			0x11F8
+#define RCC_PREDIV57CFGR			0x11FC
+#define RCC_PREDIV58CFGR			0x1200
+#define RCC_PREDIV59CFGR			0x1204
+#define RCC_PREDIV60CFGR			0x1208
+#define RCC_PREDIV61CFGR			0x120C
+#define RCC_PREDIV62CFGR			0x1210
+#define RCC_PREDIV63CFGR			0x1214
+#define RCC_PREDIVSR1				0x1218
+#define RCC_PREDIVSR2				0x121C
+#define RCC_FINDIV0CFGR				0x1224
+#define RCC_FINDIV1CFGR				0x1228
+#define RCC_FINDIV2CFGR				0x122C
+#define RCC_FINDIV3CFGR				0x1230
+#define RCC_FINDIV4CFGR				0x1234
+#define RCC_FINDIV5CFGR				0x1238
+#define RCC_FINDIV6CFGR				0x123C
+#define RCC_FINDIV7CFGR				0x1240
+#define RCC_FINDIV8CFGR				0x1244
+#define RCC_FINDIV9CFGR				0x1248
+#define RCC_FINDIV10CFGR			0x124C
+#define RCC_FINDIV11CFGR			0x1250
+#define RCC_FINDIV12CFGR			0x1254
+#define RCC_FINDIV13CFGR			0x1258
+#define RCC_FINDIV14CFGR			0x125C
+#define RCC_FINDIV15CFGR			0x1260
+#define RCC_FINDIV16CFGR			0x1264
+#define RCC_FINDIV17CFGR			0x1268
+#define RCC_FINDIV18CFGR			0x126C
+#define RCC_FINDIV19CFGR			0x1270
+#define RCC_FINDIV20CFGR			0x1274
+#define RCC_FINDIV21CFGR			0x1278
+#define RCC_FINDIV22CFGR			0x127C
+#define RCC_FINDIV23CFGR			0x1280
+#define RCC_FINDIV24CFGR			0x1284
+#define RCC_FINDIV25CFGR			0x1288
+#define RCC_FINDIV26CFGR			0x128C
+#define RCC_FINDIV27CFGR			0x1290
+#define RCC_FINDIV28CFGR			0x1294
+#define RCC_FINDIV29CFGR			0x1298
+#define RCC_FINDIV30CFGR			0x129C
+#define RCC_FINDIV31CFGR			0x12A0
+#define RCC_FINDIV32CFGR			0x12A4
+#define RCC_FINDIV33CFGR			0x12A8
+#define RCC_FINDIV34CFGR			0x12AC
+#define RCC_FINDIV35CFGR			0x12B0
+#define RCC_FINDIV36CFGR			0x12B4
+#define RCC_FINDIV37CFGR			0x12B8
+#define RCC_FINDIV38CFGR			0x12BC
+#define RCC_FINDIV39CFGR			0x12C0
+#define RCC_FINDIV40CFGR			0x12C4
+#define RCC_FINDIV41CFGR			0x12C8
+#define RCC_FINDIV42CFGR			0x12CC
+#define RCC_FINDIV43CFGR			0x12D0
+#define RCC_FINDIV44CFGR			0x12D4
+#define RCC_FINDIV45CFGR			0x12D8
+#define RCC_FINDIV46CFGR			0x12DC
+#define RCC_FINDIV47CFGR			0x12E0
+#define RCC_FINDIV48CFGR			0x12E4
+#define RCC_FINDIV49CFGR			0x12E8
+#define RCC_FINDIV50CFGR			0x12EC
+#define RCC_FINDIV51CFGR			0x12F0
+#define RCC_FINDIV52CFGR			0x12F4
+#define RCC_FINDIV53CFGR			0x12F8
+#define RCC_FINDIV54CFGR			0x12FC
+#define RCC_FINDIV55CFGR			0x1300
+#define RCC_FINDIV56CFGR			0x1304
+#define RCC_FINDIV57CFGR			0x1308
+#define RCC_FINDIV58CFGR			0x130C
+#define RCC_FINDIV59CFGR			0x1310
+#define RCC_FINDIV60CFGR			0x1314
+#define RCC_FINDIV61CFGR			0x1318
+#define RCC_FINDIV62CFGR			0x131C
+#define RCC_FINDIV63CFGR			0x1320
+#define RCC_FINDIVSR1				0x1324
+#define RCC_FINDIVSR2				0x1328
+#define RCC_FCALCOBS0CFGR			0x1340
+#define RCC_FCALCOBS1CFGR			0x1344
+#define RCC_FCALCREFCFGR			0x1348
+#define RCC_FCALCCR1				0x134C
+#define RCC_FCALCCR2				0x1354
+#define RCC_FCALCSR				0x1358
+#define RCC_PLL4CFGR1				0x1360
+#define RCC_PLL4CFGR2				0x1364
+#define RCC_PLL4CFGR3				0x1368
+#define RCC_PLL4CFGR4				0x136C
+#define RCC_PLL4CFGR5				0x1370
+#define RCC_PLL4CFGR6				0x1378
+#define RCC_PLL4CFGR7				0x137C
+#define RCC_PLL5CFGR1				0x1388
+#define RCC_PLL5CFGR2				0x138C
+#define RCC_PLL5CFGR3				0x1390
+#define RCC_PLL5CFGR4				0x1394
+#define RCC_PLL5CFGR5				0x1398
+#define RCC_PLL5CFGR6				0x13A0
+#define RCC_PLL5CFGR7				0x13A4
+#define RCC_PLL6CFGR1				0x13B0
+#define RCC_PLL6CFGR2				0x13B4
+#define RCC_PLL6CFGR3				0x13B8
+#define RCC_PLL6CFGR4				0x13BC
+#define RCC_PLL6CFGR5				0x13C0
+#define RCC_PLL6CFGR6				0x13C8
+#define RCC_PLL6CFGR7				0x13CC
+#define RCC_PLL7CFGR1				0x13D8
+#define RCC_PLL7CFGR2				0x13DC
+#define RCC_PLL7CFGR3				0x13E0
+#define RCC_PLL7CFGR4				0x13E4
+#define RCC_PLL7CFGR5				0x13E8
+#define RCC_PLL7CFGR6				0x13F0
+#define RCC_PLL7CFGR7				0x13F4
+#define RCC_PLL8CFGR1				0x1400
+#define RCC_PLL8CFGR2				0x1404
+#define RCC_PLL8CFGR3				0x1408
+#define RCC_PLL8CFGR4				0x140C
+#define RCC_PLL8CFGR5				0x1410
+#define RCC_PLL8CFGR6				0x1418
+#define RCC_PLL8CFGR7				0x141C
+#define RCC_VERR				0xFFF4
+#define RCC_IDR					0xFFF8
+#define RCC_SIDR				0xFFFC
+
+#endif /* STM32MP21_RCC_H */

-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
