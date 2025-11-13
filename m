Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FBCC594EB
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Nov 2025 19:00:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD973C628D4;
	Thu, 13 Nov 2025 18:00:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B90BC628B7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Nov 2025 18:00:02 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADHiRxT085314; Thu, 13 Nov 2025 18:59:59 +0100
Received: from pa4pr04cu001.outbound.protection.outlook.com
 (mail-francecentralazon11013039.outbound.protection.outlook.com
 [40.107.162.39])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4acreu6aef-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 13 Nov 2025 18:59:58 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WbVKsM1CHik6n9rf7JqOKWVqHI8HOyOlCWJpgTbpQVf5dXdg4CGq6ior+R2YbFYLwjd+6BbbLTz51PecaHuE7eeeywxldVqf9FLh9deb7XCwRaSFal9Sh8OuAKvrzr3JCkTmhf18KOCVJY/M7fwB6reuv0wn3xqn8OzkhmjBsB7LfixeLhxepxgCYCeasc4M3O9xkaCwLhKcJPw+R1Bx5CcJ2qQIOUTkB6vN8ZeQ2siohkcbRE6CFQ/2u8VSBA2w++L9PxaEAlrKPxrYLB0pNdnMeMzsrYE89oHyDqVQvNGI6Z9w3NmC9/UPNQRJmSbh8Q9CjujnIgtF48S/Q6xtIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iOX32X4sR6YipVYb1WUIGETYifZJktkfp/+5MYgtVxM=;
 b=WAjl1x4U8fXzF4BV92PJWHQ6pqfmLT2g+i1Aiaojub8/BMm3JbjlRdbWFsz7qqmfwjdcaTOTiKNEITfV2X62aFWQUgbVrK4xWo/a2pvVilkH4JqRpG3/CSBT38JfKa9+UW0Pdk2ogUJkaDUA8EUQFItZ066GFkzpy+NEfofpCIk24nkU0LW3+vk94KC5xJ+WfE8LutWwwnSQCV+1sKmMprmoRKZthYcYDKhb/VNUq0W9LA93sLTivGG0R6nzTHloSEoXH1YUL2/l1YTuzgxubAnFIefCWvektTU0rCfjA763ZaSWrq9cQZ4IIrwcmPtF7kprUu9ZwnEwtT8415axKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOX32X4sR6YipVYb1WUIGETYifZJktkfp/+5MYgtVxM=;
 b=FYapvFzwt2TbbHyh7fJz71GZLciHvFle0BG+ry0dmBl0ol1xhJH+uheU2MGSaozBTDfdoHYNwZ/qPNbN0OMg/YYb00oWeYqqtt+L50BO97zjKa2LgPsntdGryLx5dXP/PxyhN3UScy7fFmdpVQgZosT1ggdivnRs8XksgSkCWDdyt86hJcKX8SkgF7Cr+xUiNWBSZBJTDzTHh9cJq5wWQbuYbpU845RmY4DjMQNd5L0nsTrumY/Gn6YAviWNTjKOOgJxRmh+8RNR4z2p1hHZ62REkIp3gnq/TCU21c7kY+xzxbH9mQyl2Nk8J0oN0RsI1a1xTcB1XS2redp7jFWOAg==
Received: from AM6PR10CA0067.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::44)
 by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 17:59:55 +0000
