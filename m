Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGjPGe2pnWmgQwQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 14:38:53 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9F5187D93
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 14:38:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 598CCC8F288;
	Tue, 24 Feb 2026 13:38:52 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013009.outbound.protection.outlook.com
 [40.107.162.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D995C8F285
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 13:38:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nUbxjLFbjYBTSBcx9fdCaEV0oDAG5zC1DsFMgDIrFnGzzYgd4C7jGAqY9c4B8bgxsJ2mSPm8phrcL1+v5QjuT0s5Bn0y3EWwiHdXjy9Vw4GNNMq1fhAjER57sp1FlZ6fcjrSoj8XLP1gia3FsyuTP5s5ZunPxE8I05d5qA/WBpyhNCeo06Tiy5VZNaGsvsx3NW/mktJxjF7cDr6LVNYEyYSyqzUrVpWV+axHfavT8odTY7bplAt0Jp0o4AP2sB+CuFp6EFlzrjVNYVwjApifU91rnjitnTLVdeaeJj0MEpuPGTNpM8x6lT4g782uoh61ELUqAmPZJYZsICj/3btgWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZ+aXph4v9Un7Nj5X0WZmuQmdqY1iigAeFqaiKhgLtY=;
 b=S3qWlNEJ8lUr31SYgYRvRCh3vOmuZ4BqW+ESHM3tojVdXfCTeM/BBdZfZ6JKlhFlZ7JEQs/aGCPGGNaECqIxOaR3MAtU5A8nlxobQX86F18RQrx0KKQoawTLbbQKAh7fReSWYcJ+hNwZR7MPV1/WQ2UZTfLhsFuvqzydmPZX/pMBmnLfeKXr6dVKTPlnj+A5BlDyy7hJGw3UbXiDCbO2gXnClBw4kv40YRgNjhf/BPc7iAPktH7e//7yaaQHCU3H3KhBqSop7tQfjVTXzLpCm8LJ6+CgzLa7uEfe2KIWzei691WkmlZrMy8MOC8dUvGmlkFz2vYu1XPegp3edp9QTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZ+aXph4v9Un7Nj5X0WZmuQmdqY1iigAeFqaiKhgLtY=;
 b=D8r5Rw+a/r4q5r0sfU1H+2idjrKTBVYkUrWyhu+3gUB9lL76MkWu3PK21DhyCRAy5j+Ny35EpOuBHXKmx+Lybbs9pIhGl+OyPz2QHliQiegKR4pTXCPOpQoySKc7zYk4LEvGnAsUc11o8vPyMq5X4efHxz/br3CC8lu1oF3wg/jCGg2WpS0BBMKyOVI9bTSXY0F1M6LW3b6whiUHUpwxf63UcfQUbvMIchi5cngWZEXr1LmS78odfuS9gn9uWB/MrNTHDdrVZVwU1wiXlDnABGWZdUGzRZX7Ajq5+1+8vtkNz1ikhVSA1G/8SxgS6GjD6mzhqPuZepskjJGlY9POiA==
Received: from AS4P250CA0028.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5e3::16)
 by DB9PR10MB8215.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4c6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 13:38:45 +0000
