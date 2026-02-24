Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFbzEfVsnWkkQAQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 10:18:45 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0D01846F0
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 10:18:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70224C8F285;
	Tue, 24 Feb 2026 09:18:44 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013068.outbound.protection.outlook.com [52.101.72.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE73FC08D19
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 09:18:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=by87+kHtF8ZKLZb/eGLXhMdPbd0jJ+IUnVZz8soI9EjGlkkcncOx0WU6+z8qCD/JS1Eox6nxMwHq4TrpM0dNe8n7ZS9VWSYBtPS2koiN1p1Sl3EJIAYGD2LeHMi4ujjbja7O0Pk1aGkgVLHMYLg1NASaCuqB/Z/tvfvIGFN0VyqPwvFA4BsX0W0z7EsfLKkY7vC5Wm0ZYRq3KhvMVKKriQNH4fLQw8+dPsDvqjYlCLN+BeB5+08ph3r9SHngfQW1AjK+kDrE1vCgEvmd7nhKIhvVWHy7Qd/1X/AXRtHfJtFo5qpzNB7MFZUs7zmeyBNmQBJQxCbqHzkTFUSv3tGcDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZVhd25zlDws2s0gka2bSMG6BlEQ3wxgLlkTYzRLlC24=;
 b=R95/E8uI3g+WW37eD9dteyN6waFBLq8+rnIolph7CKdJlKr/J8hI3q5am/PMzD6SrWvtFXQ08Mf40zv6tEO0EURfWPIOp3Ajdxv2JKtA2NQB4TjiD63WMW8XHsLC2Otv0UU7zaxNna2j2lQjEHI0s7SBi9H1LYH1GodC5KlgXn+SZ4V1SZ+kRGRs9loK8IEQ7I0rxBTOvlOKBgb7+da0QHyM3pU6vtLN90wBC8fJTvNSqwmvA1vzxKNZdMqnWgqf7Dq8DLpeyWf/Zh+X9SAYYW9yqchyB36r8SZAvfOwfBNlxfjGnk9tE8pyDi2+ZrJucuN78gDIuFpwzosRgH6T8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVhd25zlDws2s0gka2bSMG6BlEQ3wxgLlkTYzRLlC24=;
 b=dQl5P1TbwZKCnX+YSO+fPb9Vd7SwNKg5oiW4NE2TLQc+j2u4I2/CPmrZiqXtBcgIEqcRe8pdhQhST36qI+TYb12w/jTT8UawuV//6xiUxcIljrc7qCWsLOcVF+BmO4i8ruMSM4b0+vi7BwTJDWqnu45eEREXKUI3rpO9z5QMmrbTcZr8TPpv2TVtS1Md+HEy5BbFxiiet8pQr7noWUfsIUXZqkH0umE82v16+9jLWBgUMPHnVf6y5O3ssEWx4TtF9VlzYR6Bi6SiCasy312iGbeteWexfJFi28AYN4Kcgx0Nga+YN4sJqgEEk78jfY8+w8kI7L6R4J1aRDpnlBTnSQ==
Received: from AS9PR04CA0077.eurprd04.prod.outlook.com (2603:10a6:20b:48b::13)
 by AS1PR10MB5314.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4ae::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 09:18:40 +0000
Received: from AM2PEPF0001C716.eurprd05.prod.outlook.com
 (2603:10a6:20b:48b:cafe::41) by AS9PR04CA0077.outlook.office365.com
 (2603:10a6:20b:48b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 09:18:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM2PEPF0001C716.mail.protection.outlook.com (10.167.16.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 09:18:39 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 10:20:46 +0100
Received: from [10.48.87.244] (10.48.87.244) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 10:18:38 +0100
Message-ID: <49814c80-1331-4af3-b270-0a9662cd139b@foss.st.com>
Date: Tue, 24 Feb 2026 10:18:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260204-upstream_update_stm32_cmdkey-c-v1-0-d95374395840@foss.st.com>
 <20260204-upstream_update_stm32_cmdkey-c-v1-6-d95374395840@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20260204-upstream_update_stm32_cmdkey-c-v1-6-d95374395840@foss.st.com>
X-Originating-IP: [10.48.87.244]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C716:EE_|AS1PR10MB5314:EE_
X-MS-Office365-Filtering-Correlation-Id: 13a54b36-2bc6-41a4-6541-08de7385b2c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjQwckVyQWlyV0FYUmdWUmdYRTNXVUdGZmszK0ZKUGNTUWFhUTErMEg1Ylp4?=
 =?utf-8?B?VmpzQm14RTA0WkNpZW9OUkRBbTdVMzRtZ2lZNCszZGwrdkc1WTBVdTR6NnFM?=
 =?utf-8?B?ZkU0cFE2OGlidU5jUU83NXV3TlZtWnljbHgwYVkvMEdoazRUZ0lUaUZXRmJl?=
 =?utf-8?B?K242em5vSTZBRnZXNzBjd0VKSnNCdnh5a3BHQmZTZlo5dmVSaVhoVUQyb1VX?=
 =?utf-8?B?d2xXREt2NjNPWDFnTGlwVTFGME9vTVUwa045Ky8zYTZDRDA1eHZSOTFLR0Vu?=
 =?utf-8?B?Vnp0MXJVY2hVRHFmZDI4M1A1a2xPWmpkc1RlWk9zV0VSek5zRGprblpuQzdE?=
 =?utf-8?B?OEQ2NytqZkgzb2E2dXJobXZBNmJIaSt0QTIwV3QzTWdqekNGMlpnbVZCUks1?=
 =?utf-8?B?S1Z2WXR0SFh1UXZCcFU4ck9xdndXV3doS2pEUzl5QXN2dDY1RTdQeUx6OVZK?=
 =?utf-8?B?VTMvWEpKV0xYc2t1Yk5tRkxjV0hSaFcyWmJQYmZBa25IT1FReGorQkVuRGZE?=
 =?utf-8?B?bmxhdDdwWTYxVXhyWW5GWXFWVGZOdHF1aHdCb3dPY1VQQ0ZxbEM1VVpPSnFG?=
 =?utf-8?B?R25xall1MWVqd3RheExjendYdTgzcHUvSkVlUDlpZ0dGSERXOHZqY0dHT2JG?=
 =?utf-8?B?UnpFR2o5WkExK1JCMjZ3NWZBYlQzaUtlUENqekhGVzloOEtjeUkxaG9jRkJ6?=
 =?utf-8?B?VDd5OTFyZ0NpUUNNMmtwQmdtYjlCYTNsVjMvNmJpTE9CNDBFdFNNSXY3SUtU?=
 =?utf-8?B?WmpYL1N0bUZhWklnbFFXMUo2cTZaRFlIa2tFSGN4eDhmRGw3RVdHVnZSOHVt?=
 =?utf-8?B?dnZDdXpkbXUwUGY0R01TKzRwUFpkNXMwQlRScCtaUnFiVnNhQnNxd3F4cWov?=
 =?utf-8?B?cm9XV1NhSzZXRzZkYXpQek92RFo1c2thOW9pRU5YUEZFOGNCaURxWXZiWDhj?=
 =?utf-8?B?RUpjRmRUT0VGamJzaU1mNXc3SHpXSU1qcmo1Nk1ON2IrOXFoY0VaaDZNSVdy?=
 =?utf-8?B?SG0xS0hsL2RweG5UdVBJV29iVlV6cmlEdzZRUjFQenhiUGNRZGZvNTU3QUgy?=
 =?utf-8?B?WTFhZDhtWktYSzhjYzFpSXJtc3B2dWFBNWwxN2p6MWdOdDRRRlFQUDFuclVx?=
 =?utf-8?B?bzA5U3RxT2kxNW5HbDd6SmJvN2xGbXB1TmdNVmM3bjNTMEMyN3cwcW1aTVV1?=
 =?utf-8?B?eC9SOWhOOU5Yd0gxUE95TnIvb2ZVazgxNFh1blNUUE5ja204RmxRdGI0ZURy?=
 =?utf-8?B?QWt4ckZ3TDFka2hVamY5RWJNLzYveHJqYmh4TzNVdVczNTJESjB5cnFkdExk?=
 =?utf-8?B?UzF6ZUVXaXNIVmczb0d4Mm1NSlNmWjF4bXlka241NUxiRUVKOVozTnVJTXF0?=
 =?utf-8?B?YXNqVUZoM2EvZitnQ1AyNFRjeVlSanRsQVFqTDZoUEJpTzRBaDN1Nk5uN2xh?=
 =?utf-8?B?NTVsSXBZUVUvYk9GeXplRlhCRktzMHdQcUhRTUU2M0lldThVYlE1bm5GdC9l?=
 =?utf-8?B?TkNZc0g5WjdrN0dzU0xiL0IwVXlBeTRNSWRYOE5rY2lmVzY3UTNsa2RRMitM?=
 =?utf-8?B?ajRLVXJpS0ROMklLR0tJUHdCQlA1bUpzSTNNLzAzM3ZCNDZDaHhuSldlenVI?=
 =?utf-8?B?cHVyaVd0N0s0bEltY3MrQjZHb2NWWFYzMmVSNWxoYUpSZURRb0ZXV0xrQXkx?=
 =?utf-8?B?ajFoTDZrbDZYb0JHeVY1MUtLWG54SzNyTUxxNXplNE51Y2lHZmhRZ0gzZDYy?=
 =?utf-8?B?V0pXbC9KS2JQeEVZelJsMVJBLzJiSFlsYkxTWFJVTklmT1lnZkhFUDBZRWpY?=
 =?utf-8?B?NlkrZnJld2JWb1k3U1BuK2lzQ2o3NGJodGZRNGJ2OWc5MGRvR09yeHZ6dmN3?=
 =?utf-8?B?UU5FcVVzZzhwT0lRZm1tMVFJRlA3Mk0zSlVXdWtwM2xHSEFXUkI4cjJVbFIr?=
 =?utf-8?B?L3dSb1R3TEJMN0M1dzZMT3ViQks3RjQrc0hMZDh2am1tR0hPTG5TSDNLc29O?=
 =?utf-8?B?VDAySllTWTNQamo5NDZ3RS9RalJreUZ0WEU1dkdDb2dLSCt6K3NFR3Z3Q1FT?=
 =?utf-8?B?ZXZoYTZuUGwxSXc5RTZETEVTUGVrTGMvODh3MVNuZHhqTHIzY3RnekFBYUNm?=
 =?utf-8?B?ai80T1NXeUFDQ1pUZVhJOFY3bkpLaDc2emhDcGNoQjVUK1Fya1lyNTlkdjE2?=
 =?utf-8?B?NDVyZzMxL0R0RGl6THpoeldyRXpYbk1udnE3K0tuYVFqZ2htdzVLTURhWUp5?=
 =?utf-8?B?WlQ5dWYraFdlL0piMEVrSmhqQ0ZBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: H1xkzuAi/oc0zClTEnj+QX89G7QJ/aujgjqC8Np6sZEVAva3ZtvZB/QAuZ26/OctyDRrNocaTWDrlhYlVpg7e7tYQfInDSr61mxr/CDhj2RI5QLc9Km1o+lFUwbu2eKW49tQv3e5ICDNYgo1Pyn1JzHYGOX3Kye/67KEuOMKj32Do/2eWzVIaxR+bV+jlgKoMGdE+YVeaOamiK7qz0f2GICUnQNFhyp0J9jPTqWFuWicOTyT1lxhWh+P6reUkezfMPUFZtaIujHsPYmcvhdue4zf35TR1yB2v2oZd130Nn7CZx7NMfRVkgtJbNhCWMHUcvhwcu3f41ZJ9pPOXt35LanKe3gaCVHbcm4t8il1sa8J2z9MZ8uIh5z6+fXGy3Ix4GTqkJarCU7V86EKoxyp01J0LidO9sKVLcGfZf4OMJ4Ybk0gshixf5q76L65Rq3p
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 09:18:39.9296 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13a54b36-2bc6-41a4-6541-08de7385b2c2
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5314
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Gwenael Treuveur <gwenael.treuveur@foss.st.com>,
 Nicolas Le Bayon <nicolas.le.bayon@st.com>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 6/6] configs: stm32mp25: Enable
	CMD_STM32KEY
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:patrice.chotard@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:marek.vasut+renesas@mailbox.org,m:quentin.schulz@cherry.de,m:gwenael.treuveur@foss.st.com,m:nicolas.le.bayon@st.com,m:cheick.traore@foss.st.com,m:lionel.debieve@foss.st.com,m:yannick.fertre@foss.st.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,st.com:email];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DE0D01846F0
X-Rspamd-Action: no action

Hi,

On 2/4/26 11:20, Patrice Chotard wrote:
> Enable CONFIG_CMD_STM32KEY flag to enable usage of command
> stm32key.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   configs/stm32mp25_defconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/configs/stm32mp25_defconfig b/configs/stm32mp25_defconfig
> index 234a6a8abdc..99b22a68fda 100644
> --- a/configs/stm32mp25_defconfig
> +++ b/configs/stm32mp25_defconfig
> @@ -9,6 +9,7 @@ CONFIG_SYS_BOOTM_LEN=0x2000000
>   CONFIG_SYS_LOAD_ADDR=0x84000000
>   CONFIG_STM32MP25X=y
>   CONFIG_DDR_CACHEABLE_SIZE=0x10000000
> +CONFIG_CMD_STM32KEY=y
>   CONFIG_MFD_STM32_TIMERS=y
>   CONFIG_ENV_OFFSET_REDUND=0x940000
>   CONFIG_TARGET_ST_STM32MP25X=y
>

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
