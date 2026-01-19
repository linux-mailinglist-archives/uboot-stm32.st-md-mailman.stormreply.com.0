Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7425ED3A932
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 Jan 2026 13:41:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42CE7C8F28C;
	Mon, 19 Jan 2026 12:41:06 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BBB43C8F27C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 12:41:05 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60JCZs5o224502; Mon, 19 Jan 2026 13:40:47 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com
 (mail-northeuropeazon11011039.outbound.protection.outlook.com [52.101.65.39])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4brp8qbkeg-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 19 Jan 2026 13:40:46 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VR0mmazqVUWSbJNsHCb7L3sHyckVDxvR+2JbkYc+FcE34HeWiBm6Yod2ll1fBNFCNGTDDlvQiJVdIU5LWoTgVztBl7KF9pjAQl0gh/AEvPjUMtaYSpMXzQJ+wEKrctf1C1V7dIvjCqF8JpsyCMCCacXRj9VTRZdlkYXzlTji2GI1A0Z3O4ywNDrnsCGxXjkMDL7jvgBxWqfPawSFmXcp//dLMjYDe3hIv4jVUD1cSb5rghpT8emVQ+sZMumyGUqRnTOfHHaJi4/ayWNL1+oRI0D579tJiq1wQnC6GmTbLv9r6kJPVHilgGT4zAhgwgpwOZPE+ZksHvPN6gZRYrFV5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=moLCYa5rR2dzHPVrmnTZ/SF+nkodqoo9msvDJwC41u0=;
 b=Y1i/PiETIz+5kelWtecvKXPq84jHCx4LTTMsvk8wyglYv4bwbw5YC9A4nOBxxbzMVv9E/uNVyIa3CAutLLO4baDA/lOJkLD6DdvijRMEPpN8sNaHjVXXLVrRJ6tFEA4jKKMRCs2jupRK+RxtBJkhsRSVjYSn/Q5Fu2wmZzL3jnvNWWq3FSR111CdyFX09/zXccHCPEP95fUrjme0TwbRRKO1VR5VjNNwkOWaG6K/ugQfVXF3TtjT739UfhDIkspdanhSd3WBvJlG/vIhc+1G7h6bmHEfwO5ebdJD70gqMACVti8k+1F9xtllKBtOiEyQ5QXqcg90qH5VlZiBexcBuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moLCYa5rR2dzHPVrmnTZ/SF+nkodqoo9msvDJwC41u0=;
 b=I9++fccZU5vIsD6SuxTftt2pmDGw2UxcreKSuggl89HxvRPgUUZ9pN4MXFvidn8eFbW6FpSCfKrcHDdXBe9U1prAFKHnhDVjduGArDriDACAYWGRnFH1+TvglvJTqfXFxc0h/ofORijbRqWoeGbuwd/1vH5LqB0RcLzypp9ZVJlvIyFD87RnVY3TKUjU0dQZWiAq06s2EdFz1oSlOO8jQdymNpyryQQuFD2gpIPtfIv84meHLWtYG0QORoLEuht1eAserXGjY/NhGs+J8iZzbJib6cnZd2CM+FJCM5ShaInGxAGSGQKfgcItiZgAqMjyDcFO0CsppU6KszsGPWEBlA==
Received: from AS4P189CA0002.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::11)
 by AS8PR10MB6697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:565::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 12:40:42 +0000
