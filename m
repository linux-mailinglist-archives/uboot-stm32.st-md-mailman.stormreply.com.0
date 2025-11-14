Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E057C5E51F
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:48:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DBAC9C628DC;
	Fri, 14 Nov 2025 16:48:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 217AAC628DB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:48:19 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEGeFrp2741026; Fri, 14 Nov 2025 17:48:08 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com
 (mail-westeuropeazon11011022.outbound.protection.outlook.com [52.101.70.22])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7m3u14-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:48:07 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oUTzT/HDaCYRpsxkwYPFmXAHHSXswnFqQfSegGpH/Y9Fz3uOTULcn8Fq7yoQmcBggg4JsTkteJCiQww+PiR/MJji4p0IEYtcPeAY3402qA1Z1e7D47S+CvDTA/3iG7Qb7u4ZHRhiU5JQFYfarf5bBvBqEhBnKS5XOHNz4wnY5/qOt1RZ68AIbgbuiCAo4mjGOWlGmFtW5RG2QAUhpCeGjC7ulE18Q9WwFmRgcFbT0OHboB7K3U72e6tQpO2YFh2B/hWDqGXY7lMLsMrW+pEBulXrgjfKo2EPytoyCudX0J2xABGQzLH1S8z2uMwEvbtGyH3dhPYDkR8vMSxUQAH0qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDy+2lnoRLUWq46G66ZA+k2BDH14nZ0vy5O1CS3VF3s=;
 b=vi4w8piW6uh1DQPW8pu6pOy8tWF1XSHvAk4Ot60EacdmRmE/AWzT5Ewp1A/6GG2HPIxXjmrcYAKQ7ghhmXBR977ozhpFlgzK9nvhO7mFSHTBvZIOCB4Rx+VoP70OguiTTzDC++KoIEsLzthcDg1y5uaz0edyuT03PPQ/FXAAK4+YjMRFDDLDFzzM4uY5vZa8+L9dDr9sUPFYPJa1VbHBgHvfOGtJ5tX5QWtvq1mCzSMibSKY9dMFHlHGVk9TkHxVS+QmyNT4p4MA4EY+bmBe6DZ1nTi1aMa4c5zBJlUZI5JeudcnajGtnIL1z8XNAkHM/wRnHdIAa1EVna2lRV6YjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDy+2lnoRLUWq46G66ZA+k2BDH14nZ0vy5O1CS3VF3s=;
 b=eOLfikQv2aQzbk+9uG8FJee6HQ2K2IcK64miY+YY1AOFC26rTbLTZRZs3YkUFUJex2gP+CqNlwgyNCjOeaCTUPJrAOH6uwb1lYQnGGXZEqtOEICWd9A8hgcrFaV5Pmvt4gpFHJI7yFN9IpbYYSFbO7XWUZqExhAoms56jfFHet55xQfq+zho40aYrIHqTw9LL5jhg6FRHDPBBay9wKgaBd+MSKkqJuuK8tnHXZEbycd/lJdH1W6/oKvdRsxaVDLpuHM0VWqtTppkS/Nz5O+pTGQPeKM6XLDqLVzvRwoSDmndZs64ZpCAYL7khJ073Hc3Oj+Or2WmSlWjWn7nQ4otnQ==
Received: from DU2PR04CA0352.eurprd04.prod.outlook.com (2603:10a6:10:2b4::23)
 by DU4PR10MB8515.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:564::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Fri, 14 Nov
 2025 16:48:05 +0000
