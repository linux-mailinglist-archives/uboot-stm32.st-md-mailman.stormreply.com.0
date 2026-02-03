Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAGnGCQngmnPPgMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 17:49:40 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE60EDC3F4
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 17:49:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A680C58D7A;
	Tue,  3 Feb 2026 16:49:39 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012056.outbound.protection.outlook.com [52.101.66.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42696C0693E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 16:49:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aOy7K7Pf3/xxGrnGfV4JADkfAAjMO9/8ave9YGaFwcJe+qe7FYP6QowBRvGmeRhYgAF1w424MekoxnrBkknxKigB/qbnKcQdM7tP0aMGDdct6Kt6iBOoh5txOWBLSBSSBJrBH85Jdf+n7DZlpvyxzJxS9Sd79cYE0erS6lBz1trLqUd7fav0MhKJIqalnvvgWzxbLkG9/83RFt3mByr6pP2qoHlqT964filzMOEte1kx3DEZtGd7yunMKZMS7o2c2Ip2r5BXIzfsndwy9ZaDz4FX9uc5dR0sUxij8WDc0osLg29ntdKG2U3Pc5SD5h7P06xgwJEkFEHVmZ+SGPcltw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdzToiBuiwO8z39vQ0I4zrz6UN20xctSJYzqSSVCydU=;
 b=qS/ZgfLLEUlnlq4cABgNk5Fpg3uBC4orQRHjxqFWkQa+88JX30+2SdEnGrZ2rQoFOX4HT8X7tjOhajVwI/BBtTfVNUA2nVPaHHTGMXK9YDvpHkUhsLo2C7CDH/iF3IXj7MEX/h5f5bvyvGFnfCdfV2SPo9O688z44jH2Gr9HVg5YtjWg3FBjxE/JpfzGlDnZVa2vk0hLJ21/EhSX5YhzcMSkxAiyQ0+o9S2hYnyylB9YhJZViuFda4T4OsQeLqOnNBQU+xuPijCFfIDV1cQPt6BkBP/x/BAqP6IQ19SFX2UrseSqMKbfK6S8bQbeuRh1cHiqcPs51W7dCUhLtS3SoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdzToiBuiwO8z39vQ0I4zrz6UN20xctSJYzqSSVCydU=;
 b=ntb61+MjX/qSp7nz3PnmVFuSu1+q1ZZ2XiRysPO8/6Mhl0235B7GQb94Thyz7zljZWVmlWugxDFaG8mrxWUlv5teutogeT8+XDTOrtxGmnpqJwWKsblz8+pR5PWriOqwZi0GB/9plX5fDW4R2Q7NluQ2i1qUSLcY7KgWGXs0NXBhOSHu5irIqGV3T+JkZbSsk5fulc3AEYIpkiZR2Wy+phMPRzevKJ8up9XRZxRK78ExBT0cLUGmneKNOQqf5K9Z/OiLVUs7vsCWUJ6vnlRYiwePJEyBe50gyZ0CkcwbDozJBUwRTbOtNWijbQP2wKRI5q5lGl9n6/3wEAzIakH4sQ==
Received: from AS4P190CA0069.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:656::15)
 by VE1PR10MB3968.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:16e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 16:49:34 +0000