Received: from AMS1EPF00000091.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e3:cafe::5c) by AS4P250CA0028.outlook.office365.com
 (2603:10a6:20b:5e3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 13:38:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000091.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 13:38:45 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 14:40:52 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 14:38:44 +0100
Message-ID: <5ef95638-894c-4919-8ad5-750a1c35c4fd@foss.st.com>
Date: Tue, 24 Feb 2026 14:38:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>,
 <uboot-stm32@st-md-mailman.stormreply.com>
References: <20260203-upstream_add_stm32mp21_support-v1-0-48ca3409cce1@foss.st.com>
 <20260203-upstream_add_stm32mp21_support-v1-5-48ca3409cce1@foss.st.com>
 <3c678260-1859-42cc-8f84-0e0682f64b59@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <3c678260-1859-42cc-8f84-0e0682f64b59@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000091:EE_|DB9PR10MB8215:EE_
X-MS-Office365-Filtering-Correlation-Id: f150e9a2-1dc5-4341-6c4e-08de73aa085c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RUhlWFkvcVFzMHVXNEhiWDhTSVVKYWE2NWxRd0V1TWNHenV1ak9zd3pKVlpC?=
 =?utf-8?B?MjErRG8rbzFlSnZjdWVtVmtJRzgwbWl5Z01ZTzNUbVZpR2krZ29vakZmWXgw?=
 =?utf-8?B?R0gxTFlGN3haZ2RyWmN4REN3aXpNS3FEeEVJSmZ2VXdtQWUzeC9vREJSWEkv?=
 =?utf-8?B?R1d5UHR6d2FXNzNqUklKZTNrSXRmS3dsU0lHaXo3UjRvb3VqKzk2N0RRelBq?=
 =?utf-8?B?b0xBSFB6bXB1blNzdk8xd2ZZK2lmeG9lVGlOWGpIQ3lEMUZtWndGYW1TaGJl?=
 =?utf-8?B?Zi9pVi9lc01aeWNvTkhXSWtQL093MmpLa0l5Q285bEsyQ2Nvc2FNUUt5Wk04?=
 =?utf-8?B?YnZnaEN2K1A2VGpWUjVSanY1SkJreGxYaGZkazIvSDNMNW5DNjRNcFhubGJV?=
 =?utf-8?B?RlJ2Ymd1eEp2S3MxeG4zeWt6b0l2Q3dWTUwvZzhHSDQ4MVQ2YlJiODNPU3VX?=
 =?utf-8?B?aUU4YXhBSkg1ZlRSMjJPem95d0NFQkpOM1Z4SkY4RUZTMU1MLzJGWnh6eE15?=
 =?utf-8?B?L003UzlOb0plcmtOcFk4Y1RERng0N1F4cWhtaFZEWEd5WngrSitMaTdsN0hp?=
 =?utf-8?B?QStRaEF5NU5rZklGZkpiRjl4NXZKeTZFdEJkZ0lMVmQ1YlhseGJWcGx1K2hX?=
 =?utf-8?B?RDV3YkZ5WmZ1Z01xaVU2YWRHOWJjSmI2S3hOVmpLN2ROOW1QRmZqRXh5VWRY?=
 =?utf-8?B?NDNHV0Q1OThwdHhLcGVtMy9vYTBaMFJDVTlZWWZBNDRSUWk5QUFrMkxhVGtt?=
 =?utf-8?B?d25PWitzVFB3WjJ1N1F0Si9kVGwxVFg3dXNOR2YwTU0xUUM1MUZmZ2ZWaVJL?=
 =?utf-8?B?T1ZjNXVUaERXdjJ1YUl1YmZPMnI1NXhXVmRjcWNwMk9GbitsMXZoZm92TUND?=
 =?utf-8?B?WVdmd3FnWi9sVGhHWGpZcTg0cmxuYXVscVN5YXZqY1RpMlgxL0dYa2JmVkRQ?=
 =?utf-8?B?TG96OU1jTGdvcW5zcWtxTTBRT01lRGRnbXhRRkExdVYyTlFtWktHcXJHM0k0?=
 =?utf-8?B?eXpSNjlhVHg5a1ptanpqZTQzRjJrMmkxQm1CWVplb2VJeFR4c2pUeWlEYXJY?=
 =?utf-8?B?NWNmMzFwRS8xOHFZUmVHTWlleWhSLysrMTNBVjZhWGRXaDBXUGxzNml3Ynls?=
 =?utf-8?B?WlJLVXgvOHBSMndONG9tdk54eVlpaDFGWEtiM2MvMDR0cVMzT3Z1azN2NUJa?=
 =?utf-8?B?VDRlZlRzUVVDZ3pRTVFXamN3T3QrcEN4QllOOGxland0UnZFTE5BSXJEWDJD?=
 =?utf-8?B?dDNDYTV0ZzdRdldKeGh4Y0V1bE9HVXRmeUswRFUrYmFXSHVJWjBPaU5RU1ZU?=
 =?utf-8?B?eWhESG5ybFRpYW5POVpMSmpQWXBIdDlBTWJkYm00aW5xbHhjbXRBQnV5MGVv?=
 =?utf-8?B?Y2dEV1krUndtQm9FaU5lTmQvQlhVSmFnVzlLeldQKzFheWNZWE9IQzFJSitn?=
 =?utf-8?B?Y3AzYmFzUGRCNXlmbittYzZNQTEyTlhVN1l3Z3R4N2hnQTBzbmQzMTlMRFlq?=
 =?utf-8?B?azhEb21ldDhRcW1RZWQ4K3B6NldvdWhEcXNRQ1NvZVh1UVJDUXgrOXJ3Ukwy?=
 =?utf-8?B?UE9ZZkpxajNWNEJmLzkzMUQxbHVCNFVzTGZvTTNJVlZrazlnK0haRHJ1bFN5?=
 =?utf-8?B?VDVRa1h6anptZjk0QlFNRzZEZkdqeUVxL3RXenhBdVFFNXphcG40TFY4UVVR?=
 =?utf-8?B?WU9kclJ5amliVzhJck9FcDVMUU5USXBFcUNhbEZjY0srcGpGYUk5ZldoQThm?=
 =?utf-8?B?bWZ3WXUrdVdocFo3QXg1M0craGh1UnZWT255SS8rVjlveFVCR043ZDNhdy9D?=
 =?utf-8?B?dGlKdkZjRHdXcENQOWVLeFphWTBuc2gvblQvOERSNG0wYVllNW5odU4ySERx?=
 =?utf-8?B?eTYvaDg1Q1ZlWHNWQkVBc0pJOFg3U3RBOGZUU0twbUE0SjlrUzA3ODllWkha?=
 =?utf-8?B?WWRIQ2hYL0V5bi9TSVNoaVhXSmFmZkdoT0paZkdLNEM0Q2Z5WWpieEh4UEg2?=
 =?utf-8?B?dTE3dVhrZS9MRWQ2UFNSVDRwWXJneUxiRUJlb1BxVlhpNSt2Snk3cVd3V2JV?=
 =?utf-8?B?anVrNUJGYjRFOG01dVZUNG9Ea2NncENmYnJJcmNOQUFjbTUwK2pNb1d2dDB6?=
 =?utf-8?B?NE43dTkrWmtlc053TVUyYVMwZGt4WlhXaVA3NlFucVpzZmJyUXB6Y1M0NTlR?=
 =?utf-8?B?MDdEbDBnYzVmSHBSSzU3aXk2cHE4TEQ3UUJ6bnVXWUw5K1JXMndUc1hqUFF3?=
 =?utf-8?B?Wi9YbzU0WXR5OWIwMkIxS01raVBBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wFCzZ+9Tl5j0vZ5s0BwK1Y5Jpx3eQtHnB2E9DmseG0V0usTL+hadsmW5xTdVP0+KbVbtELIcWsS/dTK4lxW0voZF7Ojj0aLSYUpYDL9G/NGiXmEKzoKqa4MdC+OlASGXOcl/aRLk8PtpL0m6YGbc/njCR03+VZrY9pcxnmRoQ7DnY/Fe1moRDWuZ6/lqPxg532fX1Pcc/vvC9cL0UGolbAuY5aKtIhDvXTBl/11aM2tHMu4C8vzy1AQ/gL1OqSvW+rCq3BqkbooMaDBmKjkjhs1eZtVQL9GpSe4JvazULpfFH9u/l98hyu4tD+ow+HejPNY5+Nhuw7kk/B/xV+96BEdF7D13QmGzfL6+IhcqZ1mNGttOOrF9NEqmyqqR4hwCEroL5I2J7Uum4ZKlJSS6kL9fJZHwtPyySK8PJC4zV7iNiS5tbasaB9ml2euTE0PB
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 13:38:45.4232 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f150e9a2-1dc5-4341-6c4e-08de73aa085c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000091.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB8215
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
Subject: Re: [Uboot-stm32] [PATCH 5/7] ARM: stm32mp: Add STM32MP21 support
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:patrick.delaunay@foss.st.com,m:u-boot@lists.denx.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:trini@konsulko.com,m:valentin.caron@foss.st.com,m:dario.binacchi@amarulasolutions.com,m:michael@amarulasolutions.com,m:marek.vasut@mailbox.org,m:quentin.schulz@cherry.de,m:cheick.traore@foss.st.com,m:lukma@denx.de,m:gabriel.fernandez@foss.st.com,m:fabrice.gasnier@foss.st.com,m:nicolas.le.bayon@st.com,m:lionel.debieve@foss.st.com,m:gatien.chevallier@foss.st.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,foss.st.com:mid,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,st.com:url,st.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.688];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EA9F5187D93
X-Rspamd-Action: no action

