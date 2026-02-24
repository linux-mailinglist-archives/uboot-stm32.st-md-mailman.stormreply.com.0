Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPKwIwKonWmgQwQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 14:30:42 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33108187B34
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 14:30:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABEE6C8F288;
	Tue, 24 Feb 2026 13:30:41 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010032.outbound.protection.outlook.com [52.101.69.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 066B4C8F285
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 13:30:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UPl2EJtiHnMwyWLy/Hu8RcYuz/dw390x/wYTW6qG9/WHRFGD9V5M9wW1TP+eC9LpCm7XN2JoLuiOLL10Ooq+jsFB71teenin6f4FTkaOfKd6qfw7kYYq2LzHtjOLFBfDdquAz9hLKMx4RmRm6rNhfAgkKV30UmIHQne6cGpfMlins8RS8YmdT3dunj7/FBaklePQ1ScHk3HRQlwssbKyv3N26kCeNvdTxHubcVlRc1dsWPf8h78OxwvujZhDiYO8rE5N2v3A2mCy7C9viA4E9t5ab/sOKxGXcUrMC8NImZi3bKskxtgpQcrXNx5hrAfoybc9E8VFDsa+AfK45F7q7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rPrrXjDg61JRzzTgwcZqUf2YLsJmWbeW8wlzQcalUc=;
 b=vHQuLMjIkgZSqhuiJXsL8+UjHGhz+4VvvcE5JQmRzg1UV+zauJw1A+wDq/A2IHCHNL1/yv54aPwGtXXHHAMWdlCHpIgfVHp1i+oKix+qlxtpNNbzusAZh/3G2afDueIB21klrGdR6xjQOyIe0Bn971rwG03mGqUvgzS2lTy5RgWq1U7hd9WDF0BQujLiSdg1YLA1lZgGEPVQXKYTGrLctd7XjRFRLYb7gtg1g9XAYatZmuUD+rCYNhBNf2pBq482HStpGKlDipUuxcOwMN/676PDYbHtiVy7Up4f6BXCRWf+uB+/V6btsZlhmtMwdCwGstEtaqvIghLTPhkf3qyGCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rPrrXjDg61JRzzTgwcZqUf2YLsJmWbeW8wlzQcalUc=;
 b=FitpAO1y62NHzCILWtGKyEPS9STmMb87Q8FpejjW/QDbhGfZXo5Pjp/UElUOVFAKgP/GevC4uwSI5Alt6O7T+5BHIRcmfX+OikxAXzC9v4M8wLTzAn9W9IvGwtXiBftsWpIV0ldcSX38Msl28JfJYup6zpfE7HJCViZl302nClR6uz4DGU8HA846/aOrIGL1FSPdIkFopKW/2Kc+XeAIjs4MtgtPZtpxafQ2rKomZqcXQgQ/4ndrpvGrVlbD8p3tez7TiGZlg+YbuInzSIr5RC23D19O718hWg5OaKY0MAMld4iUX6iPbzUObZfdgo4ZkJBpkN+qw+pWlKxKBMzc2Q==
Received: from DU7P250CA0030.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::34)
 by VI0PR10MB8498.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:235::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 13:30:36 +0000