Received: from AM4PEPF00027A69.eurprd04.prod.outlook.com
 (2603:10a6:20b:656:cafe::6) by AS4P190CA0069.outlook.office365.com
 (2603:10a6:20b:656::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 16:49:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM4PEPF00027A69.mail.protection.outlook.com (10.167.16.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 16:49:33 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 3 Feb
 2026 17:51:20 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 3 Feb
 2026 17:49:33 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 3 Feb 2026 17:49:20 +0100
Message-ID: <20260203-upstream_add_stm32mp21_support-v1-0-48ca3409cce1@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABAngmkC/x3NwQrCMAyA4VcZOVvIOlH0VURKXaLm0C0k3RDG3
 n3F43f5/w2cTdjh3m1gvIrLPDX0pw7Gb54+HISaIWK8YMQhLOrVOJeUiZLXMsSisU++qM5WA76
 QCa9nonyDFlHjt/z+g8dz3w+5VqmrcAAAAA==
X-Change-ID: 20260203-upstream_add_stm32mp21_support-0b0ed074dda9
To: <u-boot@lists.denx.de>, <uboot-stm32@st-md-mailman.stormreply.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A69:EE_|VE1PR10MB3968:EE_
X-MS-Office365-Filtering-Correlation-Id: 52050e89-a713-41f4-fa05-08de63443589
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bHJqbWZPUXU5ZVF2ZkJPY2VQd0hnQWdqUHBDUUg2Ymg4UkZmcmNHVEpGUjBC?=
 =?utf-8?B?NkxlR3JNeE5qaW5HSnRuaFZHaEVqeEFBMFcxdHlDS01nOC93WkJVb2djVC9G?=
 =?utf-8?B?eFVubFFVZ3ZjdHU5VUMxV01CUVBoZHplSXZtd0NtUE5EdXVEaEFpZWtPNFZm?=
 =?utf-8?B?U0M3ckhJMDBpQUI3TVdyUFpVTTcvZ2ZNNWM0RzlpM3B4NXZ5dHZQYm0rSlNa?=
 =?utf-8?B?cmNQckNGckYxKzhWS2NHN0ZzR1R2TVZkNUUyUUc0NzhRMmljOHhVNjVOeVBq?=
 =?utf-8?B?QjMrYmJ6YlRsSDhObnVDdFIyL1dkbEY0ajJ3QUVrbWh3bmhQWUFleHA5RkhP?=
 =?utf-8?B?azVrSXVzZWNzeEluZ1hzUndRWDZvdnl6OVBubzFnYU5aM2JyOGVGVDFDNExB?=
 =?utf-8?B?U0JkSEgwcVNrRnRVcDIvZDU4UWlLbUNMWUptakhjNHpjKzZ6SnhqZFdPOXcr?=
 =?utf-8?B?emw2Wnd1cjd4NGR6dTJ5YWM1dlVoNkVZOElQZGV3ZWcyeWF5cG1MWTlCaUl6?=
 =?utf-8?B?clJEek9aTHRSdkIwZUg1TG1jU2YycWxsaTdhaXp6MmM2NFkvbFRQTWc5R0ho?=
 =?utf-8?B?MU9oZjlnMTg4Q2k2OGU2MXA3UkIvTDNrK05QTXJPeEpGSWlreHVlTE1JMjJL?=
 =?utf-8?B?TklHNG40aU82QkxNRjU2aXBGZ1JPeTlXTXNSWTVjbVRJMEVLcW1zL0hMWVdj?=
 =?utf-8?B?bWMwSk1EQ2dtUmhIazIxYkxwcm1zOFlmZ1dKYmhtckd0SDNUYkpLZ3diYXZu?=
 =?utf-8?B?RDJWQmNXSzdDSTBUMTIvQjVSOFpyYXc3ZTQ4cWNZTzBjdFhGUWN6US9Da2t2?=
 =?utf-8?B?bTBSUDNwc1VYcEdzVG94Q0ZIck96NHpnbVpYTlVUb0k5dHRhZFB1c0s2OXZU?=
 =?utf-8?B?S2ZQODFOMmUyRktMY0kxTlhBRldhSytlS3oyVWNYb1oxeUFCdVQ5a2lJcWc1?=
 =?utf-8?B?RnQ4UWZIdVQ1YjZkcDlUQkVuaEs5MEphbUpnekFsbnRoUVYvaGUwTUxFakRy?=
 =?utf-8?B?WWZ6QTN5UDBuTU5BQXF4dGN1RGpLU0dCZnhCRm9NTVphaUJLa3pwem93bEtj?=
 =?utf-8?B?dklzUHR5TThRRk44bTcrVmdvOFNGcElaYUp6MkV5MFNBUlVBLys0RnNrZkJl?=
 =?utf-8?B?b0dKcjdUOU94Vy84RDNlbEd0RDFMR0dYOG9aN2RxcTkyd3lVeE9xMGxZWEpi?=
 =?utf-8?B?R3ZseUJydEMwOTNTdUdLcjZoNEE5TFRSbWhZVnZXQlovYkgyQkMxTzZINHk0?=
 =?utf-8?B?TDIzcHVFSGJydmRFa0RvbjhtTVVISnI5SFNBeWdKdllZWm01L2RKandSUVMx?=
 =?utf-8?B?UmhoQ1BCYUVlM3lYSWxGdEpmL1RYWHZQY1lTNmpvV01pdWF3cjZIMmdocVNL?=
 =?utf-8?B?cjRucHFKWGNCbGxPZ25nNC9RVXZQVUZxVVRaTzZsOEd0WCtmeTlPV29PR0N1?=
 =?utf-8?B?VUMrc1J3ZEpTK01kMnppSklqd09FQ2VQd3ZvaTdsSW5xQktNdmcxS0VuVnhE?=
 =?utf-8?B?OVFyZ3FqZzJiSkNnVTByV3lQelloYkhMSXdWdy9RWE9kbHdPY3N6WGdMVGpn?=
 =?utf-8?B?L05kUUtha0k4RWdJZ2RJbmZLbXl1bHIwRlVNQ1A3U2ZJS2wxUFQvd3NnNGt0?=
 =?utf-8?B?QkduS1MyVm1NNy8vcEFlL3VUTTkrbDlqSktoUFA2TjFDQnRxc005bzZIQVc5?=
 =?utf-8?B?YSs3VDh5dHA2NTdJcjNWUkVVN2ROUU0rUisxaWxYNjhidk45YzhKNG01MFdT?=
 =?utf-8?B?TTJVbmkxd3BRWUU4eEtyVVltQ08rY2hlaC9VNzFxL3o0QWh6cm1MbHR6c2Ru?=
 =?utf-8?B?WHdrVHI1WGFTdUFKR2tJSm0waTlkMGRHSmtPWjFVWmoya3lkdWZ5SHExQU1H?=
 =?utf-8?B?YUJXaXZibWh0MFF0cVdCSHZHaFdRYUZTY2JxcjhaQkhNQmU3NDNOc2pzKzg4?=
 =?utf-8?B?WklJTGROYnd1TUowcUNxV0Jqd3c0KzlUaGZYUkVGbndXTjd0cEZFM1BZNjhC?=
 =?utf-8?B?cDY0SWREd0pUdXc0dTZzSUdyWC9LNlFyNFMzMnJ6c2lrSjF1MWNPRDNmQU9q?=
 =?utf-8?B?cWJOaWdvQlE5Y1VoOWNmZXlnOHNvRXpBRW5Kck5kYjk5UDUwUS96c0t0dGNB?=
 =?utf-8?B?NWZMZkNsSnA2TGVjZUlkYlU4ZGdTNHJqb1lXVVJCUCtEYndxSlBHTUtJRzJR?=
 =?utf-8?B?V3RiZW83a1d0L3FQZVFYaERna0oxUmNDV2NHQlc5aVF0aFlIY1RBWHd3QkEw?=
 =?utf-8?B?TXZmOGtTZG1OWVZSdkk3aWtKcXhnPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: EQsIQxxHjvHpbUWjHgSbklDiFgAZrd2O/W78vF7i+mhQ3bK3u+T2vvSwRCvoX8BY875dzVBVk73Tc6yaUc+DH4pM48ArwbQ8Z46bT4JSocZDwR5P8mri/OWuqHyyLCjxTyUBcxVB8S0ZkZONd9xRX8I0eJN+G5FrmCZNhxoH7rA60e7hxwgnDlTF+eu55gm04UVLvzc1rK4r2j2YDluT/aD52nTBj8VMykHnhExJhBazkNaYTMlCgHoKO5JqIOu5hxWxKIAQ+OtU8sA04N7Y8muChbtICZT7MlA8lkQq0UZrWLqxawMzfQQPf169F0CmGSjk5GtTY2a03/x8ahFQ/hQRlzHiUExkcudjPSrilSJYvqbBChL0VlYE2o2+4Nw/oT5wctZWxxx4JMu8AVk8bU/NVnJPfXVoQ0zNkBj5IF62Gaj6vjxtb01vt8VZuCzN
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 16:49:33.9486 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52050e89-a713-41f4-fa05-08de63443589
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A69.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3968
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
Subject: [Uboot-stm32] [PATCH 0/7] ARM: stm32mp: Add STM32MP21x support
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:trini@konsulko.com,m:valentin.caron@foss.st.com,m:dario.binacchi@amarulasolutions.com,m:michael@amarulasolutions.com,m:marek.vasut@mailbox.org,m:quentin.schulz@cherry.de,m:cheick.traore@foss.st.com,m:lukma@denx.de,m:gabriel.fernandez@foss.st.com,m:fabrice.gasnier@foss.st.com,m:nicolas.le.bayon@st.com,m:patrick.delaunay@foss.st.com,m:lionel.debieve@foss.st.com,m:gatien.chevallier@foss.st.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CE60EDC3F4
X-Rspamd-Action: no action

QWRkIFNUTTMyTVAyMSBzdXBwb3J0IHdoaWNoIGlzIGFuIGFwcGxpY2F0aW9uIHByb2Nlc3NvcnMK
KFNUTTMyIE1QVXMpIGJhc2VkIG9uIGEgc2luZ2xlIEFybSBDb3J0ZXjCri1BMzUgY29yZSBydW5u
aW5nCnVwIHRvIDEuNSBHSHogYW5kIENvcnRleMKuLU0zMyBjb3JlIHJ1bm5pbmcgYXQgMzAwIE1I
ei4KCk1vcmUgZGV0YWlscyBhdmFpbGFibGUgYXQ6Cmh0dHBzOi8vd3d3LnN0LmNvbS9lbi9taWNy
b2NvbnRyb2xsZXJzLW1pY3JvcHJvY2Vzc29ycy9zdG0zMm1wMi1zZXJpZXMuaHRtbAoKVGhpcyBz
ZXJpZXMgYWRkcyBTVE0zMk1QMjF4IG1hY2hpbmUsIGNsb2NrIGFuZCByZXNldCBkcml2ZXJzIGFu
ZCB1cGRhdGUKY21kX3N0bTMya2V5LCBtbXUsIHJpZnNjLCBzeXNjb24gZm9yIFNUTTMyTVAyMSBz
dXBwb3J0LiAKClNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJk
QGZvc3Muc3QuY29tPgotLS0KUGF0cmljZSBDaG90YXJkICg3KToKICAgICAgY2xrOiBzdG0zMm1w
MjE6IEFkZCBjbG9jayBkcml2ZXIgc3VwcG9ydAogICAgICByZXNldDogc3RtMzJtcDIxOiBhZGQg
c3RtMzJtcDIxIHJlc2V0IGRyaXZlcgogICAgICBzdG0zMm1wOiBzeXNjb246IEFkZCBTVE0zMk1Q
MjEgc3VwcG9ydAogICAgICBzdG0zMm1wOiBjbWRfc3RtMzJrZXk6IGFkZCBzdXBwb3J0IG9mIFNU
TTMyTVAyMXgKICAgICAgQVJNOiBzdG0zMm1wOiBBZGQgU1RNMzJNUDIxIHN1cHBvcnQKICAgICAg
QVJNOiBkdHM6IHN0bTMyOiBBZGQgc3RtMzJtcDIxNWYtZGstdS1ib290CiAgICAgIEFSTTogZHRz
OiBzdG0zMjogQWRkIGJvb3RwaC1hbGwgaW4gc3RtMzJtcDIxNWYtZGstdS1ib290LmR0c2kKCiBh
cmNoL2FybS9kdHMvc3RtMzJtcDIxNWYtZGstdS1ib290LmR0c2kgICAgICAgIHwgIDE5ICsKIGFy
Y2gvYXJtL21hY2gtc3RtMzJtcC9LY29uZmlnICAgICAgICAgICAgICAgICAgfCAgMjcgKwogYXJj
aC9hcm0vbWFjaC1zdG0zMm1wL0tjb25maWcuMjF4ICAgICAgICAgICAgICB8ICAzNyArKwogYXJj
aC9hcm0vbWFjaC1zdG0zMm1wL01ha2VmaWxlICAgICAgICAgICAgICAgICB8ICAgMyArLQogYXJj
aC9hcm0vbWFjaC1zdG0zMm1wL2NtZF9zdG0zMmtleS5jICAgICAgICAgICB8ICA3MCArLS0KIGFy
Y2gvYXJtL21hY2gtc3RtMzJtcC9pbmNsdWRlL21hY2gvc3RtMzIuaCAgICAgfCAgMTIgKy0KIGFy
Y2gvYXJtL21hY2gtc3RtMzJtcC9pbmNsdWRlL21hY2gvc3lzX3Byb3RvLmggfCAgMjIgKwogYXJj
aC9hcm0vbWFjaC1zdG0zMm1wL3N0bTMybXAyL01ha2VmaWxlICAgICAgICB8ICAgMSArCiBhcmNo
L2FybS9tYWNoLXN0bTMybXAvc3RtMzJtcDIvYXJtNjQtbW11LmMgICAgIHwgICAyICsKIGFyY2gv
YXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMi9jcHUuYyAgICAgICAgICAgfCAgIDIgKwogYXJjaC9h
cm0vbWFjaC1zdG0zMm1wL3N0bTMybXAyL3JpZnNjLmMgICAgICAgICB8ICAgMSArCiBhcmNoL2Fy
bS9tYWNoLXN0bTMybXAvc3RtMzJtcDIvc3RtMzJtcDIxeC5jICAgIHwgMTkyICsrKysrKysKIGFy
Y2gvYXJtL21hY2gtc3RtMzJtcC9zeXNjb24uYyAgICAgICAgICAgICAgICAgfCAgIDEgKwogYm9h
cmQvc3QvY29tbW9uL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQogYm9h
cmQvc3Qvc3RtMzJtcDIvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICB8ICAxNCArCiBjb25m
aWdzL3N0bTMybXAyMV9kZWZjb25maWcgICAgICAgICAgICAgICAgICAgIHwgIDc4ICsrKwogZHJp
dmVycy9jbGsvc3RtMzIvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICB8ICAgOSArCiBkcml2
ZXJzL2Nsay9zdG0zMi9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGRyaXZl
cnMvY2xrL3N0bTMyL2Nsay1zdG0zMm1wMjEuYyAgICAgICAgICAgICAgfCA3MDkgKysrKysrKysr
KysrKysrKysrKysrKysrKwogZHJpdmVycy9yZXNldC9zdG0zMi9LY29uZmlnICAgICAgICAgICAg
ICAgICAgICB8ICAgNyArCiBkcml2ZXJzL3Jlc2V0L3N0bTMyL01ha2VmaWxlICAgICAgICAgICAg
ICAgICAgIHwgICAxICsKIGRyaXZlcnMvcmVzZXQvc3RtMzIvc3RtMzItcmVzZXQtbXAyMS5jICAg
ICAgICAgfCAxMzYgKysrKysKIGluY2x1ZGUvY29uZmlncy9zdG0zMm1wMjFfY29tbW9uLmggICAg
ICAgICAgICAgfCAxMjYgKysrKysKIGluY2x1ZGUvY29uZmlncy9zdG0zMm1wMjFfc3RfY29tbW9u
LmggICAgICAgICAgfCAgNTEgKysKIGluY2x1ZGUvc3RtMzJtcDIxX3JjYy5oICAgICAgICAgICAg
ICAgICAgICAgICAgfCA2NTEgKysrKysrKysrKysrKysrKysrKysrKysKIDI1IGZpbGVzIGNoYW5n
ZWQsIDIxMzUgaW5zZXJ0aW9ucygrKSwgMzkgZGVsZXRpb25zKC0pCi0tLQpiYXNlLWNvbW1pdDog
NjY4OTFmZmIxNDkyMGUzNWFiZmFmY2FlNzk1Y2Y0NjA0ZGU2NjgyZgpjaGFuZ2UtaWQ6IDIwMjYw
MjAzLXVwc3RyZWFtX2FkZF9zdG0zMm1wMjFfc3VwcG9ydC0wYjBlZDA3NGRkYTkKCkJlc3QgcmVn
YXJkcywKLS0gClBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3Rt
MzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJv
b3Qtc3RtMzIK