CgpPbiAyLzI0LzI2IDE0OjMwLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IG9u
ZSBlcnJvciBmb3IgQ1BVX1NUTTMyTVAyMTVGeHggdmFsdWUuLi4uCj4gCj4gT24gMi8zLzI2IDE3
OjQ5LCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4+IFNUTTMyTVAyMSBhcHBsaWNhdGlvbiBwcm9j
ZXNzb3JzIChTVE0zMiBNUFVzKSBiYXNlZCBvbiBhIHNpbmdsZQo+PiBBcm0gQ29ydGV4wq4tQTM1
IGNvcmUgcnVubmluZyB1cCB0byAxLjUgR0h6IGFuZCBDb3J0ZXjCri1NMzMgY29yZQo+PiBydW5u
aW5nIGF0IDMwMCBNSHouCj4+Cj4+IEl0IGlzIHBpbi1jb21wYXRpYmxlIHdpdGggdGhlIFNUTTMy
TVAyIHNlcmllcyBpbiB0aGUgVkZCR0EzNjEKPj4gMTDDlzEwIG1tIHBhY2thZ2U6IHRoZSBTVE0z
Mk1QMjEgdXNlcyBhIHN1YnNldCBvZiB0aGUgU1RNMzJNUDIzCj4+IHBpbm91dCwgd2hpY2ggaXRz
ZWxmIGlzIGEgc3Vic2V0IG9mIHRoZSBTVE0zMk1QMjUuCj4+Cj4+IE1vcmUgZGV0YWlscyBhdmFp
bGFibGUgaGVyZSA6Cj4+IGh0dHBzOi8vd3d3LnN0LmNvbS9lbi9taWNyb2NvbnRyb2xsZXJzLW1p
Y3JvcHJvY2Vzc29ycy9zdG0zMm1wMi1zZXJpZXMuaHRtbAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQ
YXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+IMKg
IGFyY2gvYXJtL21hY2gtc3RtMzJtcC9LY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8wqAgMjcgKysrKwo+PiDCoCBhcmNoL2FybS9tYWNoLXN0bTMybXAvS2NvbmZpZy4y
MXjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMzcgKysrKysKPj4gwqAgYXJjaC9hcm0v
bWFjaC1zdG0zMm1wL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
wqAgMyArLQo+PiDCoCBhcmNoL2FybS9tYWNoLXN0bTMybXAvaW5jbHVkZS9tYWNoL3N0bTMyLmjC
oMKgwqDCoCB8wqAgMTIgKy0KPj4gwqAgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2luY2x1ZGUvbWFj
aC9zeXNfcHJvdG8uaCB8wqAgMjIgKysrCj4+IMKgIGFyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0z
Mm1wMi9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgIHzCoMKgIDEgKwo+PiDCoCBhcmNoL2FybS9tYWNo
LXN0bTMybXAvc3RtMzJtcDIvYXJtNjQtbW11LmPCoMKgwqDCoCB8wqDCoCAyICsKPj4gwqAgYXJj
aC9hcm0vbWFjaC1zdG0zMm1wL3N0bTMybXAyL2NwdS5jwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
wqAgMiArCj4+IMKgIGFyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMi9yaWZzYy5jwqDCoMKg
wqDCoMKgwqDCoCB8wqDCoCAxICsKPj4gwqAgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N0bTMybXAy
L3N0bTMybXAyMXguY8KgwqDCoCB8IDE5MiArKysrKysrKysrKysrKysrKysrKysrKysrCj4+IMKg
IGJvYXJkL3N0L2NvbW1vbi9LY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqDCoCAyICstCj4+IMKgIGJvYXJkL3N0L3N0bTMybXAyL0tjb25maWfC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDE0ICsrCj4+IMKg
IGNvbmZpZ3Mvc3RtMzJtcDIxX2RlZmNvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoCA3OCArKysrKysrKysrCj4+IMKgIGluY2x1ZGUvY29uZmlncy9zdG0zMm1w
MjFfY29tbW9uLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMjYgKysrKysrKysrKysrKysr
Kwo+PiDCoCBpbmNsdWRlL2NvbmZpZ3Mvc3RtMzJtcDIxX3N0X2NvbW1vbi5owqDCoMKgwqDCoMKg
wqDCoMKgIHzCoCA1MSArKysrKysrCj4+IMKgIDE1IGZpbGVzIGNoYW5nZWQsIDU2NCBpbnNlcnRp
b25zKCspLCA2IGRlbGV0aW9ucygtKQo+Pgo+IAo+IC4uLi4KPiAKPiAKPj4gwqAgZGlmZiAtLWdp
dCBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9pbmNsdWRlL21hY2gvc3RtMzIuaCBiL2FyY2gvYXJt
L21hY2gtc3RtMzJtcC9pbmNsdWRlL21hY2gvc3RtMzIuaAo+PiBpbmRleCA5MGYwNmEwNTJkMy4u
N2YzNDlmM2I2OGQgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9pbmNsdWRl
L21hY2gvc3RtMzIuaAo+PiArKysgYi9hcmNoL2FybS9tYWNoLXN0bTMybXAvaW5jbHVkZS9tYWNo
L3N0bTMyLmgKPj4gQEAgLTE2NSwxNiArMTY1LDIwIEBAIGVudW0gZm9yY2VkX2Jvb3RfbW9kZSB7
Cj4+IMKgICNlbmRpZiAvKiBfX0FTU0VNQkxZX18gKi8KPj4gwqAgI2VuZGlmIC8qIENPTkZJR19T
VE0zMk1QMTVYIHx8IENPTkZJR19TVE0zMk1QMTNYICovCj4+IMKgIC0jaWYgZGVmaW5lZChDT05G
SUdfU1RNMzJNUDIzWCkgfHwgZGVmaW5lZChDT05GSUdfU1RNMzJNUDI1WCkKPj4gKyNpZiBkZWZp
bmVkKENPTkZJR19TVE0zMk1QMjFYKSB8fCBkZWZpbmVkKENPTkZJR19TVE0zMk1QMjNYKSB8fCBk
ZWZpbmVkKENPTkZJR19TVE0zMk1QMjVYKQo+PiDCoCAjZGVmaW5lIFNUTTMyX1VTQVJUMl9CQVNF
wqDCoMKgwqDCoMKgwqAgMHg0MDBFMDAwMAo+PiDCoCAjZGVmaW5lIFNUTTMyX1VTQVJUM19CQVNF
wqDCoMKgwqDCoMKgwqAgMHg0MDBGMDAwMAo+PiDCoCAjZGVmaW5lIFNUTTMyX1VBUlQ0X0JBU0XC
oMKgwqDCoMKgwqDCoCAweDQwMTAwMDAwCj4+IMKgICNkZWZpbmUgU1RNMzJfVUFSVDVfQkFTRcKg
wqDCoMKgwqDCoMKgIDB4NDAxMTAwMDAKPj4gwqAgI2RlZmluZSBTVE0zMl9VU0FSVDZfQkFTRcKg
wqDCoMKgwqDCoMKgIDB4NDAyMjAwMDAKPj4gKyNpZmRlZiBDT05GSUdfU1RNMzJNUDI1WAo+PiDC
oCAjZGVmaW5lIFNUTTMyX1VBUlQ5X0JBU0XCoMKgwqDCoMKgwqDCoCAweDQwMkMwMDAwCj4+ICsj
ZW5kaWYKPj4gwqAgI2RlZmluZSBTVE0zMl9VU0FSVDFfQkFTRcKgwqDCoMKgwqDCoMKgIDB4NDAz
MzAwMDAKPj4gwqAgI2RlZmluZSBTVE0zMl9VQVJUN19CQVNFwqDCoMKgwqDCoMKgwqAgMHg0MDM3
MDAwMAo+PiArI2lmZGVmIENPTkZJR19TVE0zMk1QMjVYCj4+IMKgICNkZWZpbmUgU1RNMzJfVUFS
VDhfQkFTRcKgwqDCoMKgwqDCoMKgIDB4NDAzODAwMDAKPj4gKyNlbmRpZgo+PiDCoCAjZGVmaW5l
IFNUTTMyX1JDQ19CQVNFwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDQ0MjAwMDAwCj4+IMKgICNk
ZWZpbmUgU1RNMzJfVEFNUF9CQVNFwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDQ2MDEwMDAwCj4+
IMKgICNkZWZpbmUgU1RNMzJfU0RNTUMxX0JBU0XCoMKgwqDCoMKgwqDCoCAweDQ4MjIwMDAwCj4+
IEBAIC0xOTQsNyArMTk4LDcgQEAgZW51bSBmb3JjZWRfYm9vdF9tb2RlIHsKPj4gwqAgwqAgI2Rl
ZmluZSBUQU1QX0ZXVV9CT09UX0lEWF9NQVNLwqDCoMKgwqDCoMKgwqAgR0VOTUFTSygzLCAwKQo+
PiDCoCAjZGVmaW5lIFRBTVBfRldVX0JPT1RfSURYX09GRlNFVMKgwqDCoCAwCj4+IC0jZW5kaWYg
LyogZGVmaW5lZChDT05GSUdfU1RNMzJNUDIzWCkgfHwgZGVmaW5lZChDT05GSUdfU1RNMzJNUDI1
WCkgKi8KPj4gKyNlbmRpZiAvKiBkZWZpbmVkKENPTkZJR19TVE0zMk1QMjFYKSB8fCBkZWZpbmVk
KENPTkZJR19TVE0zMk1QMjNYKSB8fCBkZWZpbmVkKENPTkZJR19TVE0zMk1QMjVYKSAqLwo+PiDC
oCDCoCAvKiBvZmZzZXQgdXNlZCBmb3IgQlNFQyBkcml2ZXI6IG1pc2NfcmVhZCBhbmQgbWlzY193
cml0ZSAqLwo+PiDCoCAjZGVmaW5lIFNUTTMyX0JTRUNfU0hBRE9XX09GRlNFVMKgwqDCoCAweDAK
Pj4gQEAgLTIxOCwxNCArMjIyLDE0IEBAIGVudW0gZm9yY2VkX2Jvb3RfbW9kZSB7Cj4+IMKgICNk
ZWZpbmUgQlNFQ19PVFBfTUFDwqDCoMKgIDU3Cj4+IMKgICNkZWZpbmUgQlNFQ19PVFBfQk9BUkTC
oMKgwqAgNjAKPj4gwqAgI2VuZGlmCj4+IC0jaWYgZGVmaW5lZChDT05GSUdfU1RNMzJNUDIzWCkg
fHwgZGVmaW5lZChDT05GSUdfU1RNMzJNUDI1WCkKPj4gKyNpZiBkZWZpbmVkKENPTkZJR19TVE0z
Mk1QMjFYKSB8fCBkZWZpbmVkKENPTkZJR19TVE0zMk1QMjNYKSB8fCBkZWZpbmVkKENPTkZJR19T
VE0zMk1QMjVYKQo+PiDCoCAjZGVmaW5lIEJTRUNfT1RQX1NFUklBTMKgwqDCoCA1Cj4+IMKgICNk
ZWZpbmUgQlNFQ19PVFBfUlBOwqDCoMKgIDkKPj4gwqAgI2RlZmluZSBCU0VDX09UUF9SRVZJRMKg
wqDCoCAxMDIKPj4gwqAgI2RlZmluZSBCU0VDX09UUF9QS0fCoMKgwqAgMTIyCj4+IMKgICNkZWZp
bmUgQlNFQ19PVFBfQk9BUkTCoMKgwqAgMjQ2Cj4+IMKgICNkZWZpbmUgQlNFQ19PVFBfTUFDwqDC
oMKgIDI0Nwo+PiAtI2VuZGlmIC8qIGRlZmluZWQoQ09ORklHX1NUTTMyTVAyM1gpIHx8IGRlZmlu
ZWQoQ09ORklHX1NUTTMyTVAyNVgpICovCj4+ICsjZW5kaWYgLyogZGVmaW5lZChDT05GSUdfU1RN
MzJNUDIxWCkgfHwgZGVmaW5lZChDT05GSUdfU1RNMzJNUDIzWCkgfHwgZGVmaW5lZChDT05GSUdf
U1RNMzJNUDI1WCkgKi8KPj4gwqAgwqAgI2lmbmRlZiBfX0FTU0VNQkxZX18KPj4gwqAgI2luY2x1
ZGUgPGFzbS90eXBlcy5oPgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2lu
Y2x1ZGUvbWFjaC9zeXNfcHJvdG8uaCBiL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9pbmNsdWRlL21h
Y2gvc3lzX3Byb3RvLmgKPj4gaW5kZXggMmE0ODM3MTg0ZmMuLjQ3YTZkYjc5YmNhIDEwMDY0NAo+
PiAtLS0gYS9hcmNoL2FybS9tYWNoLXN0bTMybXAvaW5jbHVkZS9tYWNoL3N5c19wcm90by5oCj4+
ICsrKyBiL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9pbmNsdWRlL21hY2gvc3lzX3Byb3RvLmgKPj4g
QEAgLTMwLDYgKzMwLDIwIEBACj4+IMKgICNkZWZpbmUgQ1BVX1NUTTMyTVAxMzFGeHjCoMKgwqAg
MHgwNTAxMEVDOAo+PiDCoCAjZGVmaW5lIENQVV9TVE0zMk1QMTMxRHh4wqDCoMKgIDB4MDUwMTBF
QzkKPj4gwqAgKy8qIElEIGZvciBTVE0zMk1QMjF4ID0gRGV2aWNlIFBhcnQgTnVtYmVyIChSUE4p
IChiaXQzMTowKSAqLwo+PiArI2RlZmluZSBDUFVfU1RNMzJNUDIxMUF4eMKgwqDCoCAweDQwMDcz
RTdECj4+ICsjZGVmaW5lIENQVV9TVE0zMk1QMjExQ3h4wqDCoMKgIDB4MDAwNzMwN0QKPj4gKyNk
ZWZpbmUgQ1BVX1NUTTMyTVAyMTFEeHjCoMKgwqAgMHhDMDA3M0U3RAo+PiArI2RlZmluZSBDUFVf
U1RNMzJNUDIxMUZ4eMKgwqDCoCAweDgwMDczMDdECj4+ICsjZGVmaW5lIENQVV9TVE0zMk1QMjEz
QXh4wqDCoMKgIDB4NDAwNzNFMUQKPj4gKyNkZWZpbmUgQ1BVX1NUTTMyTVAyMTNDeHjCoMKgwqAg
MHgwMDA3MzAxRAo+PiArI2RlZmluZSBDUFVfU1RNMzJNUDIxM0R4eMKgwqDCoCAweEMwMDczRTFE
Cj4+ICsjZGVmaW5lIENQVV9TVE0zMk1QMjEzRnh4wqDCoMKgIDB4ODAwNzMwMUQKPj4gKyNkZWZp
bmUgQ1BVX1NUTTMyTVAyMTVBeHjCoMKgwqAgMHg0MDAzM0UwRAo+PiArI2RlZmluZSBDUFVfU1RN
MzJNUDIxNUN4eMKgwqDCoCAweDAwMDMzMDBECj4+ICsjZGVmaW5lIENQVV9TVE0zMk1QMjE1RHh4
wqDCoMKgIDB4QzAwMzNFMEQKPj4gKyNkZWZpbmUgQ1BVX1NUTTMyTVAyMTVGeHjCoMKgwqAgMHg4
MAo+IAo+IAo+IFN0cmFuZ2UgdmFsdWUgdGhpcyBwYXJ0IG51bWJlciwgSSBhc3N1bWU6Cj4gCj4g
I2RlZmluZSBDUFVfU1RNMzJNUDIxNUZ4eMKgwqDCoCAweDgwMDMzMDBECgpZZXMsIGkgd2lsbCBm
aXggaXQgd2l0aCB0aGUgY29ycmVjdCB2YWx1ZSB3aGVuIG1lcmdpbmcKClRoYW5rcwoKPiAKPiAK
Pj4gK0NQVV9TVE0zMk1QMjE1Rnh4Cj4+Cj4+IMKgIC8qIElEIGZvciBTVE0zMk1QMjN4ID0gRGV2
aWNlIFBhcnQgTnVtYmVyIChSUE4pIChiaXQzMTowKSAqLwo+PiDCoCAjZGVmaW5lIENQVV9TVE0z
Mk1QMjM1Q3h4wqDCoMKgIDB4MDAwODIxODIKPj4gwqAgI2RlZmluZSBDUFVfU1RNMzJNUDIzM0N4
eMKgwqDCoCAweDAwMEIzMThFCj4+IEBAIC02Nyw2ICs4MSw3IEBAIHUzMiBnZXRfY3B1X3R5cGUo
dm9pZCk7Cj4+IMKgIMKgICNkZWZpbmUgQ1BVX0RFVl9TVE0zMk1QMTXCoMKgwqAgMHg1MDAKPj4g
wqAgI2RlZmluZSBDUFVfREVWX1NUTTMyTVAxM8KgwqDCoCAweDUwMQo+PiArI2RlZmluZSBDUFVf
REVWX1NUTTMyTVAyMcKgwqDCoCAweDUwMwo+PiDCoCAjZGVmaW5lIENQVV9ERVZfU1RNMzJNUDIz
wqDCoMKgIDB4NTA1Cj4+IMKgICNkZWZpbmUgQ1BVX0RFVl9TVE0zMk1QMjXCoMKgwqAgMHg1MDUK
Pj4gwqAgQEAgLTEwMiw2ICsxMTcsMTMgQEAgdTMyIGdldF9jcHVfcGFja2FnZSh2b2lkKTsKPj4g
wqAgI2RlZmluZSBTVE0zMk1QMTVfUEtHX0FEX1RGQkdBMjU3wqDCoMKgIDEKPj4gwqAgI2RlZmlu
ZSBTVE0zMk1QMTVfUEtHX1VOS05PV07CoMKgwqDCoMKgwqDCoCAwCj4+IMKgICsvKiBwYWNrYWdl
IHVzZWQgZm9yIFNUTTMyTVAyMXggKi8KPj4gKyNkZWZpbmUgU1RNMzJNUDIxX1BLR19DVVNUT03C
oMKgwqDCoMKgwqDCoCAwCj4+ICsjZGVmaW5lIFNUTTMyTVAyMV9QS0dfQUxfVkZCR0EzNjHCoMKg
wqAgMQo+PiArI2RlZmluZSBTVE0zMk1QMjFfUEtHX0FOX1ZGQkdBMjczwqDCoMKgIDMKPj4gKyNk
ZWZpbmUgU1RNMzJNUDIxX1BLR19BT19WRkJHQTIyNcKgwqDCoCA0Cj4+ICsjZGVmaW5lIFNUTTMy
TVAyMV9QS0dfQU1fVEZCR0EyODnCoMKgwqAgNQo+PiArCj4+IMKgIC8qIHBhY2thZ2UgdXNlZCBm
b3IgU1RNMzJNUDIzeCAqLwo+PiDCoCAjZGVmaW5lIFNUTTMyTVAyM19QS0dfQ1VTVE9NwqDCoMKg
wqDCoMKgwqAgMAo+PiDCoCAjZGVmaW5lIFNUTTMyTVAyM19QS0dfQUxfVkZCR0EzNjHCoMKgwqAg
MQo+IAo+IAo+IHdpdGggdGhlIHByb3Bvc2FsIGZvciB0aGUgZGVmaW5lIENQVV9TVE0zMk1QMjE1
Rnh4Cj4gCj4gCj4gUmV2aWV3ZWQtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVu
YXlAZm9zcy5zdC5jb20+Cj4gCj4gVGhhbmtzCj4gUGF0cmljawo+IAo+IAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBs
aXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