Received: from AMS0EPF000001AF.eurprd05.prod.outlook.com
 (2603:10a6:209:80:cafe::b9) by AM6PR10CA0067.outlook.office365.com
 (2603:10a6:209:80::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 17:59:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF000001AF.mail.protection.outlook.com (10.167.16.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 17:59:53 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 13 Nov
 2025 19:00:04 +0100
Received: from [10.48.87.108] (10.48.87.108) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 13 Nov
 2025 18:59:52 +0100
Message-ID: <10609ea2-d2ee-4e0c-bf9c-1178e67a5776@foss.st.com>
Date: Thu, 13 Nov 2025 18:59:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20251009152610.300154-1-patrice.chotard@foss.st.com>
 <20251009152610.300154-2-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20251009152610.300154-2-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.108]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AF:EE_|AS4PR10MB6181:EE_
X-MS-Office365-Filtering-Correlation-Id: 09b26082-bfad-4b06-33f6-08de22de7279
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmxtbmZSNGZKR3FXSThzS1lUbDdONkdQbXRkNml0em9zd21DSDBRVGpPTHAv?=
 =?utf-8?B?czdvQlRxVzNxNTlpSWoybStEbzY4ZVU1bjRGdWlVVldSN1cvTHdxSng1dVlm?=
 =?utf-8?B?bWdNVUJKb3dGeTh2ckY3L3ZMV0xRakpnWHJaUE9lZ1c1UHhmTnZUV3JUbXBm?=
 =?utf-8?B?QUxTdmgrR2xVYmZxWUpFSlpBSEV6cTBMQWpQcWdMVWdienlFclFPeCtyak5Z?=
 =?utf-8?B?eFMxUVh2WGlHQzFjMEozZ0VuOGpXcnNUYVRPblhMVlB5aFUwellFR3pqeVNE?=
 =?utf-8?B?Slh6b29VOHB1U3dPT2RrVG9pclk3bmhodWpQZG85cGdESUZKVXUzNmF3SVlP?=
 =?utf-8?B?ZWN1VmE5OGhhcnp4RlFnSTd2c2NsWXVFTDlPN1VUTDEwb0VZWHM5NUFwUSt1?=
 =?utf-8?B?YnVYM3BTaUtMTXZ5bnN2Z3N4WGM3aFl6TlhzOFkvbUh5YnNJQlBkeXB1YVds?=
 =?utf-8?B?ZGNRR09WMDZHSXpJbndEbDQ3N2FkNG9jWEUxanNuQjBlQjZJVXBkNkprWTBC?=
 =?utf-8?B?K3paR2JVeFFEeDhTOUtjdUVBZ0IwNE5zR2RoR3VqVi9NUHFHTWhvdGdaZEF2?=
 =?utf-8?B?cm1IOWFWMERjd1owcGh3NmU1YTM3a1lQT2ViVWVlanZIUWp5Nm5VNC9TWHlW?=
 =?utf-8?B?UnBjbHFpVEYreUEzWjlSQlVCaEFKdkEyWDdNcTZiM3JYR1pyWHpYMmhvR3Nu?=
 =?utf-8?B?YWgwVWxHMk5ucFZJUGtGeFZmRC9nZGJ3NG5SYmE3ZkU4M0lFNlA5UlF1K093?=
 =?utf-8?B?RDdyS2dwTjJmbGcvNnY0Tm5GZFphRjEzbmIwbGFOckI0NXJxQ2UrY1haMXJQ?=
 =?utf-8?B?b1V0b3R4czZJSllPcUpqUE1EV2RZeUZNVmpCM2xpMHplS2hkNll3Y0I3Tlcw?=
 =?utf-8?B?VjZzRG00Vk16SHlxdnZwQzFOa01oRE5DbFlUcG5UVXVRcFZPb05GTC82N2Zu?=
 =?utf-8?B?YUs1dnZSOWI1S0QrbEpWM0w2RTZ2R0luQVFIdUhicWZUQmM0VDRPYTJ6NmtT?=
 =?utf-8?B?RzV2Zy9iendZMlpDb3JnMnJ4NjIxcG5SR2hjWTRET3lDWi9kalFWM2czT3VC?=
 =?utf-8?B?eC9RZDhjV25HeEtuWmw0OVhUZ2tFMXI1SThYUWVjUjkzTzZQQXZKU1Z1ZXU0?=
 =?utf-8?B?Y0NZSktScWswOVV4ais3QTNOdFJYSXNIWFFPNTJyOUpRZDFqRVNGVG5hdm0z?=
 =?utf-8?B?RllGVG42TlpEelFVUkZWVUQyZTRJQ3VOV1g5NnVBNWRwL2dkREhYWXVnWGp4?=
 =?utf-8?B?K0RiOXdYOFhOeFBVcHNPODNCbWlkVVZGSmtMSGxjbFZadzRpM3E1K0UxM1NN?=
 =?utf-8?B?VTYySFVkbmVvZFJnbThQaXlTNEE0eW5QU2JMNHRERDBTWTQvNVBrMEhYYXFM?=
 =?utf-8?B?UGdEREZpalluTWUvMTMvT1QyU1hCZVhOUUU4Sm1OUy9BdUN5ZkdrZmphSm95?=
 =?utf-8?B?dk5yWUNhQW5CcnNMU2RQcUlEaE5QaUZJOXMrYW9JdFFscTZWK3BIbStEeVVS?=
 =?utf-8?B?N2YvOFlZaDlXYTczUmdpV1A0RTVlbmdkb2drVnlGa1V1TkpPWFVpUThaaUc0?=
 =?utf-8?B?OHJScnp2UTdRUXV0UUhLUVMzZ3pub1ZXQ0t3cGZZam9LYTV0UUtZSnZ5YjJa?=
 =?utf-8?B?UFRjQkVqK2pNSzVRVVlpaUNVWW5qeC9HVE9XNVJJcUJ1MzFrRUg4V25KQ3NR?=
 =?utf-8?B?UDJzNTRLR295djY4dXJIZkpXcTkxTE5vK3VGSndocTlWejltT2JtUGhCM3hF?=
 =?utf-8?B?LzBJaWVrQzMra0hOK2FiY0N2UFJaNXhLWWRnRE5lcFY2L3R5cVRiODBpZ3cx?=
 =?utf-8?B?cmtLSGNVell2aHdJTXh3NlhKWmpnaWM2eWhmM0hhNmVLeHRzemh4cHFJV1Nq?=
 =?utf-8?B?Qk5wM1EycTUvY2ltTG9UOHpQdGhDNGMyVmJ4RXFjMVNQdjBZS2pkZDB1Wkpq?=
 =?utf-8?B?YlN5TmJMRjBsRjI1WW42WjY5d3YybU1NbDI4Wkkva2F4VlV2YlV4anppUXFi?=
 =?utf-8?B?aHRpTGJ2QlB1WVBaRW1zRjhzb1NyR0xhck5rRkdTUEIvbm00MCsyYldPUWhk?=
 =?utf-8?B?L1VNbWNIb091c0xmaHl6R1hYMUFYSWk1R3R3MlNvWkcxdTZEQk1GaGdLcnNB?=
 =?utf-8?Q?8sHI=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 17:59:53.1084 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09b26082-bfad-4b06-33f6-08de22de7279
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB6181
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE0MCBTYWx0ZWRfX5ZLvYMx6cR8w
 FamRIYZFLjy+9HqNzHf7H8YmNOJJ6jWe6xvJk0z0f/bX+UUbOykZC07Z65fjqwZhhbdc5o8KDYd
 50sOWLRrjnMVaSt7YvHFtAakj/Y4sJb93aBiBZU/J+t/55u+TQJqv0nAXhvUOPTqMP68f56b8y6
 zu8DUcFTj8ISQEmAT+SjbAIWQEFXpaypbcvveqBTfiqTBe5ffM3kRsvTPN3VDL437GLkXjlQ1fG
 UkqrX1Nr4qQ4k/6+mOLjv6JvdoE5jZcMkXzTm3mJzDjnjpCjlYn51KP77xKxzp/x3bjO/cmtzbB
 Yr+XC9+2cy6u4a7PwEVaLjTMFMguW21xvxnd+yXbCHdH3xLRRbOZ+U0UojG/DOL1zgcUl5GDQMN
 EOkDpigr6telxsFyL1VvmUa3z8TkgA==
X-Authority-Analysis: v=2.4 cv=D+hK6/Rj c=1 sm=1 tr=0 ts=69161c9e cx=c_pps
 a=6PCtUV3SjW4dSF/fw/j/Nw==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=q6CKDgr7omsA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=PUsbfvoI6Aq4JJ9LE7IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=T3LWEMljR5ZiDmsYVIUa:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: A-k06rSz5Z_vGS3qOLbZgW08e03JoiD3
X-Proofpoint-GUID: A-k06rSz5Z_vGS3qOLbZgW08e03JoiD3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_03,2025-11-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130140
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v1 1/3] adc: stm32mp13: add support of adc
	to stm32mp13
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

