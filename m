Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id LXphAXA5e2mNCgIAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Jan 2026 11:41:52 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8ADAEF5E
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Jan 2026 11:41:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BAF8BC57A50;
	Thu, 29 Jan 2026 10:32:10 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011009.outbound.protection.outlook.com [52.101.70.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C21A3C1A97C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jan 2026 10:32:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wg0cpMsWHfw1fGxf6cPUT8AP/KqA7Ccz63JjCGY0baFgD6IYUoo08gf+gtmzrp7huk3RhWFmBjX6MO9KFXPJBYuLqRc9NFWW5pYptSCHnpml6F7MUSSNjgLQoaRTzUB2+20cCX4Zra0blcKnSFLCva1hCoI6Mvx5530GdM5Cn+Zc7BwvdQAW2QtJwzbCqoiJvlQrTV9498I99b1MKXTarLLuTm04eymDeYVZt2yM+FMF45UXVjvh7q2WK8AW99BvYEVEovTBtyimImWxOtETTAzGDKubYDcmmu+/hjTYRu8UovclRpqK7EiLJqyBFmg2HCxBMHvpVqK3qM+gl2nxAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FpxX+AuR+/XNfpD74v5dB8iiqCT2gbTSJJEbF+l6lqA=;
 b=ogDyHPEdxTuIWX+yBZbM7KJljFtMB8iTKC9vobJnj7zhp3ucToNjR967nlreyG5q50+jK7mNNZ1zIeNS5FyI+CRCR6Ne1CdIqC8S8fWDM9NTKFEkQ9T6iazJyz8dOpVE1W48vmNzmj3IsjzQfV/c3Mz9XyIqcgpBzBsr0nEKycrCerCyxTFXoppvmN6xfyW+kcsMM0t3diQqaR/xLGzBQctU7y/6mPkmWhQM1DZRjO2HGCASH4cxvKEKE35RXXC244pL2SPuTglfNu+Bo55lB7b2llVcfsejf9GYkJhC0uNvbTsYpOolvT4q3CkfDEWt8T5cv5/E1f7lXfkC4TaQZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FpxX+AuR+/XNfpD74v5dB8iiqCT2gbTSJJEbF+l6lqA=;
 b=MtAMl5z+YM0QtAzleooVJ/wJj6tytb9+sKPTxMCDbDkRuj9B0e4+EzqDJJrhInGQ1UsWMM06EHspveJk4CgqZrdR73GXkxbl6/a6UCZWThsl3GGO4d/e824/D76ObPLEjlZNpXZXi23zLMDwx6A9kYB1gEmPz6x4PcSWH463zGdwdgMySUSf19l+sJ9L7SOcLwo7Vye/soeIueQ8s4PhX4DPiXhP+3xiCmwk2aW+KhvQGwAHJV4PNE/VX6rWvOFLbpAPZaBP565EZMJ143DmTNFdNnT9Lm0ZOo9JcY4tHZoD93TTjxlCDJYAH2EGyYlhtiMGXaAO9T7WMFuqtliOIA==
Received: from DB9PR01CA0006.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::11) by VI0PR10MB8716.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:213::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 10:32:05 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:1d8:cafe::f4) by DB9PR01CA0006.outlook.office365.com
 (2603:10a6:10:1d8::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.10 via Frontend Transport; Thu,
 29 Jan 2026 10:31:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 10:32:05 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 29 Jan
 2026 11:33:48 +0100
Received: from [10.48.86.129] (10.48.86.129) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 29 Jan
 2026 11:32:04 +0100
Message-ID: <23ee924a-4135-46cd-8793-81c228fd65ad@foss.st.com>
Date: Thu, 29 Jan 2026 11:32:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Marek Vasut <marex@nabladev.com>, <u-boot@lists.denx.de>
References: <20260108021645.518220-1-marex@nabladev.com>
 <fce4a08f-38ca-4514-a4a3-280bdc81ff6e@foss.st.com>
Content-Language: en-US
In-Reply-To: <fce4a08f-38ca-4514-a4a3-280bdc81ff6e@foss.st.com>
X-Originating-IP: [10.48.86.129]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FA:EE_|VI0PR10MB8716:EE_
X-MS-Office365-Filtering-Correlation-Id: e259880a-0cb7-4c92-b524-08de5f21a5eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFI4QlU1UkJoTHB5Ukt4WFR1ZzZyaDh1c1pacGZ1WU1iSVRzNkhvcTJuekhu?=
 =?utf-8?B?cjBJS1hiSk91dGRKSzlqdEJzZ2dVTG5BLzhWa1VzZ3haSnlBWUFDWENkZXNY?=
 =?utf-8?B?OEZ2YWZtMkJwVi9zN2g5alhCSE9uR0gwS0Jndis5SXQvNlhUeXhzTmgvWi9E?=
 =?utf-8?B?a0RXYW5xcDIvd1BkNk9wWHdidE1yQkZIR0YrWnh2THVTdEk3enQvbWVodm1W?=
 =?utf-8?B?TGxQeklTdFg0dVF0M3c4eFhCVFNqMUZzcmRpZnlsT2NkQkovRGhkQ0UwMzhC?=
 =?utf-8?B?Mnl4QUVzSUtSR3NORnNRdUxkYXJ1bm5kY2w3MkpRUHFsamEremtIckVsMmxK?=
 =?utf-8?B?UGNKa2NHMkNvMSt3enY4dVBicHB3RWRTRG1YMW9GZVVITTUycmdsZFF1SUZN?=
 =?utf-8?B?Q0JicDlEVmIvK2VxaE13TkdiOFhWckRQS1RXL0Q4T3B2SDZYZGs5S0RNS3V5?=
 =?utf-8?B?eHVleWxGenIyOVR6Y0tNYmJmbXhMbERmUzhsSSt5QWU4NEhqRTd1RkQ2Q2p3?=
 =?utf-8?B?cGw4bmJhSGRiZ1hubDZlOFVPQkh1YTFMV1RwR1Y2Yko4R1dRNC9CRStnRnFZ?=
 =?utf-8?B?U3c2RDQ5UFZzbVU0TGQxeklNaGQvdWJYSHFySHNWM0YvUlQ2dUdYdjZTV1hK?=
 =?utf-8?B?bzliSG1lSEFZWkZzcnc1N1lrWnBPaGVHdGFXR1pVL1dQN2Z1QVBqbllXMDNj?=
 =?utf-8?B?VkU1WE5iZUVPTXhzcSsydC83bzhsU09qSkhway9WNVBlUUZNeFcvb25WTWhS?=
 =?utf-8?B?bW5aQjFzYyt2M2lLQkxwb2JrUXNmekk4aS9QMjI2cVlxcUY3Qk1sOU1sYkNs?=
 =?utf-8?B?RUZ3TnNNdXEvZFByZng0ZWxjWnBVUFlDTlUrbTBCQXhvN1BITHFSV0thTGFo?=
 =?utf-8?B?a0hCNVZJcU52cE1RZWxhNXc1K3gvNHVPbXRhcktuOHFpbUpPd1VYUkgzVzBG?=
 =?utf-8?B?cnkyT3RsMDJadHRzbGJ4U0hiQnBSNFhQQm52Y0E4UFhrVndjVXF3ZkRsWWlK?=
 =?utf-8?B?bGNodlJtUGlqaWpOQW9OOWFOUUs1bnA5cHE4eHUra0xxNXlZZWlnbmZ6bEFU?=
 =?utf-8?B?N2h6K1dhcUMwdWJoeW5qQmdDY2wrRzExRHdPZHBLWE95ZEpFMkZMV1hFK0ln?=
 =?utf-8?B?WVA0VHdFRHMwQmlINWlWVVY5OUpNc3czakt1ZzQ4Q0JLQ3g4RTEwdlpuVjRq?=
 =?utf-8?B?c0YvV0dqenBIM1NvSXcyTXU2R1dnWlBBKzlZMHNYWFJiL0ZsN0lNTzNpdHp0?=
 =?utf-8?B?ckpsVXpFKzBrdi9QNGZOdlQ5WUZ5ZEc0OFNWM2Yyc29veC9MSXhaK2hBMHAv?=
 =?utf-8?B?NXhMQTkwdThqa0RzQzdCdVQ2QlFjb0VsRmhMR3FGUVlHNlFIL3BvMVRnQStj?=
 =?utf-8?B?Ui83ZXdUN0Ixc3pZdWIxdXZSbm9sUVRmYlNNQ3hDZE0zVE82bXFlS3MyRXFN?=
 =?utf-8?B?QzNrdVVPT2xjNXhuUThsZFhNcGRad2pRck1udGRnNnpIWlA3cGEzWGMxbGJx?=
 =?utf-8?B?dUtaS2txOHBDZUZMRzZlWXF3ZS9TL2kyUG51VGxHQjhSeU5qT1MvUDIyNnAx?=
 =?utf-8?B?YnJXekRSN1Q0a1ZtSXJJdDQvVS85NFA2bGxTRVl5OERJWHJkOEl0eWpxdUI4?=
 =?utf-8?B?VE41OW9FVEJqQlhaQTRlQlB0R01ROUhLemRudS8vUDZETUR1dVloZndseXFM?=
 =?utf-8?B?QmpVMDl5SnFkcW1YcmthWDcyZ1ljSWsxL0FWa0s1VGpiM1ZCWUNFajBhZ1Zs?=
 =?utf-8?B?akxFOVIySzNhZkkxbzAwVUVzUzRoL2tKZVkyNXJiaStoSlN5TEtoRWZEWmZ5?=
 =?utf-8?B?SWdOZW1yTlBlUU9zRnpqcTczRlZmZTVYTGNtVVdTc1Vabnk5NEhtU2JsTVZC?=
 =?utf-8?B?RGNIZ04rMGpDcDkyeEduWk9VVmxDQnRIV1pocWFTaFVqMkJEZHBjRi81OHAz?=
 =?utf-8?B?VjVtdE5GUGpWeHd6ZmdIa1BBUHBGeWRIemw2Qm00Z0MwQzU0bkhtTkVZZzh5?=
 =?utf-8?B?ZlRxc3dOTE5tbjVEWHF0OFJyNENhS1k4K3MxT1Z1c0RpYUQrNzUrV2lHa3N4?=
 =?utf-8?B?YWNmQzVjUkJScDdBWGtzQ2ZtT1pBL055ZzNGUHI1RlFmUk9XclczSVlJcU9h?=
 =?utf-8?B?WjF6blVYNDM4K1BNUXp5ZEJ0b1IwNFJHV04xMlYvSXU2bFdyOHFKRVJPUVNq?=
 =?utf-8?Q?7ntUGu8smOJ8hqNn6afh+dE=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: MJwEW6ialJgkIOb98h5KIUnVWAG3shZGYUKyDbjGKrCo9iXC/wB1kPZqSX8rNkfuUUahVo3N5lavpIawHFHX4XmWdXqComzpRgWVQvBbtf2Mx13v2FKBRv4B4H/LTZK7TLpiEFnfEnQRy8RDfMj0mSMUlPEq099aI9YMg3wy1Z1+67b+3oOm5pHMujxRYrsFFwGK3Er2JucXJdEj76/vqRRiciRu8zud8XRWNbCoDLH0TJMsjWW/yDF3qlq2LuXR3cOm4A63sqLNK3RazL2gtSNabF0ijaqHA5S0aDcm9QzbXnf7aN4W0M2dkHmSMR2RFtuNyfkrvP939ONrp6VYV+DONPFxdb/q8iBGScd/bQeop46wEPlX1+IDs84OpbrItw5Job1iskVMn5Cjk6eMO438bt+FEVnOP9rjOUDBnfGCmLfNwccgM5dX2lhSmD30UmFoX0S+PYzC+F30QGnUgoomlvyf/CbKEgo0pnD1fqq3J+jgeBMToVoV4OUpjXCgv4LWE7p+XnlFOhHUJPC76bDAOABkdTOkeNz+WfzcREU4mg4hQKThTdyL0hPyZWmnXei4ThFXXwYgLYFdaox4h8tcpjarLaJIbci+L4Uc9YOljXXHWm5NB5nVB1uzz8SKqrwU0vYCvM4eTPWy3RcnuG8RfAvlYr4u/7IEw8U7qVnx6EJMfFKw/wuTRh6lGdJRBiOFBKXsrpzYp4IAtdB1qA==
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 10:32:05.4306 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e259880a-0cb7-4c92-b524-08de5f21a5eb
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8716
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Antonio Borneo <antonio.borneo@foss.st.com>,
 u-boot@dh-electronics.com, uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Use CONFIG_STM32MP15X to
 discern STM32MP15xx on DH STM32MP15xx DHSOM
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
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,st-md-mailman.stormreply.com:rdns,st.com:email,denx.de:email,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,nabladev.com:email,dh-electronics.com:email];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:marex@nabladev.com,m:u-boot@lists.denx.de,m:patrick.delaunay@foss.st.com,m:trini@konsulko.com,m:antonio.borneo@foss.st.com,m:u-boot@dh-electronics.com,m:uboot-stm32@st-md-mailman.stormreply.com,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8D8ADAEF5E
X-Rspamd-Action: no action