Received: from DU2PEPF00028D05.eurprd03.prod.outlook.com
 (2603:10a6:10:54f:cafe::ab) by DU7P250CA0030.outlook.office365.com
 (2603:10a6:10:54f::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 13:30:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028D05.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 13:30:35 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 14:32:51 +0100
Received: from [10.48.87.244] (10.48.87.244) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 14:30:34 +0100
Message-ID: <3c678260-1859-42cc-8f84-0e0682f64b59@foss.st.com>
Date: Tue, 24 Feb 2026 14:30:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>,
 <uboot-stm32@st-md-mailman.stormreply.com>
References: <20260203-upstream_add_stm32mp21_support-v1-0-48ca3409cce1@foss.st.com>
 <20260203-upstream_add_stm32mp21_support-v1-5-48ca3409cce1@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20260203-upstream_add_stm32mp21_support-v1-5-48ca3409cce1@foss.st.com>
X-Originating-IP: [10.48.87.244]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D05:EE_|VI0PR10MB8498:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dda75e1-3525-463b-0dfd-08de73a8e49c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1FaS3QzTTZkakVsQndmV0UzUFMwdnVJQS9HOXIwZmpOWjdtYVI4RDE3dzNR?=
 =?utf-8?B?ZDd4TjBSaG5pTU9mWUdObE1VZDY2RHA2NEp6WUJxRTJZRDVCWUhFbDlKaXR2?=
 =?utf-8?B?Z0VRNnc3VXFrTU5haE83WE44Yy9FMitKUXBSOTJsVVZGY0h3NUlCYkN6MXZD?=
 =?utf-8?B?TEFqbW1YYmRVUTNSM0FwazgwbndJUXpaRnIrVG50cFNVMDNreDZPVEx4OVRr?=
 =?utf-8?B?NHdOeE1iNXV6d1hwNTdqMUJqcm1wblZuemhYdE1ZeTUra2VqNC92Uy9ST2FL?=
 =?utf-8?B?aSt3ZWk1VDZmUE0wQ1daUUZRSUJLbE1COWlDMlY0UUxHU0VYUVhSVFV0Y0M4?=
 =?utf-8?B?dEVpbjVpM2I3ZFhIRC9lZnk5bDJYbFZ0VmdGR2hleDVrMUpNQ3l1SlJlR0J3?=
 =?utf-8?B?aGQzbnd3Ri9FajV4YndGY2ErSXRaUk1oaE91RmQwY0VNa0l5alk4SGxJc0pi?=
 =?utf-8?B?TktMeE1GVmJEWnRkdk5KQWlOallZMGFwVjVxQVpPbW05WjUzamJ1ZUhNZnBh?=
 =?utf-8?B?akVwKytSR3VxVVRNMzcwbkxwV1FaZUk2UElQK0pVcHpFa2Fiei9NbTlDVEkw?=
 =?utf-8?B?WC9qZXVMaUZSYVZJSmlMRENObUJvS2NYY2JrNWcxT2ZkbFp3RjVTU25uQWJY?=
 =?utf-8?B?ODIzN05nb3c0ZWJUYlRxRWpRa0xxMW5pVzZnWlJRRWFKQkRORUpvdHBmTG5D?=
 =?utf-8?B?aGVZcTBoaTk3NXdRZFBqbjZxdnc1MmlrTWtISDNxeUxhWStrQVdWYldhcjha?=
 =?utf-8?B?RzhOU0ZISy9GUkx2OGx0VXlBaW9oRllyc3JhRjZOSFQ1ZjNzc1RrMytvTHJE?=
 =?utf-8?B?NEc5d3NhRVlicHNTak9ZRXpWb0NFZmExWUNtdTRab3pIbldpWXdNZElOVjlt?=
 =?utf-8?B?MDRxaXVSN2h3NlIrbU1KNVhuMXhkajFaWUlYOXVDVzF5L0EzZWJoS0VHRDdn?=
 =?utf-8?B?V28wYjhVWXZLSkxFc0I1ZkcwdTNiMlFNZnJESkhSN09DbDZUYVVHUXVidlBy?=
 =?utf-8?B?WGtBby8xZitBL3FvRlNmb1U4c2ZTMVdWYlJJY01CdkoxSXNKaG5OSlN2Z3po?=
 =?utf-8?B?N0Rhd1VKdjRBcjA2NE02US80YWlucHFNaTkxY0t4QWVRTUlCb01WVStVZThH?=
 =?utf-8?B?VXBIdFR1QVhKS3JVUGt5cmYzbi8rMXFzM2VjcytZOUpYMFlzZkxHQ1FJeitZ?=
 =?utf-8?B?VW1XUmo2Q0M3UVRFbGlLWGk3VEQ5R2lDdHpEaUVjbmZPa1dNMXN4Tm5JV2NY?=
 =?utf-8?B?RnpPWEVydFpSVGRSVU5HZkRWOVBiTkFUbDV6UnBVNmV5dWZuWTFDZEhMSlBJ?=
 =?utf-8?B?ZDZPc0I0TGdJNWI2N3dFYmVha2Z3WHFKQ1dSenZjVTdNbkVBQTBMOW9ZMnBU?=
 =?utf-8?B?TklVYkIwTWdSeDBObC9ydGxHMmFTUVZwVUdiL3pISUtrcm1CN3BTclhwNjZH?=
 =?utf-8?B?bHJXbTlvcHhHU05pbDh1Unp5UTdENE5uanNydEFNYURyUVl3aSsyNFc2dkdZ?=
 =?utf-8?B?MHhiTEZPRFVheUZEWm1Gb25kcW12ajlLYXpBTGpvMUZ6RmZhMGswNnhtVkRt?=
 =?utf-8?B?cXhOZzBoc2NtOGIzU3ozSGg2cnpXTTJKblNjT1cwK2RTT2FlV2huY2YyTzJj?=
 =?utf-8?B?dTg4TXlmdFFERkRRQ09ISXFVYUlTZTh3ZURNNXdNMWJ2UHl4T09jSjVvMW4z?=
 =?utf-8?B?Q0UxVGxHQ2wwMDhRL0tpcmJubEpiQ09sUEN0WFN0RS84dHpIK0prdnRITFRo?=
 =?utf-8?B?MG92RFErcGVRdmVSankvemFwZkE1VFFkTUlUZ2tBNnI1ZEJKWnd5dURRanBi?=
 =?utf-8?B?VzNvaUVadzV5SWZjeFM1QytqUnBSdDg4a3RQODhGUHdXZTJlSGd6U0NZWGZC?=
 =?utf-8?B?V2pjVFIxUnF2NStJWW9yVEJTSWtjYzVtaTJmc1BsNGZ1TTlrRytoa29oQU1L?=
 =?utf-8?B?RVpuRUgwYzV6aXFyV3F6MFNoLzlIckkyTnlNblUyaEcvWTVLbWdMbDI2Yklm?=
 =?utf-8?B?U1Q3ZGdrZTRaNCsxQ2xIc05zZlVpRjVnaWtpZ2hTSXgzT3ZYM0U2cGZtMEpC?=
 =?utf-8?B?d1p2Y1JkTFhwS29PQk4vM1RCdDlhRmxPM0dmakE1clpQcVBmL0pHWWZldERr?=
 =?utf-8?B?alE0N0lhNUJ1QlovZjMwZEdQRE9UUG9BekJIejErSm0yVVFFOHc5N1V5eDF5?=
 =?utf-8?B?MUxGdkJFTldwSFY4Y00yd08zV2hyazNldFcxaENkVCtIeTF0dktpWGNPRGg2?=
 =?utf-8?B?bHRJL2JwM1FPdzRjcFZaRWMxSE1RPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hIgFEvpOSVWqDen7HMKBNOlqNvV49tD+9Gv8kf6Zsg4lTqZUdVktt1TarG61lQc0Hw9DY5i3UEa/DXeXae5rGIT/ic+wU232qMB5GkUCFPJKjT79xeImiq/PhkMUp0EakZ+2D7/WvmK3P8sG6KnK9fK+zIOXb0WtcKZAQFIJ5m2xvmnlJ19fvSYu8zm5KAEu7GGH52kxgMle+M17Fk9HKgLplxtT6qTDJQGSsHRsGZ146WUv0rEc8tEwdyOadNO+uFXuD0YNmUcENhPRIjuhhlLdBzR8f3QeHCgEaFY0XRj+qKHR9CuismRxFu64z/5PmVO6VwZH8Y3tXqyrkwKnMzBIWDDVQmrfqlPRaQQJoR6N7H4AHeofEnS+tmHgHgV6j0GLvU68T/8ffZiAKZLalVvEZ0KTiPEGMf75PlpCPo0H0QFz71bg4L+1REFgXf4+
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 13:30:35.7556 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dda75e1-3525-463b-0dfd-08de73a8e49c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D05.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8498
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
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
	FORGED_RECIPIENTS(0.00)[m:patrice.chotard@foss.st.com,m:u-boot@lists.denx.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:trini@konsulko.com,m:valentin.caron@foss.st.com,m:dario.binacchi@amarulasolutions.com,m:michael@amarulasolutions.com,m:marek.vasut@mailbox.org,m:quentin.schulz@cherry.de,m:cheick.traore@foss.st.com,m:lukma@denx.de,m:gabriel.fernandez@foss.st.com,m:fabrice.gasnier@foss.st.com,m:nicolas.le.bayon@st.com,m:lionel.debieve@foss.st.com,m:gatien.chevallier@foss.st.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st.com:url,st.com:email,st-md-mailman.stormreply.com:rdns,foss.st.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.717];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 33108187B34
X-Rspamd-Action: no action

SGksCgpvbmUgZXJyb3IgZm9yIENQVV9TVE0zMk1QMjE1Rnh4IHZhbHVlLi4uLgoKT24gMi8zLzI2
IDE3OjQ5LCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4gU1RNMzJNUDIxIGFwcGxpY2F0aW9uIHBy
b2Nlc3NvcnMgKFNUTTMyIE1QVXMpIGJhc2VkIG9uIGEgc2luZ2xlCj4gQXJtIENvcnRleMKuLUEz
NSBjb3JlIHJ1bm5pbmcgdXAgdG8gMS41IEdIeiBhbmQgQ29ydGV4wq4tTTMzIGNvcmUKPiBydW5u
aW5nIGF0IDMwMCBNSHouCj4KPiBJdCBpcyBwaW4tY29tcGF0aWJsZSB3aXRoIHRoZSBTVE0zMk1Q
MiBzZXJpZXMgaW4gdGhlIFZGQkdBMzYxCj4gMTDDlzEwIG1tIHBhY2thZ2U6IHRoZSBTVE0zMk1Q
MjEgdXNlcyBhIHN1YnNldCBvZiB0aGUgU1RNMzJNUDIzCj4gcGlub3V0LCB3aGljaCBpdHNlbGYg
aXMgYSBzdWJzZXQgb2YgdGhlIFNUTTMyTVAyNS4KPgo+IE1vcmUgZGV0YWlscyBhdmFpbGFibGUg
aGVyZSA6Cj4gaHR0cHM6Ly93d3cuc3QuY29tL2VuL21pY3JvY29udHJvbGxlcnMtbWljcm9wcm9j
ZXNzb3JzL3N0bTMybXAyLXNlcmllcy5odG1sCj4KPiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENo
b3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPiAtLS0KPiAgIGFyY2gvYXJtL21h
Y2gtc3RtMzJtcC9LY29uZmlnICAgICAgICAgICAgICAgICAgfCAgMjcgKysrKwo+ICAgYXJjaC9h
cm0vbWFjaC1zdG0zMm1wL0tjb25maWcuMjF4ICAgICAgICAgICAgICB8ICAzNyArKysrKwo+ICAg
YXJjaC9hcm0vbWFjaC1zdG0zMm1wL01ha2VmaWxlICAgICAgICAgICAgICAgICB8ICAgMyArLQo+
ICAgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2luY2x1ZGUvbWFjaC9zdG0zMi5oICAgICB8ICAxMiAr
LQo+ICAgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2luY2x1ZGUvbWFjaC9zeXNfcHJvdG8uaCB8ICAy
MiArKysKPiAgIGFyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMi9NYWtlZmlsZSAgICAgICAg
fCAgIDEgKwo+ICAgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N0bTMybXAyL2FybTY0LW1tdS5jICAg
ICB8ICAgMiArCj4gICBhcmNoL2FybS9tYWNoLXN0bTMybXAvc3RtMzJtcDIvY3B1LmMgICAgICAg
ICAgIHwgICAyICsKPiAgIGFyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMi9yaWZzYy5jICAg
ICAgICAgfCAgIDEgKwo+ICAgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N0bTMybXAyL3N0bTMybXAy
MXguYyAgICB8IDE5MiArKysrKysrKysrKysrKysrKysrKysrKysrCj4gICBib2FyZC9zdC9jb21t
b24vS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICstCj4gICBib2FyZC9zdC9z
dG0zMm1wMi9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgIHwgIDE0ICsrCj4gICBjb25maWdz
L3N0bTMybXAyMV9kZWZjb25maWcgICAgICAgICAgICAgICAgICAgIHwgIDc4ICsrKysrKysrKysK
PiAgIGluY2x1ZGUvY29uZmlncy9zdG0zMm1wMjFfY29tbW9uLmggICAgICAgICAgICAgfCAxMjYg
KysrKysrKysrKysrKysrKwo+ICAgaW5jbHVkZS9jb25maWdzL3N0bTMybXAyMV9zdF9jb21tb24u
aCAgICAgICAgICB8ICA1MSArKysrKysrCj4gICAxNSBmaWxlcyBjaGFuZ2VkLCA1NjQgaW5zZXJ0
aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPgoKLi4uLgoKCj4gICAKPiBkaWZmIC0tZ2l0IGEvYXJj
aC9hcm0vbWFjaC1zdG0zMm1wL2luY2x1ZGUvbWFjaC9zdG0zMi5oIGIvYXJjaC9hcm0vbWFjaC1z
dG0zMm1wL2luY2x1ZGUvbWFjaC9zdG0zMi5oCj4gaW5kZXggOTBmMDZhMDUyZDMuLjdmMzQ5ZjNi
NjhkIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9pbmNsdWRlL21hY2gvc3Rt
MzIuaAo+ICsrKyBiL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9pbmNsdWRlL21hY2gvc3RtMzIuaAo+
IEBAIC0xNjUsMTYgKzE2NSwyMCBAQCBlbnVtIGZvcmNlZF9ib290X21vZGUgewo+ICAgI2VuZGlm
IC8qIF9fQVNTRU1CTFlfXyAqLwo+ICAgI2VuZGlmIC8qIENPTkZJR19TVE0zMk1QMTVYIHx8IENP
TkZJR19TVE0zMk1QMTNYICovCj4gICAKPiAtI2lmIGRlZmluZWQoQ09ORklHX1NUTTMyTVAyM1gp
IHx8IGRlZmluZWQoQ09ORklHX1NUTTMyTVAyNVgpCj4gKyNpZiBkZWZpbmVkKENPTkZJR19TVE0z
Mk1QMjFYKSB8fCBkZWZpbmVkKENPTkZJR19TVE0zMk1QMjNYKSB8fCBkZWZpbmVkKENPTkZJR19T
VE0zMk1QMjVYKQo+ICAgI2RlZmluZSBTVE0zMl9VU0FSVDJfQkFTRQkJMHg0MDBFMDAwMAo+ICAg
I2RlZmluZSBTVE0zMl9VU0FSVDNfQkFTRQkJMHg0MDBGMDAwMAo+ICAgI2RlZmluZSBTVE0zMl9V
QVJUNF9CQVNFCQkweDQwMTAwMDAwCj4gICAjZGVmaW5lIFNUTTMyX1VBUlQ1X0JBU0UJCTB4NDAx
MTAwMDAKPiAgICNkZWZpbmUgU1RNMzJfVVNBUlQ2X0JBU0UJCTB4NDAyMjAwMDAKPiArI2lmZGVm
IENPTkZJR19TVE0zMk1QMjVYCj4gICAjZGVmaW5lIFNUTTMyX1VBUlQ5X0JBU0UJCTB4NDAyQzAw
MDAKPiArI2VuZGlmCj4gICAjZGVmaW5lIFNUTTMyX1VTQVJUMV9CQVNFCQkweDQwMzMwMDAwCj4g
ICAjZGVmaW5lIFNUTTMyX1VBUlQ3X0JBU0UJCTB4NDAzNzAwMDAKPiArI2lmZGVmIENPTkZJR19T
VE0zMk1QMjVYCj4gICAjZGVmaW5lIFNUTTMyX1VBUlQ4X0JBU0UJCTB4NDAzODAwMDAKPiArI2Vu
ZGlmCj4gICAjZGVmaW5lIFNUTTMyX1JDQ19CQVNFCQkJMHg0NDIwMDAwMAo+ICAgI2RlZmluZSBT
VE0zMl9UQU1QX0JBU0UJCQkweDQ2MDEwMDAwCj4gICAjZGVmaW5lIFNUTTMyX1NETU1DMV9CQVNF
CQkweDQ4MjIwMDAwCj4gQEAgLTE5NCw3ICsxOTgsNyBAQCBlbnVtIGZvcmNlZF9ib290X21vZGUg
ewo+ICAgCj4gICAjZGVmaW5lIFRBTVBfRldVX0JPT1RfSURYX01BU0sJCUdFTk1BU0soMywgMCkK
PiAgICNkZWZpbmUgVEFNUF9GV1VfQk9PVF9JRFhfT0ZGU0VUCTAKPiAtI2VuZGlmIC8qIGRlZmlu
ZWQoQ09ORklHX1NUTTMyTVAyM1gpIHx8IGRlZmluZWQoQ09ORklHX1NUTTMyTVAyNVgpICovCj4g
KyNlbmRpZiAvKiBkZWZpbmVkKENPTkZJR19TVE0zMk1QMjFYKSB8fCBkZWZpbmVkKENPTkZJR19T
VE0zMk1QMjNYKSB8fCBkZWZpbmVkKENPTkZJR19TVE0zMk1QMjVYKSAqLwo+ICAgCj4gICAvKiBv
ZmZzZXQgdXNlZCBmb3IgQlNFQyBkcml2ZXI6IG1pc2NfcmVhZCBhbmQgbWlzY193cml0ZSAqLwo+
ICAgI2RlZmluZSBTVE0zMl9CU0VDX1NIQURPV19PRkZTRVQJMHgwCj4gQEAgLTIxOCwxNCArMjIy
LDE0IEBAIGVudW0gZm9yY2VkX2Jvb3RfbW9kZSB7Cj4gICAjZGVmaW5lIEJTRUNfT1RQX01BQwk1
Nwo+ICAgI2RlZmluZSBCU0VDX09UUF9CT0FSRAk2MAo+ICAgI2VuZGlmCj4gLSNpZiBkZWZpbmVk
KENPTkZJR19TVE0zMk1QMjNYKSB8fCBkZWZpbmVkKENPTkZJR19TVE0zMk1QMjVYKQo+ICsjaWYg
ZGVmaW5lZChDT05GSUdfU1RNMzJNUDIxWCkgfHwgZGVmaW5lZChDT05GSUdfU1RNMzJNUDIzWCkg
fHwgZGVmaW5lZChDT05GSUdfU1RNMzJNUDI1WCkKPiAgICNkZWZpbmUgQlNFQ19PVFBfU0VSSUFM
CTUKPiAgICNkZWZpbmUgQlNFQ19PVFBfUlBOCTkKPiAgICNkZWZpbmUgQlNFQ19PVFBfUkVWSUQJ
MTAyCj4gICAjZGVmaW5lIEJTRUNfT1RQX1BLRwkxMjIKPiAgICNkZWZpbmUgQlNFQ19PVFBfQk9B
UkQJMjQ2Cj4gICAjZGVmaW5lIEJTRUNfT1RQX01BQwkyNDcKPiAtI2VuZGlmIC8qIGRlZmluZWQo
Q09ORklHX1NUTTMyTVAyM1gpIHx8IGRlZmluZWQoQ09ORklHX1NUTTMyTVAyNVgpICovCj4gKyNl
bmRpZiAvKiBkZWZpbmVkKENPTkZJR19TVE0zMk1QMjFYKSB8fCBkZWZpbmVkKENPTkZJR19TVE0z
Mk1QMjNYKSB8fCBkZWZpbmVkKENPTkZJR19TVE0zMk1QMjVYKSAqLwo+ICAgCj4gICAjaWZuZGVm
IF9fQVNTRU1CTFlfXwo+ICAgI2luY2x1ZGUgPGFzbS90eXBlcy5oPgo+IGRpZmYgLS1naXQgYS9h
cmNoL2FybS9tYWNoLXN0bTMybXAvaW5jbHVkZS9tYWNoL3N5c19wcm90by5oIGIvYXJjaC9hcm0v
bWFjaC1zdG0zMm1wL2luY2x1ZGUvbWFjaC9zeXNfcHJvdG8uaAo+IGluZGV4IDJhNDgzNzE4NGZj
Li40N2E2ZGI3OWJjYSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9tYWNoLXN0bTMybXAvaW5jbHVk
ZS9tYWNoL3N5c19wcm90by5oCj4gKysrIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2luY2x1ZGUv
bWFjaC9zeXNfcHJvdG8uaAo+IEBAIC0zMCw2ICszMCwyMCBAQAo+ICAgI2RlZmluZSBDUFVfU1RN
MzJNUDEzMUZ4eAkweDA1MDEwRUM4Cj4gICAjZGVmaW5lIENQVV9TVE0zMk1QMTMxRHh4CTB4MDUw
MTBFQzkKPiAgIAo+ICsvKiBJRCBmb3IgU1RNMzJNUDIxeCA9IERldmljZSBQYXJ0IE51bWJlciAo
UlBOKSAoYml0MzE6MCkgKi8KPiArI2RlZmluZSBDUFVfU1RNMzJNUDIxMUF4eAkweDQwMDczRTdE
Cj4gKyNkZWZpbmUgQ1BVX1NUTTMyTVAyMTFDeHgJMHgwMDA3MzA3RAo+ICsjZGVmaW5lIENQVV9T
VE0zMk1QMjExRHh4CTB4QzAwNzNFN0QKPiArI2RlZmluZSBDUFVfU1RNMzJNUDIxMUZ4eAkweDgw
MDczMDdECj4gKyNkZWZpbmUgQ1BVX1NUTTMyTVAyMTNBeHgJMHg0MDA3M0UxRAo+ICsjZGVmaW5l
IENQVV9TVE0zMk1QMjEzQ3h4CTB4MDAwNzMwMUQKPiArI2RlZmluZSBDUFVfU1RNMzJNUDIxM0R4
eAkweEMwMDczRTFECj4gKyNkZWZpbmUgQ1BVX1NUTTMyTVAyMTNGeHgJMHg4MDA3MzAxRAo+ICsj
ZGVmaW5lIENQVV9TVE0zMk1QMjE1QXh4CTB4NDAwMzNFMEQKPiArI2RlZmluZSBDUFVfU1RNMzJN
UDIxNUN4eAkweDAwMDMzMDBECj4gKyNkZWZpbmUgQ1BVX1NUTTMyTVAyMTVEeHgJMHhDMDAzM0Uw
RAo+ICsjZGVmaW5lIENQVV9TVE0zMk1QMjE1Rnh4CTB4ODAKCgpTdHJhbmdlIHZhbHVlIHRoaXMg
cGFydCBudW1iZXIsIEkgYXNzdW1lOgoKI2RlZmluZSBDUFVfU1RNMzJNUDIxNUZ4eAkweDgwMDMz
MDBECgoKPiArQ1BVX1NUTTMyTVAyMTVGeHgKPgo+ICAgLyogSUQgZm9yIFNUTTMyTVAyM3ggPSBE
ZXZpY2UgUGFydCBOdW1iZXIgKFJQTikgKGJpdDMxOjApICovCj4gICAjZGVmaW5lIENQVV9TVE0z
Mk1QMjM1Q3h4CTB4MDAwODIxODIKPiAgICNkZWZpbmUgQ1BVX1NUTTMyTVAyMzNDeHgJMHgwMDBC
MzE4RQo+IEBAIC02Nyw2ICs4MSw3IEBAIHUzMiBnZXRfY3B1X3R5cGUodm9pZCk7Cj4gICAKPiAg
ICNkZWZpbmUgQ1BVX0RFVl9TVE0zMk1QMTUJMHg1MDAKPiAgICNkZWZpbmUgQ1BVX0RFVl9TVE0z
Mk1QMTMJMHg1MDEKPiArI2RlZmluZSBDUFVfREVWX1NUTTMyTVAyMQkweDUwMwo+ICAgI2RlZmlu
ZSBDUFVfREVWX1NUTTMyTVAyMwkweDUwNQo+ICAgI2RlZmluZSBDUFVfREVWX1NUTTMyTVAyNQkw
eDUwNQo+ICAgCj4gQEAgLTEwMiw2ICsxMTcsMTMgQEAgdTMyIGdldF9jcHVfcGFja2FnZSh2b2lk
KTsKPiAgICNkZWZpbmUgU1RNMzJNUDE1X1BLR19BRF9URkJHQTI1NwkxCj4gICAjZGVmaW5lIFNU
TTMyTVAxNV9QS0dfVU5LTk9XTgkJMAo+ICAgCj4gKy8qIHBhY2thZ2UgdXNlZCBmb3IgU1RNMzJN
UDIxeCAqLwo+ICsjZGVmaW5lIFNUTTMyTVAyMV9QS0dfQ1VTVE9NCQkwCj4gKyNkZWZpbmUgU1RN
MzJNUDIxX1BLR19BTF9WRkJHQTM2MQkxCj4gKyNkZWZpbmUgU1RNMzJNUDIxX1BLR19BTl9WRkJH
QTI3MwkzCj4gKyNkZWZpbmUgU1RNMzJNUDIxX1BLR19BT19WRkJHQTIyNQk0Cj4gKyNkZWZpbmUg
U1RNMzJNUDIxX1BLR19BTV9URkJHQTI4OQk1Cj4gKwo+ICAgLyogcGFja2FnZSB1c2VkIGZvciBT
VE0zMk1QMjN4ICovCj4gICAjZGVmaW5lIFNUTTMyTVAyM19QS0dfQ1VTVE9NCQkwCj4gICAjZGVm
aW5lIFNUTTMyTVAyM19QS0dfQUxfVkZCR0EzNjEJMQoKCndpdGggdGhlIHByb3Bvc2FsIGZvciB0
aGUgZGVmaW5lIENQVV9TVE0zMk1QMjE1Rnh4CgoKUmV2aWV3ZWQtYnk6IFBhdHJpY2sgRGVsYXVu
YXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+CgpUaGFua3MKUGF0cmljawoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1h
aWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0
bTMyCg==
