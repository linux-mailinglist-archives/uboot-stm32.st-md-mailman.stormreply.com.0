Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ML8vBCYngmnPPgMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 17:49:42 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7FDDC403
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 17:49:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BA93C87ECB;
	Tue,  3 Feb 2026 16:49:41 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013034.outbound.protection.outlook.com
 [40.107.162.34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79C18C87EC6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 16:49:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FBvWzka20XS9+Gr6k6+Bwk9Zo/MEAfwqY6YHq9BD+p+dOdu7o9a3AUbkBy2pQ7gNnfleadbPTXFq2yeHkRN+W16s1/AzHKVGWCrp2XZef0+4CTZYMFZXhJRmA5/D9FJVAN//hM2dH0keL6r0WrDxRnP7fgth/p19zW9L6pHcWnCgZ12Oi6OAhRpTeJE78lrY4Yv3mkifOGdJ2hlggbPMhuHARKeSbRk8C6kDevywzqaAOXxAZd2+feD5Jn0rSZM+bhhcWlI88fIlCSAaCBsfpZ5xXs4ocdvqUsx8qj7NqC5cDAHND2nFO8zA46Y1tbKjYMxohbE/KCF0P2CIwWrQIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mGhtjE6InNg1Vl8IinLb6Y0uE7Y1oAUs+K3KTWLEa/8=;
 b=MVzrDCe94uTxpKivtLi3O7rwqYCGznk/uocb/8OI22zyI5AKZtH/qLl9FpU8ZLRO9TG1aK6QTH5d/9XTSiZe1zTKk+idVMm9NvQkxc2Ehp1zVRTJlY+VcjYJjZXhC7O4UKft0kCWJaehgmWFhOy5dYIHCfK6a/bkG/lWQLhAA8G79/Ezi14k7ZPPSojrl6VGrfM9cNWfh12xNjiZtri1KzQ3krj10KJrAs38yozG6y38NSAuMa99mhA1ZgKLf+7ut0doR4H6+hVHZdDhD+v/EMg4n9yFSL8zaCouk6kotDHm7XI9I3uiYHf99rzU7tuQjLH2AjDmzrVnenUgWeb+VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mGhtjE6InNg1Vl8IinLb6Y0uE7Y1oAUs+K3KTWLEa/8=;
 b=ZjqEKoZxlthbJzaynvxryI8iNP4EUJXSr+N+PKVf2D8PQeHjtwb+q9MbK809pdxCYMbPPJeURGtb23ZDc22yydblIAc3gycP69TsyHP1WgM9ItD4tNdg1az5CdU6qjSQzEM239O2Tr66sc1kCDnAAHcdAhkxzJAV4vL9kzddJGlvArG1l56zdYE7tCO6wOIQ8AldPqnKffFGY/xLF3JMzGw87Aud5Uu3DsSMYc04E8kJhyS8A1CbRFrzy5zc1DMtr87qLoI1hq2AHBgkdJ5NIiZg3aeeXWwmbhVDKCGK6udaRNo1FHc3CpZmzq7FFkKqi9QGaJjBJBN8dYY+Rglhdw==
Received: from AS4P190CA0069.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:656::15)
 by AS1PR10MB5700.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:47c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 16:49:35 +0000