Received: from AMS1EPF00000049.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::4d) by AS4P189CA0002.outlook.office365.com
 (2603:10a6:20b:5d7::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Mon,
 19 Jan 2026 12:40:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF00000049.mail.protection.outlook.com (10.167.16.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Mon, 19 Jan 2026 12:40:42 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 19 Jan
 2026 13:42:08 +0100
Received: from [10.48.87.244] (10.48.87.244) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 19 Jan
 2026 13:40:39 +0100
Message-ID: <6542b1dc-0e6c-4364-84bd-74d666a95402@foss.st.com>
Date: Mon, 19 Jan 2026 13:40:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>,
 Peng Fan <peng.fan@nxp.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>
References: <20260116-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v4-0-d7cf17cd678c@foss.st.com>
 <20260116-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v4-1-d7cf17cd678c@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20260116-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v4-1-d7cf17cd678c@foss.st.com>
X-Originating-IP: [10.48.87.244]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000049:EE_|AS8PR10MB6697:EE_
X-MS-Office365-Filtering-Correlation-Id: ba7dc78e-4103-409a-9e59-08de5757f547
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFA3eExyZWlidEhnV3A0RjRHZmlsaG1aaHV4aUtoeFVoSVlaTS9STFBCZE5U?=
 =?utf-8?B?NjA5aUo5RDIxV0xFcE5jY1VScXhSWmozRjJLNWt5bUpEWVZPcFl5dDRsVUZY?=
 =?utf-8?B?Vk90ajdxV0dyZHdORFdld2tycTRCalFpM0RMQXMxTzU0SHRxUVBQQ2NBaXVy?=
 =?utf-8?B?TmFjaU9MQ2QxMm0yQWp3RVFiR3RZT3ZaM0JwN0ZiU1NlNUdHQTc3ZUtQZ0Rh?=
 =?utf-8?B?dmZHVmh2WC9HdDZVM2F2ZFlycGxPSEx0enE4RmFLcy9ER0daOFBTL2N6ZE1N?=
 =?utf-8?B?VkRzTE5yMERvN1R1amhFaUVPUnhCL0RIMWNvTERVdUJPc0R4dEdmc05MQk92?=
 =?utf-8?B?NlBtUm9NTHVSU2oyZEJrVHlmWWhocGVNM0lHNzVlYi9SUTlLS3FpczlYVk91?=
 =?utf-8?B?RVJodU1qZ2lHYklvNDVKZG5PVzJSdThxQlFOY1NueG0xa0RQZlM1N2MyNHBo?=
 =?utf-8?B?WGt4YXZIMWlDcmplQWZWQlhZSmVXR1NVeDg0aUViZDMwdkZ6am9hV3hMcTFL?=
 =?utf-8?B?MGNDODlYTndiMmZHdUZLcEs4dFVHYVZyVzBGS0FZb2xweXBpYVJvNm5uZXJZ?=
 =?utf-8?B?TTA4MHNETDc0a3Y2VUp4Y0d6c2JXOSs2TEZvdzF1a2NCV2Iwd0xvaWdyWFpZ?=
 =?utf-8?B?Smx1QnpEUWs5UWpjNndDOGpYTDI4RUdxMld5K2FnQ01Danp3bWhVb2RBU3lH?=
 =?utf-8?B?bWpyM0UrbGJGOXA5cVA5N21sd2lkNFRnU20rbk1Qd25aQktxWmxqZmxib0Vm?=
 =?utf-8?B?OFg0VDY4NVJyZGpHbjQzblpBYjgzUzF6Q2FYWXczaVFUM2RIcTR3VEJic3hq?=
 =?utf-8?B?cThjSlpjSDYrSTF1SlNNNWZWMzJTNytXaytxd05aNU9xYnBVaGxwWVZZZlVZ?=
 =?utf-8?B?WDVoeldtQmlsZFhreGZDNENZdnYxOUw0R1ZIbThYbmtOVWhEL2x1ci85cEE2?=
 =?utf-8?B?dWczeUxPREtZKys1SE9yNkkrTjJoTHU0bUg0eEMwYktlYVdOeHRhUHZVOGpm?=
 =?utf-8?B?VTkxYmFEelp2cEYycFh4OGNwaEYxaHN1V25PWXZta1VqTlcxR3hmWjgzbHFu?=
 =?utf-8?B?dUJkQVJPWjZnWVp0VjB4a0VLc2dPNVFlK3pkMFIvZHlFWDdIUmhTOTFIN2JY?=
 =?utf-8?B?SlNRYjltMkVRRHloZnlGaXRYUGxMVExhL2t1RUlMYWpwSld6TzNmaThGSXUw?=
 =?utf-8?B?ODUwTU94U0RkUklGeVpiYWVEUG14NmdzMlN2MnE5OUdCb3BISjJ2dTUrWTVR?=
 =?utf-8?B?ODdCN09sd25zb3RkZXNQcUNHSUI2ZHQ4ekt5UmovcEFvRmtzM0ozVTdvYkNr?=
 =?utf-8?B?QVdkcnhBVmQ5RG9vY00xVDkzZENSREZMOXd4K0U3UjcwSnA1aS9JTnlYaEhL?=
 =?utf-8?B?aXdCMDJNK0svdFNBbzVjQWExdGFURWd0VFlsWTBkNHQxZXN6ZFo3b3I5NnhJ?=
 =?utf-8?B?RW1rUFEwVDR4WUVNTjlOclgxanZvR2pJY2NHVzM5SUl0QjBLaVFycmNleURI?=
 =?utf-8?B?dFBsdGV1bHVTMkJwblI4emxPdGw1MzJ2VEw5Y0MrcGdHRTdOQUZUd3l2QTZB?=
 =?utf-8?B?Q211d0FtaXA5NDd1clN4d1pqVTVodnNZRUhLYURBMTlQUzRCeFBYWnVpdnlJ?=
 =?utf-8?B?akFrTk5VQWZWOGp0ZHF2amdoZmVuWEozaWRyY2N1L0lsMDBaTGdJaGlXaDND?=
 =?utf-8?B?MEd0azJyS2JUUzNQY2JkdXVXOHBrVXRVYm90MmNXakJtcElBQUNsZTFOOEY0?=
 =?utf-8?B?eXdrb3BoNjMxcnY4RGZlRmJFVmx0dkJydkNISUV1NEQzUUJsWHhHVis0V2h6?=
 =?utf-8?B?SW54L3F5bWU2Qlo2cDNGeThZMGtEYjljcUpnSFc2dzhKQ25KejJoeURod3dk?=
 =?utf-8?B?OFlHMnJOMlMwdzBFKzlSN1FOZXlQYjlOMzRMN1dlbWpZdEFNWmhKTmJsaEFT?=
 =?utf-8?B?WWVJNU90VUF6dU1ubXlQbWNUMk5CUTY2NlJwbURjS3htZUhjQndNMGIvNy9T?=
 =?utf-8?B?Zjd0dkNZczVpeVc0R1JmV25xNG5zWlltR1RRU3pUVmIrRHNnSThCV2NXbW1j?=
 =?utf-8?B?ckh2SVd6SXZENHNIazdKcSt4QUFDN0dyUm83MjZSU0F0M2JERE1rL1BWa0pI?=
 =?utf-8?B?cW8rSktsTWR3R2twMFU4cWlDOXd3dWp3ZmdoMHdLVW5LS1BvenVJWkpiNGF5?=
 =?utf-8?B?QXc9PQ==?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 12:40:42.1169 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba7dc78e-4103-409a-9e59-08de5757f547
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6697
X-Authority-Analysis: v=2.4 cv=Hod72kTS c=1 sm=1 tr=0 ts=696e264e cx=c_pps
 a=o2r0EXsQLJAwA017n686jw==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=vW1nh7Jg1_YA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=XpE1AkgCAAAA:8 a=8b9GpE9nAAAA:8
 a=enggsrxaHjHF0MqrOHgA:9 a=QEXdDO2ut3YA:10 a=_VNrz7lXTIYA:10
 a=dpZMgbseYPk84XhQl7oQ:22 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: heGK28Ys8MgE43Y4pj5kmSu3a3mdTTwc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEwNSBTYWx0ZWRfX/rZpawpgukK1
 ty16poy6rp7UMLh3tcGUSdsdld6n1NpRxnP0m4GFMOfat9Oq1fuHDK3uVkssmClwqC44c3Qz+vp
 8hbpSV9you8Cwc4Iiz9HNIxanJ9RCgk7OPQHYaEDZGwtC9SIBNSu7swvVS9jc9JJzXX/FSD+MEH
 ZhdVqhqCMC88eR8NZnOshzUGiHAQdz+Qv4yile6BpJ7PAkNZVaJyz91JAjU4o/n49Taes6OZTbU
 SUc3kOifHKlt1Yppzo82sC1VsLd4hXHmYTR1d/Q7XzvK5oTMUtbQEjhrjsoGQEgjfsFnw1jHPHl
 rP+1qzaLPy86QFqfZjmXqLFKhE0EMfB/8sbKjqTnThHZMxjeRsXM+/6Af7fBVQtBRty7O6MnGIE
 0lgsxQvld4WWnwHu/Y2uTZmwTTVd2OvNyjiCU9RB7NruqWoyjAtiKCoF2uOdVrCNeUsbNQ0B5Iu
 LtkiQNAVXbl9mwYEzTA==
X-Proofpoint-GUID: heGK28Ys8MgE43Y4pj5kmSu3a3mdTTwc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190105
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Marek Vasut <marek.vasut@mailbox.org>, Lukasz Majewski <lukma@denx.de>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v4 1/3] clk: stm32mp13: Reorder include
	files
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

Hi,

On 1/16/26 19:57, Patrice Chotard wrote:
> Reorder include following rules available here :
> https://docs.u-boot.org/en/latest/develop/codingstyle.html#include-files
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   drivers/clk/stm32/clk-stm32mp13.c | 24 +++++++++++-------------
>   1 file changed, 11 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/clk/stm32/clk-stm32mp13.c b/drivers/clk/stm32/clk-stm32mp13.c
> index b4d0890f902..18e9ab364b4 100644
> --- a/drivers/clk/stm32/clk-stm32mp13.c
> +++ b/drivers/clk/stm32/clk-stm32mp13.c
> @@ -5,28 +5,26 @@
>    */
>   #define LOG_CATEGORY UCLASS_CLK
>   
> -#include <clk-uclass.h>
> -#include <dm.h>
> -#include <log.h>
> -#include <asm/io.h>
> -#include <dt-bindings/clock/stm32mp13-clks.h>
> -#include <linux/clk-provider.h>
> -#include <dt-bindings/clock/stm32mp13-clksrc.h>
> -#include <asm/arch/sys_proto.h>
> -#include <asm/global_data.h>
>   #include <clk-uclass.h>
>   #include <div64.h>
> -#include <dm/device_compat.h>
> +#include <dm.h>
>   #include <init.h>
> -#include <linux/bitops.h>
> -#include <linux/io.h>
> -#include <linux/iopoll.h>
> +#include <log.h>
>   #include <regmap.h>
>   #include <spl.h>
>   #include <syscon.h>
>   #include <time.h>
>   #include <vsprintf.h>
> +#include <asm/io.h>
> +#include <asm/global_data.h>
>   #include <asm/arch/sys_proto.h>
> +#include <dm/device_compat.h>
> +#include <dt-bindings/clock/stm32mp13-clks.h>
> +#include <dt-bindings/clock/stm32mp13-clksrc.h>
> +#include <linux/bitops.h>
> +#include <linux/clk-provider.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
>   
>   #include "clk-stm32-core.h"
>   #include "stm32mp13_rcc.h"
>


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