On 1/19/26 09:49, Patrice CHOTARD wrote:
> 
> 
> On 1/8/26 03:16, Marek Vasut wrote:
>> Use plain CONFIG_STM32MP15X to discern code which is specific to
>> STM32MP15xx in DH STM32MP1 DHSOM board files.
>>
>> Signed-off-by: Marek Vasut <marex@nabladev.com>
>> ---
>> Cc: Antonio Borneo <antonio.borneo@foss.st.com>
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Cc: Tom Rini <trini@konsulko.com>
>> Cc: u-boot@dh-electronics.com
>> Cc: u-boot@lists.denx.de
>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>> ---
>>  board/dhelectronics/dh_stm32mp1/board.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
>> index 55526189d5a..90590d14941 100644
>> --- a/board/dhelectronics/dh_stm32mp1/board.c
>> +++ b/board/dhelectronics/dh_stm32mp1/board.c
>> @@ -314,7 +314,7 @@ int board_stm32mp1_ddr_config_name_match(struct udevice *dev,
>>  			return 0;
>>  	}
>>  
>> -	if (IS_ENABLED(CONFIG_TARGET_DH_STM32MP15X)) {
>> +	if (IS_ENABLED(CONFIG_STM32MP15X)) {
>>  		if (ddr3code == 1 &&
>>  		    !strcmp(name, "st,ddr3l-dhsom-1066-888-bin-g-2x1gb-533mhz"))
>>  			return 0;
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice

Applied to u-boot-stm32/master

Thanks
Patrice

> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
