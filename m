Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ClbLBRunWk9QAQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 10:23:32 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA1C184800
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 10:23:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D231DC8F285;
	Tue, 24 Feb 2026 09:23:31 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013031.outbound.protection.outlook.com [40.107.159.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A004C08D19
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 09:23:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dOyVi/3QM/MQXcrC3xB901qmZZm5AEfrOKJ+H5kC+R1e5Um3cxPCtby95dqI66Jfuy/CJeSLm80+83gt04XF2TCA0XZy+qdkIqWvfqFjvteE68Asz8MP4CG090NWtzeOtiWw1KjfTti994V/nPJCyyrWbw2w/4cRlng6cd0GYhJH6iXw7JKlMZyil0FkmKcDp8/wlYBXUKs/1VEguK7yZsBKqzR57cESxJFTW8zxB/aVx1exvip2vqMMiHR7mG3Dok8lEq7ukCRG3KbPcrtp8NdG2Arh9k9EOU5wwdjlljvQ2VHCd2UKUHthmX//SYEWTWzNu9hoFwI0CxPIJK+/pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJxnhfXor8QmUSwr9wHAKwWYyLWeO9Kq9YdBecf3kn4=;
 b=qAWS0KDgPJUGOMXsuu7sGjZUT3btvjurQyb95evs6h8S0g3L9xxHURGBvYaoO+ayM273TotuzPPl6d6XO7+HSlkXXSj7iV3d/D15xsqbcECREzrY7oF0+Z3MLiX6dYCnXgTHvhk7zcAdr2qjXhr/A2drMjapm0XGCt2i6eumSUn33mA5QFjwX/Lfs/uUwEDQnPcSe1sbuVHjoygbspd0wplnLpktypDpqT7SP+QSXUj5S10X9k3YhfhJvUHwui8kwKxw4kMRQypzmt+KH978YV8UmZncgAkMwly8b0ljtg48HQEmmgruCysRwanmHgAsp6h+WnXRZpY+VBM7qipOLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJxnhfXor8QmUSwr9wHAKwWYyLWeO9Kq9YdBecf3kn4=;
 b=dmQL+whXF11V1wqflFheWFpre508uIa6sq2OinhSXzMlkWn0OIH8hf/LG8YPzMr8IVXaUhf6can6chTAbn9An4LyReGeFC0K7iuZq3Bs2IWx2u3YBelyDkA3AHaWgdwIaTB56bsdU6oFt/WVvbYwaffx9IsbniXCj8Iege+MABw0XK+eAzu11SbTDSFkoj6+FgAUYw6sId6CVmC9RBVFFX4SkrQqsl7Qnv6LbivetRSmHpFcH+VIRxtOMRcYnTNtgAY5MkgGTiRzx5qFAk+hrn/DfnDxAkFwvSlFdsrrVbaOQBnqzk6peFmOetjfDORO/m2edBYK7ZAciQL0S9+VPQ==
Received: from AS8PR05CA0003.eurprd05.prod.outlook.com (2603:10a6:20b:311::8)
 by VI0PR10MB8882.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:239::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 09:23:28 +0000
Received: from AM4PEPF00027A62.eurprd04.prod.outlook.com
 (2603:10a6:20b:311:cafe::d5) by AS8PR05CA0003.outlook.office365.com
 (2603:10a6:20b:311::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 09:23:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM4PEPF00027A62.mail.protection.outlook.com (10.167.16.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 09:23:27 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 10:25:43 +0100
Received: from [10.48.87.244] (10.48.87.244) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 10:23:27 +0100
Message-ID: <7180c899-fab2-486a-be1d-83deb800cba8@foss.st.com>
Date: Tue, 24 Feb 2026 10:23:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260205-upstream_pinctrl_stm32_update-v1-0-3a3797af498d@foss.st.com>
 <20260205-upstream_pinctrl_stm32_update-v1-2-3a3797af498d@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20260205-upstream_pinctrl_stm32_update-v1-2-3a3797af498d@foss.st.com>
X-Originating-IP: [10.48.87.244]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A62:EE_|VI0PR10MB8882:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cb1f209-667c-411e-ce8d-08de73865e6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QkY4ajhrbzM4L250Tm9JekVBdDFxa1NtbG5uZFRMZTFDUkRNQkEwUnUraTJw?=
 =?utf-8?B?c2xmWUp2TEE5UVBHQ0x6WWZweWdvUTB4c1Buc1cvMkJHUUh4eEdYelExTDQ1?=
 =?utf-8?B?Q1QwYW5rUjNIZjBSTDl5T0c3aTRxejJLZWRrREw0dHBHUWJIVWtuS0dVL21t?=
 =?utf-8?B?S08zNkwwM3FBUG8xRjlZSW4yb1p1SENQZkx6b3UyTnJERzdnY0tnRmROOEQx?=
 =?utf-8?B?ZDBheStFbHhEWTV0R2ZNWTA4cXdUOVF4MVRZZkpqSExuUUVCSGVBMkI3YmNP?=
 =?utf-8?B?aFQ2SkJEVTh0MXBneFp2c0xQeGVMaTZZcWNkcktQV0NRczZWdWZMU1Bmd3hD?=
 =?utf-8?B?d2k1YXVmMUw0N056SUtYbU56RFU1em05Vm9QSEk2TjFjSEZkOG1PR3k1REsr?=
 =?utf-8?B?clRBbkdMdGp2QlRzV3J1dTArN09NRHI3eTBoUUxkZ0Nub3pFMXhtREplL0JE?=
 =?utf-8?B?M1pPVzRZdHA2ZExoUGl2ZG4vQk5xZHJSM0lFM3d6TXQ5T09ZUGZsVVM4RjJN?=
 =?utf-8?B?RWpqaFEwY1Y2SWNsVzZsSG8yeE5tWlpjOFk1T3lINURHem9ZN1dXajJEcUcr?=
 =?utf-8?B?Vmd1bDNTbm5NNDVhZlZyeGNoaUk5eWxjbTlZRjBWL2dJQStKbGVpRnFmaFNV?=
 =?utf-8?B?aTJSK1pIUHNKa2dtMzRNUGsyU2wwdW9Eajh3S2dremRkK0Nlc2JHYTVrczFa?=
 =?utf-8?B?RE9Zd0dJc0JaR2hIM3Nzd1dFVEVMWXQ3RXFIeGRmTXlGTGV3WFlWYWEwTTFm?=
 =?utf-8?B?dklzVmFBcVA3NHFKVDJrelR4SkU3Unp0bk84dm85UE1oei9xcGh5Q0ZQYVE1?=
 =?utf-8?B?KzF3WFR4Z3NDMktlUnZqYi8xYnp5ZTlNa3BybnhFNkRqc3d1MnJabzRXeDNY?=
 =?utf-8?B?dm5XT2Zqb1NISnk4ZCtTRzBRYzg4bnRjM3RwcnAzdnMya2YxNzNEZHhacDJi?=
 =?utf-8?B?WXNveDdHZ2tHeWFCaE1vUEhNajdCbkxXRlRGYjE4My9pbHoyQldkYTV1Q0ZF?=
 =?utf-8?B?SWl3YWVpcWZPUmJIVkFQd2N6Zm8wWlVmTUlqVk1BSGI4ZXpmV1E4dUdXc2tS?=
 =?utf-8?B?dXlNUVJyS3JhQkJLbDNxTzdVaXEvYytIdldxR0ZaVVo3WG9kaGkyNE1YUUhp?=
 =?utf-8?B?bkltNHhVQ01WV2JYajQzMjJObEcxbTVGUlEzSTdkV0M3ZHRTdkFGemxEQVVG?=
 =?utf-8?B?UENOdXJFdHF0NzFncE41MTM5bkgvYU1GTU5nMlY2a3Rzd2FZUHMzQWFhN3o0?=
 =?utf-8?B?cXFxZ3I1eHFmOGsrVDFOclhFN1R0ejJrVk5xK25Yck5MVTdvTGZlMlFsR211?=
 =?utf-8?B?Vk11WStwaFlzdzNGaEFiS1Z3VFRVSy9qcFl5YjNnQ2tqelROaWVrTmJ6N0Fv?=
 =?utf-8?B?U0xBY0psU3U0UmpkYWRtWk9wNldCT3pQbjcxdjZUV3lncHFHbXk3ZDNvZTgw?=
 =?utf-8?B?azlvVEZOMDFkd2MrUUpWOUZ5czRmcmZrdlVUTXRUOWg5UmRkREhQY2MreWh5?=
 =?utf-8?B?NDBaOGpGZGtkeWYxWFY0R3dncEQxWExqWnlpV0dRaUhkRnFRV0JlZlJVY2xF?=
 =?utf-8?B?MzdBa3ljYmlNb0g2YkNSdno4Y1d3RjZ4akM5Z0RSUUt1MkJmaisyYnhWNVo2?=
 =?utf-8?B?eDkvWURyZWtUZTU3QlRTR0EvaXpoZ2RjTnFVM2dwVnY5NGw2YWcyeFFXYmto?=
 =?utf-8?B?YWlwTWFGd0l1ZE9TNGN0clRRS1EyM1dOR2pNV09hTHdlSWVrZkZRQWdoUXll?=
 =?utf-8?B?ZGd1dktFSlk1L2ZndEZIemJ4a25Ba1V5RHJWSk9mT09GSDVqQ3pKSXQxSW1T?=
 =?utf-8?B?YkJZUDRwajFlSzlzQ2oyeVlUaWxGT1REWFVlVGhiVU9WRkphekNVRXBldzZB?=
 =?utf-8?B?NklrbDRMcUZ1UFpBQVB5aHRGbWFKUG1ObDJGNkdmSEI4OW8wRit2L2JMTGFS?=
 =?utf-8?B?dzJsL0Y1ZU9pc0cwUm1qWVNMZUhMOXlPOGlYS0FtWUdCWE1nNjBiYUhlYzB3?=
 =?utf-8?B?NklTdTE5eHdqdEtIUFFOcy9LWmFQS2d5c25BanpOSit2UG50RVYyRiszNEo2?=
 =?utf-8?B?VUMxT1p2MXNlcUVmbHNCWEh0a0x1V0dSdXpqWEFieFF0WFJ0OG1DRUZYWVBu?=
 =?utf-8?B?NWNHc21OVHJTZDdnS1czNFFlclpyNGdIL2kzVG1XcHVwZ2pKbEdOT1BWNEZQ?=
 =?utf-8?B?LzNQRWY3cXF2bHh4WGVDWk92V2xwV21PYkFWL1FpK3RpbkhyWmpvWWdqSmNU?=
 =?utf-8?B?Q1I5akdoa01MazJMTFV4Q2cwTUZBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: AZFHiz2hUL5/Qp7LqAHgPMgJBcBWK/qWVCb+LWnyFZQQuufoRGUbv+SZldjfcGgDF1nGydQ+Dt8yQIicVgPIXA5d+SSeGT1xejiOQn9631b9sTTwIvyVxURWc2zSpAhxz6O8kElWp5/nNalJBI2qypXeGs9B8IRkKP3oh58zuB2DBdbZvswwBjJneP1/UaO8nAIKAdyx+gGtaINNX6TA364taNwuMhu9Wn5QpwDzseskGwenuaLNO4H3TvePsegRQsjpZFZ5G//zpFZA0BhPgEMmwxjk3h3oCj3xJHe0Y6H1kPbZoDulGR01/Y+4hLU/Q13HmlMm0GmVdjjwyE5vX5vVsbcjzgbicifEz8bQMD2kfQQxIrT2Xd8G3yd2KB9m3Lj/dyorq0oTEEQE4VisofHsOX4AlUmOf1wP9k+5yOeyxPojS0uMkwjdxDfz4ynm
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 09:23:27.9262 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb1f209-667c-411e-ce8d-08de73865e6b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A62.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8882
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.89 / 15.00];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:patrice.chotard@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:valentin.caron@foss.st.com,m:fabien.dessenne@foss.st.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,foss.st.com:mid,st.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4EA1C184800
X-Rspamd-Action: no action

Hi,

On 2/5/26 09:07, Patrice Chotard wrote:
> From: Fabien Dessenne <fabien.dessenne@foss.st.com>
>
> The hardware denies any access from the U-Boot non-secure world to the
> secure-protected pins. Hence, prevent any driver to configure such a pin.
> Identify the secure pins with "NO ACCESS" through the 'pinmux status -a'
> command.
> Use a driver data structure to identify which hardware versions support
> this feature.
>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   drivers/pinctrl/pinctrl_stm32.c | 83 +++++++++++++++++++++++++++++++++++------
>   1 file changed, 71 insertions(+), 12 deletions(-)
>


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