Received: from AM4PEPF00027A69.eurprd04.prod.outlook.com
 (2603:10a6:20b:656:cafe::6) by AS4P190CA0069.outlook.office365.com
 (2603:10a6:20b:656::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 16:49:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM4PEPF00027A69.mail.protection.outlook.com (10.167.16.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 16:49:35 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 3 Feb
 2026 17:51:21 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 3 Feb
 2026 17:49:34 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 3 Feb 2026 17:49:22 +0100
MIME-Version: 1.0
Message-ID: <20260203-upstream_add_stm32mp21_support-v1-2-48ca3409cce1@foss.st.com>
References: <20260203-upstream_add_stm32mp21_support-v1-0-48ca3409cce1@foss.st.com>
In-Reply-To: <20260203-upstream_add_stm32mp21_support-v1-0-48ca3409cce1@foss.st.com>
To: <u-boot@lists.denx.de>, <uboot-stm32@st-md-mailman.stormreply.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A69:EE_|AS1PR10MB5700:EE_
X-MS-Office365-Filtering-Correlation-Id: 00ffd80f-f54d-40e8-2f1b-08de634436a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K042cXdQbDIvZmEyNTRNY0hkZ255ZDFUTzV2UHRkZkZCd1JZRmlGOUlNK0Jj?=
 =?utf-8?B?aUpIbG1pU1U2UFpnRkxOMDc1UVcwd3dEYVBNMEJ2bVUxdlBRMnVLbnNIWUt6?=
 =?utf-8?B?cnhONFRDSjlRZWZvOThEcTllc0lMa2dBVnljNjY4NFBUVmFqQW1CbkNTc0FD?=
 =?utf-8?B?Y3NpMSt1SGFzNkRZZjI1dk9qeUhHMzAxUUdKeWFIWlBRWTUyT2QrUXBQWjVX?=
 =?utf-8?B?ZkF2bER2UDlVZC9SaVVOOHFYWXJ6dUJPYmpid09MTzRHSFVMaGEvMnd3N0Vq?=
 =?utf-8?B?dVZOQVEwcmJ4UXNZWVFtTGlUcUxETHJENU9WRDV4dkQyY2FMSnMxYmRmWlFE?=
 =?utf-8?B?NWc3VGNydkRvMXREajdiWkJzWkxKdEM1T2Q4OElZZGR3REZJUmRmZEVXbE1r?=
 =?utf-8?B?d0s0SEJuT1VOSGxTVHAyUDZXYTBFMEJCSHE3Si82blhHTFVkMWl0OEtETGw2?=
 =?utf-8?B?L01kMXZCUXhEaENxYlFWMnhGOEtQajdBWGI2ZnJiejBYQ1IzeGljZFd4M2ZT?=
 =?utf-8?B?Zk9LMkRiTmtnK0kxVDAxcGQvUE1JTjlqUmhpWEszOEJoSUhIR0k5TUdhWmFM?=
 =?utf-8?B?aGpDVkdDUHpsZTBxcFhWSkpYZHpNRkQzc0NhUm4zcjg5VCtlOHlsQW90SjFQ?=
 =?utf-8?B?SFczUlZOb0VSajg0T3hZQWY3Q1hEdFFiT1E1UUdHc1pSR29EeE5vTTJmNkQ2?=
 =?utf-8?B?REtIeUtaKzBWTHVTZTdLQ3duTlJJOE5PcUovUWtwNG4zbzRPZUtEYWJ6RzM2?=
 =?utf-8?B?NjFnREI5ZWNUbkVVWHRScUdKeDkzN3NTc0dTeVdjSnlnZEgvbFhiWE5UZXFY?=
 =?utf-8?B?ZVFzVEdkM0NjcFRUUzNUditQcUlJNmVZeU5qdHh5a083VTRwSUZGS1RVK1BM?=
 =?utf-8?B?T290K1VISWRFK2NsN2VtbHJlVzdJM2hhVzFRRlNCRWMzSmtFQ3RrVytOdUNJ?=
 =?utf-8?B?Zzc3M0NUb3ErcmN2aElPeWZGRWZDMFp6bUpxMVpkbGgwMnZrSDVxdkxjYWEx?=
 =?utf-8?B?aVlqZHFMSlhoQkdualc5THdsWHlacVBxWldUZDRJTndrWUQ4OWRDb3RFWkQz?=
 =?utf-8?B?ZjcxNk8vYTAxQ2FUWkNIUjNkM3JFV28wM0lXWDBUK2tkN0E4RTFnVlUvOTJy?=
 =?utf-8?B?ZTdrckRoSStIRFZyMEJhNkpvWHQ1MG5JeVhFS0dWRllWQmZ5dXY5dzhLVUNa?=
 =?utf-8?B?aU1DU1MzR2I2MXhldjFIMzlUQXRUaGtEeDdKbkRIaFU1VDJVTkhBUm5GQVFO?=
 =?utf-8?B?TytVRWdZZTZjNTdQdTlkOHgra2R3cUd5YkJOc2dySEdRVjFsRUJCVS90a1Av?=
 =?utf-8?B?dFhGR3pQd1hST1dqcklSVXhadEhaZnZWTXhneDJaQW9SM0JvY3FiaFM4Mk1y?=
 =?utf-8?B?ZS9LVkVHYWdid3czdlE2akRBaGNmbWZQWExGZFVQNWJ5Qk8wTVkxOElvWXBD?=
 =?utf-8?B?dEI1Nk9lVjEydTNNRDhvL2Y1UmRhRzFQTzNpdmpaeVc0bzd5Z0NJUFhlRGpO?=
 =?utf-8?B?ektmanFQa1ozWDlibU9oOHVZQS82eVl3emRpb0RlTnJWeENHamNGNTZ1ZFl1?=
 =?utf-8?B?QmFFWXlxOEtneVZJbFdZWkMvc0NuQU82Y1BZa0dyaXRQM2xyNVhtWEJoU2da?=
 =?utf-8?B?SmdCRTlmbVlxcTN3WGFQQnZ3MFdLZFlsQ0xYYStPVi9QSXdLOVBVWTNjZTdw?=
 =?utf-8?B?R3JuUGRoUVhjL2dGMnErTEg4aVVFNnEzTTF4WUlDZlhsMUI4dkpRbGFVcys5?=
 =?utf-8?B?TXJyTG9LeWtidUlyS0FCczV1aVF4bHpva0xRc1RGVXFQZUdyNFUvcDFDTGxt?=
 =?utf-8?B?dEpSdGphZlFIK0Q0M0NGSWM1UnZXb0lha09UY3Z0SFRpVFV5b1lRejhVa0Jz?=
 =?utf-8?B?UFpTZTFZSm5zcmZnOENNVDhhTWZXUW9RdHcyM2NSU3JnM3JqNVE1elJSZWJ2?=
 =?utf-8?B?aXVTQzAyRmlxbkNBd1AxRG5OK2xEUTFSV2NUdk0rWkRiWTM4Qnk4MW9WQ05X?=
 =?utf-8?B?RTNRaTROWllOajhlQXBmalU1UjF0OXlYa0lubnpUTVA1amphK1pONjBvWjQz?=
 =?utf-8?B?SU1JUHZLZXJ6YXhRdldXUWJsRWRxVDhTbDgwNnplQ0kycmpHWHBqNG1Fem4y?=
 =?utf-8?B?dUFDWVV3b3RLTTNHenZYdStvYXBmK0ZGa29RWnFlMW1aYllHWDBVZ3lZUkNT?=
 =?utf-8?Q?FOZZ4Ko6CGC2ZI5GLrDbCqy2bvKJSOv83sHLLmNNCUKt?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MuTZoTpmLK/nwQhcK/blFMzLCMjmOEX3w1VlUMnTMUgNazHiK42v6HUHxSqi5bv3kUpVJEEqAHbvzrWV6ThMUQvgu9DU977gb8AB9ExCbZr1bEj96j7Mm8xmRCq80XfYEjlGrvA4FGHXFJK1LYCErV1Zg0zZLLCGl5SNF5T6OW2f3sNcSUbsDQGgcsY5CSH3dToFK4vl+ib2e7rJg6HmtpzjlqMfNTZ2Ea959B/Z9vPhE0LjPqTNU3eDVBWvLdJrfEBqW7+2kTtuAV+PZgrHnCfiBuuqWdoMMo31PDK6kANNK7AexhGcwVIKmyV9Ze70FAxQPQN3468BADNE9x8R2bJ41IFUlfTMa4YBnzBWXdSEZlWEn/dnH/dTj8OZIrhdNFF+ecs1cGf/QAI5p4GOzxoj10SlflzfXtms29jEEus1EqBpRZUqgcoUr6GIDRmZ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 16:49:35.8001 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ffd80f-f54d-40e8-2f1b-08de634436a3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A69.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5700
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
Subject: [Uboot-stm32] [PATCH 2/7] reset: stm32mp21: add stm32mp21 reset
	driver
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
X-Rspamd-Queue-Id: EA7FDDC403
X-Rspamd-Action: no action

Implement STM32MP21 reset drivers using stm32-core-reset API.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 drivers/reset/stm32/Kconfig            |   7 ++
 drivers/reset/stm32/Makefile           |   1 +
 drivers/reset/stm32/stm32-reset-mp21.c | 136 +++++++++++++++++++++++++++++++++
 3 files changed, 144 insertions(+)

diff --git a/drivers/reset/stm32/Kconfig b/drivers/reset/stm32/Kconfig
index fdd88a6bfae..1bafba516af 100644
--- a/drivers/reset/stm32/Kconfig
+++ b/drivers/reset/stm32/Kconfig
@@ -14,6 +14,13 @@ config RESET_STM32MP1
 	  Support for reset controllers on STMicroelectronics STM32MP1 family SoCs.
 	  This reset driver is compatible with STM32MP13 and STM32MP15 SoCs.
 
+config RESET_STM32MP21
+	bool "Enable the STM32MP21 reset"
+	default y if STM32MP21X
+	help
+	  Support for reset controllers on STMicroelectronics STM32MP21 family SoCs.
+	  This reset driver is compatible with STM32MP21 SoCs.
+
 config RESET_STM32MP25
 	bool "Enable the STM32MP25 reset"
 	depends on STM32MP23X || STM32MP25X
diff --git a/drivers/reset/stm32/Makefile b/drivers/reset/stm32/Makefile
index c31ae524ba1..ac4d3c6fc8f 100644
--- a/drivers/reset/stm32/Makefile
+++ b/drivers/reset/stm32/Makefile
@@ -6,4 +6,5 @@ obj-y += stm32-reset-core.o
 
 obj-$(CONFIG_RESET_STM32) += stm32-reset.o
 obj-$(CONFIG_RESET_STM32MP1) += stm32-reset-mp1.o
+obj-$(CONFIG_RESET_STM32MP21) += stm32-reset-mp21.o
 obj-$(CONFIG_RESET_STM32MP25) += stm32-reset-mp25.o
diff --git a/drivers/reset/stm32/stm32-reset-mp21.c b/drivers/reset/stm32/stm32-reset-mp21.c
new file mode 100644
index 00000000000..7d169d7582f
--- /dev/null
+++ b/drivers/reset/stm32/stm32-reset-mp21.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
+/*
+ * Copyright (C) 2026, STMicroelectronics - All Rights Reserved
+ * Author(s): Gabriel Fernandez, <gabriel.fernandez@foss.st.com> for STMicroelectronics.
+ */
+
+#include <dm.h>
+#include <stm32-reset-core.h>
+#include <stm32mp21_rcc.h>
+#include <dt-bindings/reset/st,stm32mp21-rcc.h>
+
+/* Reset clear offset for STM32MP RCC */
+#define RCC_CLR_OFFSET			0x4
+
+/* Timeout for deassert */
+#define STM32_DEASSERT_TIMEOUT_US	10000
+
+#define RESET(id, _offset, _bit_idx, _set_clr)		\
+	[id] = &(struct stm32_reset_cfg){		\
+		.offset		= (_offset),		\
+		.bit_idx	= (_bit_idx),		\
+		.set_clr	= (_set_clr),		\
+	}
+
+static const struct stm32_reset_cfg *stm32mp21_reset[] = {
+	RESET(TIM1_R,		RCC_TIM1CFGR,		0,	0),
+	RESET(TIM2_R,		RCC_TIM2CFGR,		0,	0),
+	RESET(TIM3_R,		RCC_TIM3CFGR,		0,	0),
+	RESET(TIM4_R,		RCC_TIM4CFGR,		0,	0),
+	RESET(TIM5_R,		RCC_TIM5CFGR,		0,	0),
+	RESET(TIM6_R,		RCC_TIM6CFGR,		0,	0),
+	RESET(TIM7_R,		RCC_TIM7CFGR,		0,	0),
+	RESET(TIM8_R,		RCC_TIM8CFGR,		0,	0),
+	RESET(TIM10_R,		RCC_TIM10CFGR,		0,	0),
+	RESET(TIM11_R,		RCC_TIM11CFGR,		0,	0),
+	RESET(TIM12_R,		RCC_TIM12CFGR,		0,	0),
+	RESET(TIM13_R,		RCC_TIM13CFGR,		0,	0),
+	RESET(TIM14_R,		RCC_TIM14CFGR,		0,	0),
+	RESET(TIM15_R,		RCC_TIM15CFGR,		0,	0),
+	RESET(TIM16_R,		RCC_TIM16CFGR,		0,	0),
+	RESET(TIM17_R,		RCC_TIM17CFGR,		0,	0),
+	RESET(LPTIM1_R,		RCC_LPTIM1CFGR,		0,	0),
+	RESET(LPTIM2_R,		RCC_LPTIM2CFGR,		0,	0),
+	RESET(LPTIM3_R,		RCC_LPTIM3CFGR,		0,	0),
+	RESET(LPTIM4_R,		RCC_LPTIM4CFGR,		0,	0),
+	RESET(LPTIM5_R,		RCC_LPTIM5CFGR,		0,	0),
+	RESET(SPI1_R,		RCC_SPI1CFGR,		0,	0),
+	RESET(SPI2_R,		RCC_SPI2CFGR,		0,	0),
+	RESET(SPI3_R,		RCC_SPI3CFGR,		0,	0),
+	RESET(SPI4_R,		RCC_SPI4CFGR,		0,	0),
+	RESET(SPI5_R,		RCC_SPI5CFGR,		0,	0),
+	RESET(SPI6_R,		RCC_SPI6CFGR,		0,	0),
+	RESET(SPDIFRX_R,	RCC_SPDIFRXCFGR,	0,	0),
+	RESET(USART1_R,		RCC_USART1CFGR,		0,	0),
+	RESET(USART2_R,		RCC_USART2CFGR,		0,	0),
+	RESET(USART3_R,		RCC_USART3CFGR,		0,	0),
+	RESET(UART4_R,		RCC_UART4CFGR,		0,	0),
+	RESET(UART5_R,		RCC_UART5CFGR,		0,	0),
+	RESET(USART6_R,		RCC_USART6CFGR,		0,	0),
+	RESET(UART7_R,		RCC_UART7CFGR,		0,	0),
+	RESET(LPUART1_R,	RCC_LPUART1CFGR,	0,	0),
+	RESET(I2C1_R,		RCC_I2C1CFGR,		0,	0),
+	RESET(I2C2_R,		RCC_I2C2CFGR,		0,	0),
+	RESET(I2C3_R,		RCC_I2C3CFGR,		0,	0),
+	RESET(SAI1_R,		RCC_SAI1CFGR,		0,	0),
+	RESET(SAI2_R,		RCC_SAI2CFGR,		0,	0),
+	RESET(SAI3_R,		RCC_SAI3CFGR,		0,	0),
+	RESET(SAI4_R,		RCC_SAI4CFGR,		0,	0),
+	RESET(MDF1_R,		RCC_MDF1CFGR,		0,	0),
+	RESET(FDCAN_R,		RCC_FDCANCFGR,		0,	0),
+	RESET(HDP_R,		RCC_HDPCFGR,		0,	0),
+	RESET(ADC1_R,		RCC_ADC1CFGR,		0,	0),
+	RESET(ADC2_R,		RCC_ADC2CFGR,		0,	0),
+	RESET(ETH1_R,		RCC_ETH1CFGR,		0,	0),
+	RESET(ETH2_R,		RCC_ETH2CFGR,		0,	0),
+	RESET(USBH_R,		RCC_USBHCFGR,		0,	0),
+	RESET(USB2PHY1_R,	RCC_USB2PHY1CFGR,	0,	0),
+	RESET(USB2PHY2_R,	RCC_USB2PHY2CFGR,	0,	0),
+	RESET(SDMMC1_R,		RCC_SDMMC1CFGR,		0,	0),
+	RESET(SDMMC1DLL_R,	RCC_SDMMC1CFGR,		16,	0),
+	RESET(SDMMC2_R,		RCC_SDMMC2CFGR,		0,	0),
+	RESET(SDMMC2DLL_R,	RCC_SDMMC2CFGR,		16,	0),
+	RESET(SDMMC3_R,		RCC_SDMMC3CFGR,		0,	0),
+	RESET(SDMMC3DLL_R,	RCC_SDMMC3CFGR,		16,	0),
+	RESET(LTDC_R,		RCC_LTDCCFGR,		0,	0),
+	RESET(CSI_R,		RCC_CSICFGR,		0,	0),
+	RESET(DCMIPP_R,		RCC_DCMIPPCFGR,		0,	0),
+	RESET(DCMIPSSI_R,	RCC_DCMIPSSICFGR,	0,	0),
+	RESET(WWDG1_R,		RCC_WWDG1CFGR,		0,	0),
+	RESET(VREF_R,		RCC_VREFCFGR,		0,	0),
+	RESET(DTS_R,		RCC_DTSCFGR,		0,	0),
+	RESET(CRC_R,		RCC_CRCCFGR,		0,	0),
+	RESET(SERC_R,		RCC_SERCCFGR,		0,	0),
+	RESET(I3C1_R,		RCC_I3C1CFGR,		0,	0),
+	RESET(I3C2_R,		RCC_I3C2CFGR,		0,	0),
+	RESET(IWDG2_KER_R,	RCC_IWDGC1CFGSETR,	18,	1),
+	RESET(IWDG4_KER_R,	RCC_IWDGC2CFGSETR,	18,	1),
+	RESET(RNG1_R,		RCC_RNG1CFGR,		0,	0),
+	RESET(RNG2_R,		RCC_RNG2CFGR,		0,	0),
+	RESET(PKA_R,		RCC_PKACFGR,		0,	0),
+	RESET(SAES_R,		RCC_SAESCFGR,		0,	0),
+	RESET(HASH1_R,		RCC_HASH1CFGR,		0,	0),
+	RESET(HASH2_R,		RCC_HASH2CFGR,		0,	0),
+	RESET(CRYP1_R,		RCC_CRYP1CFGR,		0,	0),
+	RESET(CRYP2_R,		RCC_CRYP2CFGR,		0,	0),
+	RESET(OTG_R,		RCC_OTGCFGR,		0,	0),
+};
+
+static const struct stm32_reset_cfg *stm32_get_reset_line(struct reset_ctl *reset_ctl)
+{
+	unsigned long id = reset_ctl->id;
+
+	if (id < ARRAY_SIZE(stm32mp21_reset))
+		return stm32mp21_reset[id];
+
+	return NULL;
+}
+
+static const struct stm32_reset_data stm32mp21_reset_data = {
+	.get_reset_line	= stm32_get_reset_line,
+	.clear_offset	= RCC_CLR_OFFSET,
+	.reset_us	= STM32_DEASSERT_TIMEOUT_US,
+};
+
+static int stm32_reset_probe(struct udevice *dev)
+{
+	return stm32_reset_core_probe(dev, &stm32mp21_reset_data);
+}
+
+U_BOOT_DRIVER(stm32mp21_rcc_reset) = {
+	.name		= "stm32mp21_reset",
+	.id		= UCLASS_RESET,
+	.probe		= stm32_reset_probe,
+	.priv_auto	= sizeof(struct stm32_reset_priv),
+	.ops		= &stm32_reset_ops,
+};

-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