SGksCgpPbiAxMC85LzI1IDE3OjI1LCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4gRnJvbTogT2xp
dmllciBNb3lzYW4gPG9saXZpZXIubW95c2FuQGZvc3Muc3QuY29tPgo+Cj4gQWRkIHN1cHBvcnQg
b2YgU1RNMzIgQURDcyB0byBTVE0zMk1QMTN4LiBUaGlzIHBhdGNoIGludHJvZHVjZXMKPiBzdG0z
Ml9hZGNfcmVnc3BlYyBzdHJ1Y3R1cmUsIGFzIHRoaXMgaXMgYWxyZWFkeSBkb25lIGluIGtlcm5l
bAo+IGRyaXZlciwgdG8gbWFuYWdlIHNtYXJ0bHkgdGhlIGRpZmZlcmVuY2VzIGluIHJlZ2lzdGVy
IHNldAo+IGJldHdlZW4gU1RNUDMyTVAxNSBhbmQgU1RNMzJNUDEzIEFEQ3MuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBPbGl2aWVyIE1veXNhbiA8b2xpdmllci5tb3lzYW5AZm9zcy5zdC5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+
Cj4gLS0tCj4KPiAgIGRyaXZlcnMvYWRjL3N0bTMyLWFkYy1jb3JlLmMgfCAgMSArCj4gICBkcml2
ZXJzL2FkYy9zdG0zMi1hZGMuYyAgICAgIHwgNzkgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKy0tLS0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDcwIGluc2VydGlvbnMoKyksIDEwIGRlbGV0
aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYWRjL3N0bTMyLWFkYy1jb3JlLmMgYi9k
cml2ZXJzL2FkYy9zdG0zMi1hZGMtY29yZS5jCj4gaW5kZXggYWYzNDBiOGIyNzMuLjM0NDZlMzRm
YTQ2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvYWRjL3N0bTMyLWFkYy1jb3JlLmMKPiArKysgYi9k
cml2ZXJzL2FkYy9zdG0zMi1hZGMtY29yZS5jCj4gQEAgLTIwMCw2ICsyMDAsNyBAQCBlcnJfYWNs
a19kaXNhYmxlOgo+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCB1ZGV2aWNlX2lkIHN0bTMyX2FkY19j
b3JlX2lkc1tdID0gewo+ICAgCXsgLmNvbXBhdGlibGUgPSAic3Qsc3RtMzJoNy1hZGMtY29yZSIg
fSwKPiAgIAl7IC5jb21wYXRpYmxlID0gInN0LHN0bTMybXAxLWFkYy1jb3JlIiB9LAo+ICsJeyAu
Y29tcGF0aWJsZSA9ICJzdCxzdG0zMm1wMTMtYWRjLWNvcmUiIH0sCj4gICAJe30KPiAgIH07Cj4g
ICAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9hZGMvc3RtMzItYWRjLmMgYi9kcml2ZXJzL2FkYy9z
dG0zMi1hZGMuYwo+IGluZGV4IGQ1MGYwMGYxMjMzLi44MDhjM2M2MTBmOCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2FkYy9zdG0zMi1hZGMuYwo+ICsrKyBiL2RyaXZlcnMvYWRjL3N0bTMyLWFkYy5j
Cj4gQEAgLTQ5LDE2ICs0OSwzNSBAQAo+ICAgLyogU1RNMzJIN19BRENfU1FSMSAtIGJpdCBmaWVs
ZHMgKi8KPiAgICNkZWZpbmUgU1RNMzJIN19TUTFfU0hJRlQJCTYKPiAgIAo+ICsvKiBTVE0zMkg3
X0FEQ19ESUZTRUwgLSBiaXQgZmllbGRzICovCj4gKyNkZWZpbmUgU1RNMzJIN19ESUZTRUxfU0hJ
RlQJMAo+ICsjZGVmaW5lIFNUTTMySDdfRElGU0VMX01BU0sJCUdFTk1BU0soMTksIDApCj4gKwo+
ICAgLyogQk9PU1QgYml0IG11c3QgYmUgc2V0IG9uIFNUTTMySDcgd2hlbiBBREMgY2xvY2sgaXMg
YWJvdmUgMjBNSHogKi8KPiAgICNkZWZpbmUgU1RNMzJIN19CT09TVF9DTEtSQVRFCQkyMDAwMDAw
MFVMCj4gICAKPiArLyogU1RNMzJNUDEzIC0gUmVnaXN0ZXJzIGZvciBlYWNoIEFEQyBpbnN0YW5j
ZSAqLwo+ICsjZGVmaW5lIFNUTTMyTVAxM19BRENfRElGU0VMCTB4QjAKPiArCj4gKy8qIFNUTTMy
TVAxM19BRENfQ0ZHUiBzcGVjaWZpYyBiaXQgZmllbGRzICovCj4gKyNkZWZpbmUgU1RNMzJNUDEz
X0RNQUVOCQkJQklUKDApCj4gKyNkZWZpbmUgU1RNMzJNUDEzX0RNQUNGRwkJQklUKDEpCj4gKwo+
ICsvKiBTVE0zMk1QMTNfQURDX0RJRlNFTCAtIGJpdCBmaWVsZHMgKi8KPiArI2RlZmluZSBTVE0z
Mk1QMTNfRElGU0VMX1NISUZUCTAKPiArI2RlZmluZSBTVE0zMk1QMTNfRElGU0VMX01BU0sJR0VO
TUFTSygxOCwgMCkKPiArCj4gICAjZGVmaW5lIFNUTTMyX0FEQ19DSF9NQVgJCTIwCS8qIG1heCBu
dW1iZXIgb2YgY2hhbm5lbHMgKi8KPiAgICNkZWZpbmUgU1RNMzJfQURDX1RJTUVPVVRfVVMJCTEw
MDAwMAo+ICAgCj4gICBzdHJ1Y3Qgc3RtMzJfYWRjX2NmZyB7Cj4gKwljb25zdCBzdHJ1Y3Qgc3Rt
MzJfYWRjX3JlZ3NwZWMJKnJlZ3M7CgptaW5vciByZXBsYWNlIHRhYiBieSBzcGFjZSBiZWZvcmUg
IipyZWdzIgoKYW5kIGl0IGlzIHN0cmFuZ2UgdG8gdXNlICJzdHJ1Y3Qgc3RtMzJfYWRjX3JlZ3Nw
ZWMiIGJlZm9yZSB0byBkZWZpbmUgaXQKdGhhdCBjYW4gY2F1c2Ugc29tZSB3YXJuaW5nIHdpdGgg
Y29tcGlsZXIgPwoKPiAgIAl1bnNpZ25lZCBpbnQgbWF4X2NoYW5uZWxzOwo+ICAgCXVuc2lnbmVk
IGludCBudW1fYml0czsKPiAgIAlib29sIGhhc192cmVncmVhZHk7Cj4gKwlib29sIGhhc19ib29z
dG1vZGU7Cj4gKwlib29sIGhhc19saW5lYXJjYWw7Cj4gKwlib29sIGhhc19wcmVzZWw7Cj4gICB9
Owo+ICAgCj4gICBzdHJ1Y3Qgc3RtMzJfYWRjIHsKPiBAQCAtNjcsMTEgKzg2LDMwIEBAIHN0cnVj
dCBzdG0zMl9hZGMgewo+ICAgCWNvbnN0IHN0cnVjdCBzdG0zMl9hZGNfY2ZnICpjZmc7Cj4gICB9
Owo+ICAgCj4gK3N0cnVjdCBzdG0zMl9hZGNfcmVncyB7Cj4gKwlpbnQgcmVnOwo+ICsJaW50IG1h
c2s7Cj4gKwlpbnQgc2hpZnQ7Cj4gK307Cj4gKwo+ICtzdHJ1Y3Qgc3RtMzJfYWRjX3JlZ3NwZWMg
ewo+ICsJY29uc3Qgc3RydWN0IHN0bTMyX2FkY19yZWdzIGRpZnNlbDsKPiArfTsKPiArCj4gK3N0
YXRpYyBjb25zdCBzdHJ1Y3Qgc3RtMzJfYWRjX3JlZ3NwZWMgc3RtMzJoN19hZGNfcmVnc3BlYyA9
IHsKPiArCS5kaWZzZWwgPSB7IFNUTTMySDdfQURDX0RJRlNFTCwgU1RNMzJIN19ESUZTRUxfTUFT
SyB9LAo+ICt9Owo+ICsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBzdG0zMl9hZGNfcmVnc3BlYyBz
dG0zMm1wMTNfYWRjX3JlZ3NwZWMgPSB7Cj4gKwkuZGlmc2VsID0geyBTVE0zMk1QMTNfQURDX0RJ
RlNFTCwgU1RNMzJNUDEzX0RJRlNFTF9NQVNLIH0sCj4gK307CgptaW5vciBhbGwgdGhpcyBibG9j
ayBjYW4gbW92ZSBiZWZvcmUgInN0cnVjdCBzdG0zMl9hZGNfY2ZnIiAod2hlbiB1c2VkKQoKCj4g
ICBzdGF0aWMgdm9pZCBzdG0zMl9hZGNfZW50ZXJfcHdyX2Rvd24oc3RydWN0IHVkZXZpY2UgKmRl
dikKPiAgIHsKPiAgIAlzdHJ1Y3Qgc3RtMzJfYWRjICphZGMgPSBkZXZfZ2V0X3ByaXYoZGV2KTsK
PiAgIAo+IC0JY2xyYml0c19sZTMyKGFkYy0+cmVncyArIFNUTTMySDdfQURDX0NSLCBTVE0zMkg3
X0JPT1NUKTsKPiArCWlmIChhZGMtPmNmZy0+aGFzX2Jvb3N0bW9kZSkKPiArCQljbHJiaXRzX2xl
MzIoYWRjLT5yZWdzICsgU1RNMzJIN19BRENfQ1IsIFNUTTMySDdfQk9PU1QpOwo+ICsKPiAgIAkv
KiBTZXR0aW5nIERFRVBQV0QgZGlzYWJsZXMgQURDIHZyZWcgYW5kIGNsZWFycyBBRFZSRUdFTiAq
Lwo+ICAgCXNldGJpdHNfbGUzMihhZGMtPnJlZ3MgKyBTVE0zMkg3X0FEQ19DUiwgU1RNMzJIN19E
RUVQUFdEKTsKPiAgIH0KPiBAQCAtOTAsOCArMTI4LDcgQEAgc3RhdGljIGludCBzdG0zMl9hZGNf
ZXhpdF9wd3JfZG93bihzdHJ1Y3QgdWRldmljZSAqZGV2KQo+ICAgCS8qIEV4aXQgZGVlcCBwb3dl
ciBkb3duLCB0aGVuIGVuYWJsZSBBREMgdm9sdGFnZSByZWd1bGF0b3IgKi8KPiAgIAljbHJiaXRz
X2xlMzIoYWRjLT5yZWdzICsgU1RNMzJIN19BRENfQ1IsIFNUTTMySDdfREVFUFBXRCk7Cj4gICAJ
c2V0Yml0c19sZTMyKGFkYy0+cmVncyArIFNUTTMySDdfQURDX0NSLCBTVE0zMkg3X0FEVlJFR0VO
KTsKPiAtCj4gLQlpZiAoY29tbW9uLT5yYXRlID4gU1RNMzJIN19CT09TVF9DTEtSQVRFKQo+ICsJ
aWYgKGFkYy0+Y2ZnLT5oYXNfYm9vc3Rtb2RlICYmIGNvbW1vbi0+cmF0ZSA+IFNUTTMySDdfQk9P
U1RfQ0xLUkFURSkKPiAgIAkJc2V0Yml0c19sZTMyKGFkYy0+cmVncyArIFNUTTMySDdfQURDX0NS
LCBTVE0zMkg3X0JPT1NUKTsKPiAgIAo+ICAgCS8qIFdhaXQgZm9yIHN0YXJ0dXAgdGltZSAqLwo+
IEBAIC0xMzQsNyArMTcxLDcgQEAgc3RhdGljIGludCBzdG0zMl9hZGNfc3RhcnRfY2hhbm5lbChz
dHJ1Y3QgdWRldmljZSAqZGV2LCBpbnQgY2hhbm5lbCkKPiAgIAkJcmV0dXJuIHJldDsKPiAgIAo+
ICAgCS8qIE9ubHkgdXNlIHNpbmdsZSBlbmRlZCBjaGFubmVscyAqLwo+IC0Jd3JpdGVsKDAsIGFk
Yy0+cmVncyArIFNUTTMySDdfQURDX0RJRlNFTCk7Cj4gKwljbHJiaXRzX2xlMzIoYWRjLT5yZWdz
ICsgYWRjLT5jZmctPnJlZ3MtPmRpZnNlbC5yZWcsIGFkYy0+Y2ZnLT5yZWdzLT5kaWZzZWwubWFz
ayk7Cj4gICAKPiAgIAkvKiBFbmFibGUgQURDLCBQb2xsIGZvciBBRFJEWSB0byBiZSBzZXQgKGFm
dGVyIGFkYyBzdGFydHVwIHRpbWUpICovCj4gICAJc2V0Yml0c19sZTMyKGFkYy0+cmVncyArIFNU
TTMySDdfQURDX0NSLCBTVE0zMkg3X0FERU4pOwo+IEBAIC0xNDcsNyArMTg0LDggQEAgc3RhdGlj
IGludCBzdG0zMl9hZGNfc3RhcnRfY2hhbm5lbChzdHJ1Y3QgdWRldmljZSAqZGV2LCBpbnQgY2hh
bm5lbCkKPiAgIAl9Cj4gICAKPiAgIAkvKiBQcmVzZWxlY3QgY2hhbm5lbHMgKi8KPiAtCXdyaXRl
bCh1Y19wZGF0YS0+Y2hhbm5lbF9tYXNrLCBhZGMtPnJlZ3MgKyBTVE0zMkg3X0FEQ19QQ1NFTCk7
Cj4gKwlpZiAoYWRjLT5jZmctPmhhc19wcmVzZWwpCj4gKwkJd3JpdGVsKHVjX3BkYXRhLT5jaGFu
bmVsX21hc2ssIGFkYy0+cmVncyArIFNUTTMySDdfQURDX1BDU0VMKTsKPiAgIAo+ICAgCS8qIFNl
dCBzYW1wbGluZyB0aW1lIHRvIG1heCB2YWx1ZSBieSBkZWZhdWx0ICovCj4gICAJd3JpdGVsKDB4
ZmZmZmZmZmYsIGFkYy0+cmVncyArIFNUTTMySDdfQURDX1NNUFIxKTsKPiBAQCAtMTU2LDkgKzE5
NCwxMSBAQCBzdGF0aWMgaW50IHN0bTMyX2FkY19zdGFydF9jaGFubmVsKHN0cnVjdCB1ZGV2aWNl
ICpkZXYsIGludCBjaGFubmVsKQo+ICAgCS8qIFByb2dyYW0gcmVndWxhciBzZXF1ZW5jZTogY2hh
biBpbiBTUTEgJiBsZW4gPSAwIGZvciBvbmUgY2hhbm5lbCAqLwo+ICAgCXdyaXRlbChjaGFubmVs
IDw8IFNUTTMySDdfU1ExX1NISUZULCBhZGMtPnJlZ3MgKyBTVE0zMkg3X0FEQ19TUVIxKTsKPiAg
IAo+IC0JLyogVHJpZ2dlciBkZXRlY3Rpb24gZGlzYWJsZWQgKGNvbnZlcnNpb24gY2FuIGJlIGxh
dW5jaGVkIGluIFNXKSAqLwo+IC0JY2xyYml0c19sZTMyKGFkYy0+cmVncyArIFNUTTMySDdfQURD
X0NGR1IsIFNUTTMySDdfRVhURU4gfAo+IC0JCSAgICAgU1RNMzJIN19ETU5HVCk7Cj4gKwkvKgo+
ICsJICogVHJpZ2dlciBkZXRlY3Rpb24gZGlzYWJsZWQgKGNvbnZlcnNpb24gY2FuIGJlIGxhdW5j
aGVkIGluIFNXKQo+ICsJICogU1RNMzJIN19ETU5HVCBpcyBlcXVpdmFsZW50IHRvIFNUTTMyTVAx
M19ETUFFTiAmIFNUTTMyTVAxM19ETUFDRkcKPiArCSAqLwo+ICsJY2xyYml0c19sZTMyKGFkYy0+
cmVncyArIFNUTTMySDdfQURDX0NGR1IsIFNUTTMySDdfRVhURU4gfCBTVE0zMkg3X0RNTkdUKTsK
PiAgIAlhZGMtPmFjdGl2ZV9jaGFubmVsID0gY2hhbm5lbDsKPiAgIAo+ICAgCXJldHVybiAwOwo+
IEBAIC0yMDYsNyArMjQ2LDcgQEAgc3RhdGljIGludCBzdG0zMl9hZGNfc2VsZmNhbGliKHN0cnVj
dCB1ZGV2aWNlICpkZXYpCj4gICB7Cj4gICAJc3RydWN0IHN0bTMyX2FkYyAqYWRjID0gZGV2X2dl
dF9wcml2KGRldik7Cj4gICAJaW50IHJldDsKPiAtCXUzMiB2YWw7Cj4gKwl1MzIgdmFsLCBtYXNr
Owo+ICAgCj4gICAJLyoKPiAgIAkgKiBTZWxlY3QgY2FsaWJyYXRpb24gbW9kZToKPiBAQCAtMjMx
LDcgKzI3MSwxMCBAQCBzdGF0aWMgaW50IHN0bTMyX2FkY19zZWxmY2FsaWIoc3RydWN0IHVkZXZp
Y2UgKmRldikKPiAgIAkgKiAtIExpbmVhcml0eSBjYWxpYnJhdGlvbiAobmVlZHMgdG8gYmUgZG9u
ZSBvbmx5IG9uY2UgZm9yIHNpbmdsZS9kaWZmKQo+ICAgCSAqICAgd2lsbCBydW4gc2ltdWx0YW5l
b3VzbHkgd2l0aCBvZmZzZXQgY2FsaWJyYXRpb24uCj4gICAJICovCj4gLQlzZXRiaXRzX2xlMzIo
YWRjLT5yZWdzICsgU1RNMzJIN19BRENfQ1IsIFNUTTMySDdfQURDQUxESUYgfCBTVE0zMkg3X0FE
Q0FMTElOKTsKPiArCW1hc2sgPSBTVE0zMkg3X0FEQ0FMRElGOwo+ICsJaWYgKGFkYy0+Y2ZnLT5o
YXNfbGluZWFyY2FsKQo+ICsJCW1hc2sgfD0gU1RNMzJIN19BRENBTExJTjsKPiArCXNldGJpdHNf
bGUzMihhZGMtPnJlZ3MgKyBTVE0zMkg3X0FEQ19DUiwgbWFzayk7Cj4gICAKPiAgIAkvKiBTdGFy
dCBjYWxpYnJhdGlvbiwgdGhlbiB3YWl0IGZvciBjb21wbGV0aW9uICovCj4gICAJc2V0Yml0c19s
ZTMyKGFkYy0+cmVncyArIFNUTTMySDdfQURDX0NSLCBTVE0zMkg3X0FEQ0FMKTsKPiBAQCAtMzk0
LDE0ICs0MzcsMjggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhZGNfb3BzIHN0bTMyX2FkY19vcHMg
PSB7Cj4gICB9Owo+ICAgCj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IHN0bTMyX2FkY19jZmcgc3Rt
MzJoN19hZGNfY2ZnID0gewo+ICsJLnJlZ3MgPSAmc3RtMzJoN19hZGNfcmVnc3BlYywKPiAgIAku
bnVtX2JpdHMgPSAxNiwKPiAgIAkubWF4X2NoYW5uZWxzID0gU1RNMzJfQURDX0NIX01BWCwKPiAr
CS5oYXNfYm9vc3Rtb2RlID0gdHJ1ZSwKPiArCS5oYXNfbGluZWFyY2FsID0gdHJ1ZSwKPiArCS5o
YXNfcHJlc2VsID0gdHJ1ZSwKPiAgIH07Cj4gICAKPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3Rt
MzJfYWRjX2NmZyBzdG0zMm1wMV9hZGNfY2ZnID0gewo+ICsJLnJlZ3MgPSAmc3RtMzJoN19hZGNf
cmVnc3BlYywKPiAgIAkubnVtX2JpdHMgPSAxNiwKPiAgIAkubWF4X2NoYW5uZWxzID0gU1RNMzJf
QURDX0NIX01BWCwKPiAgIAkuaGFzX3ZyZWdyZWFkeSA9IHRydWUsCj4gKwkuaGFzX2Jvb3N0bW9k
ZSA9IHRydWUsCj4gKwkuaGFzX2xpbmVhcmNhbCA9IHRydWUsCj4gKwkuaGFzX3ByZXNlbCA9IHRy
dWUsCj4gK307Cj4gKwo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHN0bTMyX2FkY19jZmcgc3RtMzJt
cDEzX2FkY19jZmcgPSB7Cj4gKwkucmVncyA9ICZzdG0zMm1wMTNfYWRjX3JlZ3NwZWMsCj4gKwku
bnVtX2JpdHMgPSAxMiwKPiArCS5tYXhfY2hhbm5lbHMgPSBTVE0zMl9BRENfQ0hfTUFYIC0gMSwK
PiAgIH07Cj4gICAKPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdWRldmljZV9pZCBzdG0zMl9hZGNf
aWRzW10gPSB7Cj4gQEAgLTQwOSw2ICs0NjYsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHVkZXZp
Y2VfaWQgc3RtMzJfYWRjX2lkc1tdID0gewo+ICAgCSAgLmRhdGEgPSAodWxvbmcpJnN0bTMyaDdf
YWRjX2NmZyB9LAo+ICAgCXsgLmNvbXBhdGlibGUgPSAic3Qsc3RtMzJtcDEtYWRjIiwKPiAgIAkg
IC5kYXRhID0gKHVsb25nKSZzdG0zMm1wMV9hZGNfY2ZnIH0sCj4gKwl7IC5jb21wYXRpYmxlID0g
InN0LHN0bTMybXAxMy1hZGMiLAo+ICsJICAuZGF0YSA9ICh1bG9uZykmc3RtMzJtcDEzX2FkY19j
ZmcgfSwKPiAgIAl7fQo+ICAgfTsKPiAgIAoKCm9ubHkgbWlub3LCoCByZW1hcmtzCgoKUmV2aWV3
ZWQtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+CgpU
aGFua3MKUGF0cmljawoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