Received: from DU6PEPF00009523.eurprd02.prod.outlook.com
 (2603:10a6:10:2b4:cafe::6c) by DU2PR04CA0352.outlook.office365.com
 (2603:10a6:10:2b4::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 16:48:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF00009523.mail.protection.outlook.com (10.167.8.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:48:05 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:48:15 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:48:03 +0100
Message-ID: <9570d74c-fb69-40c5-9397-6e447b611300@foss.st.com>
Date: Fri, 14 Nov 2025 17:48:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tom Rini <trini@konsulko.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>
References: <20250904-master-v3-0-b42847884974@foss.st.com>
 <20250904-master-v3-1-b42847884974@foss.st.com>
 <CAFLszTiT9iLx6gguhVui2Qh0Ew89yhvpDggKwPo71cB+Rv=xJA@mail.gmail.com>
 <aQavXq6jVagkIa53@thinkstation>
 <CAFLszThdV7cZ-uBXzqRYWv-HsGbNJV9BVKVOC4FQUD1yjZDNkg@mail.gmail.com>
 <20251103141726.GJ6688@bill-the-cat>
 <bcd23bda-23f5-4e65-b09f-93ec4eb60414@foss.st.com>
 <20251104162121.GA6688@bill-the-cat>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20251104162121.GA6688@bill-the-cat>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009523:EE_|DU4PR10MB8515:EE_
X-MS-Office365-Filtering-Correlation-Id: 9632b716-cda1-4c57-91cd-08de239d952a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1lyaFVrWTNtai9ESGRxTW01UEEvL3FiSGx4L29sbmdUWUp0N3R0NnJCYTlO?=
 =?utf-8?B?THdPYm12VnZCditlYkRRSjJCTkY1THU1K2lNNTVWb0tnTHhBeGFURUU0N1VC?=
 =?utf-8?B?alN0dEsxNnF1SVl1Q05iU1U2OG0zZ0g2WVhHeGkwVTFoZkJSdE1wUEZtUFIz?=
 =?utf-8?B?dEpuMFJoakdyME1WeDZ0MzVGZmwrUEIwWkZLVVZmM2ZlV1JLVDdTK3Zmb3Iw?=
 =?utf-8?B?SkFITnI2UWVzZUFvTEZmOWRsc1dNb1o0WG4vVVRaZmFQNVN1akJKK0JOcVdt?=
 =?utf-8?B?SHFDUHduaGU5K3k5UVlEeTVxQllta1ZrUVA4YmMyRElyMDRYeFI2Vjh2N05C?=
 =?utf-8?B?eCtDdnlWUStzckZUYmFZaEw5VjFkZUR1eDNxMjNGa1pvbmZrTjdEUUdjVjVD?=
 =?utf-8?B?ZlhDSEgzZnM0c0J4TkpOM1dSUnZLeThCYWdkeWtHN1hMUGs5VWR3T0duZEJS?=
 =?utf-8?B?V0p1eHd5UlRUU2djcmd5TEhHNFlNOXltUkYzTFJ4Y1JWZi9leEhNejc1S29o?=
 =?utf-8?B?d3k5eW1aR2lBdENDQnVVUGVSYncyUk5vOC9jSWF3aExNdU4rS0c1aU5OSWt1?=
 =?utf-8?B?WW5YM3FHS1NyS0NQKzkrTVFkbWVaZEF2cFI3UjJFQTc5YVVvMHJkMnBRMXU4?=
 =?utf-8?B?WHgveHJRUi9IU3BJQWdSNHZCUEl2ZVpESkdpTGd2ZVdqaGp2bUtlOGpBUUlS?=
 =?utf-8?B?V3d2eHdibG9IL2Q0OGJvSlVCcEdXc0l3eWJ0dGUvUjgvbEJwSElTcW5GSFg1?=
 =?utf-8?B?L3g1REhYemtXVGxmMURXQzl6dGxQZE5wL0ZZU1dQUlZBS1BweWpuYm92OGdP?=
 =?utf-8?B?NHVNcFVyR2ZiZUNqK1h0TmY5elllSmprTjlXQUdsMHRCRmtVRXJIaFMvdmk3?=
 =?utf-8?B?cS9waDZ0ZFRVQUl1c1ZGckpWVjRVWWZlQnJKY21LNVhrNXJOZGh6S1RuMlNw?=
 =?utf-8?B?NXlYbWh6VG9aSWVSajh0VlMyRUYrOVp0RWJHSTRCdCt6VW85MGErVmxiN2Nr?=
 =?utf-8?B?OThFUzJoNkRlTjJ3WEJ0S1IzdXlVdlBVVGxzM1lGYndaUmVqNHA3ZjJUaGxO?=
 =?utf-8?B?RFJWTEphU3NJTDhLYmpnOHd6S1A0VWF1WmVORnVhYWtoN1dBS2tEWHl6NHI1?=
 =?utf-8?B?Z3I4djBZbldaQjRVOTV2cG1vejZKYjB3ZkQ5UFEzOEQxcFA5cnVkOGdhN2hX?=
 =?utf-8?B?dTkyM01OVVVGVVJmZ2lMVHYwK3cxVVdBZWk1OEgwM2lIUFJsSHZwOERHay9t?=
 =?utf-8?B?SFUrZllGYlhadDJYNlg3eFZQeTdlYUVXMGY5UWFIV3dHZ0tYV1c0K00weUVa?=
 =?utf-8?B?WElxL3hRdHp3OWg4T3lZSENON2VVY0dGcVFrZ2tVdGtkb2ZrT1pjQmJiOGZr?=
 =?utf-8?B?TlJEWXlWTFhNOVgrVzdsaEI2c2FXVWpFcFJIa3VWbkw2VWRtczdwTlRqeExQ?=
 =?utf-8?B?K2hCUWJSVHZTT2U3UWxzSHdjWHQ5ZDl6VkFzenkyZ2dZbW95TTRyeE9xa09B?=
 =?utf-8?B?ZEVrdTNRbjJHWjYyMmUzei84TE5MNHZCMUp4WktlaFB4OWJZSThycWMxNFhC?=
 =?utf-8?B?ZWZxZ1NkekZIYlgxN082OGplYWIwM1plWHFMdkZMNlRZNVNCck9mdHE2Q1Zi?=
 =?utf-8?B?akJwbHRxbVBJNjRJd3FtTW5ZdFU1Umt5SmZ2ZDVydmZndHNPeGxiblQ3L1hY?=
 =?utf-8?B?c0EzM2UzZWc3ZlNtUlpta2VOMXlKRzdYNzlNWUNOek1KSUxwdWtISGN3RHpG?=
 =?utf-8?B?Q000ODZBNWpnRVhydHRJSHdUY2RUU0JGZ1JHZ2g1cjBCOTJEdVEwY2FwclEw?=
 =?utf-8?B?dHdMNUtXSjQ0L29TaWtUeW1ZNmpvMkdwNWh5THhmTXFaazNKZnkzZTBUaW9L?=
 =?utf-8?B?NllUNklBeG1yUG8rTG5RVmxuS1R3aURlVFlwTGRnWlhpS2E4L2dWQ1pTQjd0?=
 =?utf-8?B?SUcyMXBlYkdJSjgxNkhmUzI4K0ViN2s3ZHJyVjdzQkRVTjV4dm5qOXFhaUFw?=
 =?utf-8?B?bFozWUs1UzlpSGRrWEhRbUJ2NkFJYjltZkxCVzBKeUFpc012WXVNaGkvaHBX?=
 =?utf-8?B?b1hPZFh6bkRVNUMyWjlILzdVOVNRdG5aUnBhT1lwOXFoSEM3YlR3dzM2V0x0?=
 =?utf-8?Q?Ncak=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:48:05.1437 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9632b716-cda1-4c57-91cd-08de239d952a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009523.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8515
X-Authority-Analysis: v=2.4 cv=AZK83nXG c=1 sm=1 tr=0 ts=69175d47 cx=c_pps
 a=7rn1xTFtsdhHQW4qAtAsrg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=XpE1AkgCAAAA:8 a=pGLkceISAAAA:8 a=8b9GpE9nAAAA:8
 a=YnVFTrKuVVD4eWs0eIwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cF5W-B9r96wA:10 a=dpZMgbseYPk84XhQl7oQ:22 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: oxCaM5UuV--5sxm0TGpytg1djDNMdO_f
X-Proofpoint-GUID: oxCaM5UuV--5sxm0TGpytg1djDNMdO_f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzNSBTYWx0ZWRfX6VX1ryQPt1qV
 kmE4wYIyZhT5CSAqLZGhGD+a+m8n+58MPKKUSxAJQk0LbZ5izKvs+J3nHeV9H0Ln0gUXgQIY7gK
 r9okzegrCVQj4iRyaqOx9iFfqePZtG/kWJvsbuBPS/6UwJkf7Db50J1jSnUss8DWwPPyeOsbD7L
 MvmbuL5SumUtgExz4m7LKj0dN831fWCfooa6k8uVung6iM7zgXBWUxuPYOcpt93R2mpCtbiLmFL
 ZrkJZOjKKRJ6nNiDQF0H2XBSF2kD7hKSdsAAm3+mvrglRCa6D642NYUHg2y6MmSl5NvHXDUg+/N
 9+fYpa+LgPUFSbWfPSaiWkTQoYpN2DYlBJ+BVZIwqLYOczFwAp8mrQoetftJ5qG5Bc6uEezr8Gu
 YKq9TXOcrhgRpV8YgBpw7wKA3/Wyrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1011
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140135
Cc: Simon Glass <sjg@chromium.org>, Anatolij Gustschin <ag.dev.uboot@gmail.com>,
 Kamil Lulko <kamil.lulko@gmail.com>, U-Boot
 Mailing List <u-boot@lists.denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sumit Garg <sumit.garg@kernel.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Dillon Min <dillon.minfei@gmail.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v3 1/7] ofnode: support panel-timings in
 ofnode_decode_display_timing
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

CgpPbiAxMS80LzI1IDE3OjIxLCBUb20gUmluaSB3cm90ZToKPiBPbiBUdWUsIE5vdiAwNCwgMjAy
NSBhdCAwMzowMTozMVBNICswMTAwLCBSYXBoYWVsIEdhbGxhaXMtUG91IHdyb3RlOgo+Pgo+Pgo+
PiBPbiAxMS8zLzI1IDE1OjE3LCBUb20gUmluaSB3cm90ZToKPj4+IE9uIFN1biwgTm92IDAyLCAy
MDI1IGF0IDA4OjUzOjQzUE0gKzAxMDAsIFNpbW9uIEdsYXNzIHdyb3RlOgo+Pj4+IEhpIFJhcGhh
ZWwsCj4+Pj4KPj4+PiBPbiBTdW4sIDIgTm92IDIwMjUgYXQgMDI6MTAsIFJhcGhhw6tsIEdhbGxh
aXMtUG91IDxyZ2FsbGFpc3BvdUBnbWFpbC5jb20+Cj4+Pj4gd3JvdGU6Cj4+Pj4+IExlIFNhdCwg
Tm92IDAxLCAyMDI1IGF0IDEwOjAzOjU5QU0gKzAxMDAsIFNpbW9uIEdsYXNzIGEgw6ljcml0IDoK
Pj4+Pj4+IEhpIFJhcGhhZWwsCj4+Pj4+Pgo+Pj4+Pj4gT24gVGh1LCA0IFNlcHQgMjAyNSBhdCAx
NDo1MywgUmFwaGFlbCBHYWxsYWlzLVBvdQo+Pj4+Pj4gPHJhcGhhZWwuZ2FsbGFpcy1wb3VAZm9z
cy5zdC5jb20+IHdyb3RlOgo+PiAuLi4KPj4+Pj4+IFBsZWFzZSBhZGQgYSB0ZXN0IGZvciB0aGlz
IGluIHRlc3QvZG0vb2Zub2RlLmMKPj4+Pj4gSGkgU2ltb24sCj4+Pj4+Cj4+Pj4+IEknbGwgZ2xh
ZGx5IGRvIHRoYXQsIGJ1dCBJIGhhdmVuJ3Qgd3JpdGUgYW5kIHVzZSBhbnkgdGVzdCBpbiBVLUJv
b3QuICBTbwo+Pj4+PiBpdCBpcyBhIGJpdCBmb2dneSBob3cgdG8gaW1wbGVtZW50IGl0Lgo+Pj4+
IFRoZXJlIGlzIHNvbWUgaW5mbyBoZXJlOgo+Pj4+Cj4+Pj4gaHR0cHM6Ly9kb2NzLnUtYm9vdC5v
cmcvZW4vbGF0ZXN0L2RldmVsb3AvdGVzdGluZy5odG1sCj4+Pj4KPj4+Pj4gRG8gd2Ugd2FudCB0
byBjcmVhdGUgYSBmYWtlIGRldmljZS10cmVlIGFuZCB0ZXN0IGVhY2ggY29uZmlndXJhdGlvbiBv
cgo+Pj4+PiBkbyB3ZSB3YW50IHRvIHRlc3QgaW4gdGhlIF9jdXJyZW50XyBkZXZpY2UtdHJlZSBp
ZiB0aW1pbmdzIGFyZSBjb3JyZWN0bHkKPj4+Pj4gc2V0IGFjY29yZGluZyB0byB0aGUgaW5kZXgg
dmFsdWUgPwo+Pj4+IEl0IGxvb2tzIGxpa2UgdGhlcmUgaXMgYSAnZGlzcGxheS10aW1pbmdzJyBu
b2RlIGluIHRlc3QuZHRzLCB3aXRoIHRocmVlCj4+Pj4gc3Vibm9kZXMsIHNvIHlvdSBzaG91bGQg
anVzdCBiZSBhYmxlIHRvIGdldCBhbiBvZm5vZGUgZm9yIHRoYXQgYW5kIHRoZW4KPj4+PiByZWFk
IG91dCBvbmUgb2YgdGhlbSBhbmQgY2hlY2sgaXQuCj4+PiBPSywgYnV0IHdoYXQgaXMgdGhlIHV0
aWxpdHkgaW4gZG9pbmcgdGhhdD8gV2UgZG9uJ3QsIGFuZCBhcmVuJ3QsIGdvaW5nCj4+PiB0byBo
YXZlIHRlc3RzIGZvciBldmVyeSB2YWxpZCBwb3NzaWJsZSBEVCBub2RlLCBhbmQgdGhpcyBpc24n
dAo+Pj4gaW50cm9kdWNpbmcgbmV3IGxpYnJhcnkgcGFyc2luZyBmdW5jdGlvbmFsaXR5ICh0aGUg
bW9zdCByZWNlbnQgcGF0Y2ggdG8KPj4+IHRlc3QvZG0vb2Zub2RlLmMgd2FzIGZvciBvZm5vZGVf
Z3JhcGggYW5kIHRoYXQgaXMgaW1wb3J0YW50IHRvIHRlc3QpLiBXZQo+Pj4gZG9uJ3QgaGF2ZSBk
aXNwbGF5LXRpbWluZyB0ZXN0cyB0byBzdGFydCB3aXRoLCBzbyB3ZSdyZSBmaW5lIG5vdCBhZGRp
bmcKPj4+IHNvbWV0aGluZyBtb3JlIGhlcmUuCj4+Pgo+Pgo+PiAoQWRkaW5nIGJhY2sgUGF0cmlj
ZSwgd2hvbSBoYWQgYmVlbiByZW1vdmVkIGZyb20gQ0MuKQo+Pgo+PiBHb3QgaXQsIHNvIG5vdGhp
bmcgdG8gZG8gb24gbXkgc2lkZS4KPiAKPiBGb3IgdGhpcyBzcGVjaWZpYyBwYXJ0IG9mIHRoZSBz
ZXJpZXMsIHllcywgdGhpcyBzZWVtcyBmaW5lLgo+IApBcHBsaWVkIHRvIHUtYm9vdC1zdG0zMi9t
YXN0ZXIKClRoYW5rcwpQYXRyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
