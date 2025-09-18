Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C673FB851E2
	for <lists+uboot-stm32@lfdr.de>; Thu, 18 Sep 2025 16:16:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB15AC349C6;
	Thu, 18 Sep 2025 14:16:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1AEAC36B13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Sep 2025 14:16:00 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IEEtvK003374;
 Thu, 18 Sep 2025 16:15:26 +0200
Received: from duzpr83cu001.outbound.protection.outlook.com
 (mail-northeuropeazon11012003.outbound.protection.outlook.com [52.101.66.3])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 497fxh15rn-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Sep 2025 16:15:26 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=URlwwPRPfcDK3jTYS/8TX8ySL7VkzUXq1tXO+VGW81RW0t4DJZTXMXgj9Hdmz7waDRTzdMrMTjR9GkFei4D9vrFgrPdmozIDlK1NPkSKZ2JoUP+pl4nF7yAAsgpraTmD1FE5UhFV/3A5yezd+WoVBs8deZCC5yXkG83/ebBcxuuXvJb/LYnh3DDpZpuZ6aAOVyHNs6hHs480p+zDkfErXCYFPG4MG7LTGAUxefkUYFpsjGXf+0oTl4blBAcDS/YCtZzSfntQtxJtCoYCzhf946Q9+mgQggINOpuMXWDAdcRo4ki4O0sWThUefIaAoBUpzXrOtl0M+ce0Ysc6SYCMSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDYxLMjJKc8XLPRTKyCjPCznsm3TCfF5Au1THpX5c9o=;
 b=YtdYbE8NtWQ/GC/kUrIAfSShSIBLdqmV+s0eR7xIjm5r+63jQ9kz3rcG8ys7UlKRRq4wkUQLLFG7V9P22CHyd93idDZVA+7t8vn9s9hQNSQ++mztGQask0KCxtEOCuJP/JdZe9PXAHVCe326+d6BWWl8czJ7xgipgH/J9oWG9L4gsGwy5ekH8jHQUXUIpwWfkbRdkZF+tSfs/CyrXHWhjnbxqitp8CB5ln8CiLl9SGB7gI/RiAWjl8YcElLtyJdHAx6uuoB5a3mexMzhT0C6MfohwdfXWAoVYbdnsBIcD3PxSP8av96FTjJ6dQ4JovkEy5g+lAEnCiHtbyCS3fUkug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=cherry.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDYxLMjJKc8XLPRTKyCjPCznsm3TCfF5Au1THpX5c9o=;
 b=HmXyoAUkGWMAGqnfZ1xtkLLl0Wnt6Xn4PQKrd1mUoQe9BWMDvOJslTm33fflsWuI8Oq6C5QK2ehGf9AEXdeGcDPehbuNWnZwARcrWlGirdO4mYhyXLDVNwM4RX8JJfTnnhVnp+3ETR8EuiviS7YAQUymt+w/E+nG5mluzmeW5Xp28KsZyDXd7zUD834fvYWoalO3tJESYDbKI6j497LPvNiffN1ZrMzi+iMiXxJ83/F3fUEXo0KvDqj5u3OL61EqOQD0bhzdOs6QTx3g1ciEcYF7UVglYk7gMEyvlBH2pOO6zNaLObBJlT3epKhrace7s75lp2rk/HXugSQIW839YA==
Received: from DUZPR01CA0170.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::28) by DU0PR10MB7191.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:44d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 14:15:23 +0000
Received: from DU2PEPF00028D0D.eurprd03.prod.outlook.com
 (2603:10a6:10:4b3:cafe::1a) by DUZPR01CA0170.outlook.office365.com
 (2603:10a6:10:4b3::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.14 via Frontend Transport; Thu,
 18 Sep 2025 14:15:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DU2PEPF00028D0D.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Thu, 18 Sep 2025 14:15:23 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 18 Sep
 2025 16:08:19 +0200
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 18 Sep
 2025 16:15:22 +0200
Message-ID: <c88d6c98-b8de-425a-abda-be544909297a@foss.st.com>
Date: Thu, 18 Sep 2025 16:15:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Quentin Schulz <quentin.schulz@cherry.de>, Kory Maincent
 <kory.maincent@bootlin.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20250917141736.59732-1-kory.maincent@bootlin.com>
 <a74df246-2e53-4c73-b545-58ca832f7d83@cherry.de>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <a74df246-2e53-4c73-b545-58ca832f7d83@cherry.de>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0D:EE_|DU0PR10MB7191:EE_
X-MS-Office365-Filtering-Correlation-Id: 593cb44c-b8d5-418f-b1af-08ddf6bdcea6
X-LD-Processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WVhaTjhLUkFTVHB4aU84cnRTTWlkNUphVGlybjhVN1BBZEFMUFpaQVBBSkFT?=
 =?utf-8?B?MDBZOFJndHUySUNOdFVpWnpyMHJjMEhYbEt4YVZGR2h5S1doQlM5WGtaNVJy?=
 =?utf-8?B?MVRQN1orMHJIMS95czQzS0R5TkV4dXJSUWp2QW9hV2c4NWttZ21vQ0tmb013?=
 =?utf-8?B?Vm1lenhOZGs5ZnRVdVBHb2xJQ3NqMVZubEw5cVV3TThHclQ2dm5zZWpIZUF2?=
 =?utf-8?B?clk2WmRkWVA1RFl2ZzlVSi80WFY1VFA0SnZrMWNreWxXZGZDRGwwQmlBUnpN?=
 =?utf-8?B?dHBLOHNvNG5wWUVyNHVDcEIyQ3JiVUQ2SXBLalFLcnRkREg4a2E1Uk9aOHJV?=
 =?utf-8?B?MGswUmRETnB1aWZiN1A5N1dEUnFySUJGT1lCMkVnY0ozRUhxV2ROOGsyZ0ND?=
 =?utf-8?B?YkhEbzJDNmFqK3dqUUU0dk5QbFFpL2tNaTRMZm43eWRQeS8xNE9QWVh6bXNP?=
 =?utf-8?B?R3N2THBXNGc5VEFaYVdiSStsMEJ3SktUYzRhVnNFLzJNQWpWNnljQ3RJQmt0?=
 =?utf-8?B?blFUWWtTOXNyTnFRRVFyYW5hWnFpWThMWkZiUi9hS0VPa2dzcHVjK1hnY2lQ?=
 =?utf-8?B?SkZvclMwTlRuM3FKa0xOKy9qc2xNMXd6am1RdzhoRXp1MU16TXRhZEljRUZr?=
 =?utf-8?B?RTlISk9OaXo1b2pyYUNWLzlNdnhTRFpPZWc1c2lWQ29XSWRlZlhseEg3ZUFs?=
 =?utf-8?B?dm9nelBmQ3NnZGVRUFRSbXNLMHJ3TzRZTWNQQWhPR0p4OFl3Y3lQNFU2dVU1?=
 =?utf-8?B?dnNKV3NReDJMUUNMR0d1bThjZXFHcHJFc2tSNHM5bkZiMEF5MUczMDIvSmh4?=
 =?utf-8?B?cHZMZW5oUnp2NGlBNUUyWDd5U3dodU1mc3E2a0V5Ykdhbkhpbm5sMW1xVndL?=
 =?utf-8?B?VmtkaHNGVTQ1WE1OZFZvUnQ1MDIzOUxqTnZFSUkrR1JGVWNTZ0k3a2JWbGk5?=
 =?utf-8?B?dFpsaXBaOXhMQy9NTnNIWEg0NXdXWUFDRUdIMTFXNzBoT0ZvYVpFTGZPaysx?=
 =?utf-8?B?alNqc3ZTVkFWK2t1QnVWM0loK05zOTVkOCtHYWsrVTQ0RW9ucVRoMzY2RU9T?=
 =?utf-8?B?emRTUFY1eTJiUmwzbzJHdURFZkZhRDFVNkFHOU03Y2tSM3pPL3dsbEQ2bEhq?=
 =?utf-8?B?WEJQUVRnK01YZkNiWXorSlFvWmRZZmxpemRla3B4OEZsTGEwWFRZVzJjK3k1?=
 =?utf-8?B?d2p3WE9DVUtmcHVDUXZ3SXQrUFFBSDdDTElBWFJmWjRCS3gvMFYxM3dwMUlG?=
 =?utf-8?B?SkVqdXFDaUVwMmRCcVFVd3d6WmlENCtoaTNWMzBpeUlWc0doMkQ3NmQ4MDFq?=
 =?utf-8?B?enBXZmw4STFOMTRDL0N6SzlWNmNabFU2SjJIbkxIdmJsQnFjWG42dGhsY25Z?=
 =?utf-8?B?dlJHanhvcE1rTUtYd2tsQWxIenhneW5xMDFEYTdLcUY5dEEvMUovbjF5L3hI?=
 =?utf-8?B?bXpqUXcrVFJlOWhpRExpUExFNU1iODV5K3E0WGhIc2cwVWtPOURxWGRlMStk?=
 =?utf-8?B?c3lIUENGdlk0TE9TTWcxY0g2VzBMa2VWUlh1TkNoQlk2MkNMUlFpVUNqRjR1?=
 =?utf-8?B?MEFsbTEwaWI5aFVQMWpocVVNdDVpenJoRlFlTXlWSlQxcG1CZnpXVzQ1eVFE?=
 =?utf-8?B?N29CK2xVQ1RCUnUySG91VEUyaWU1N216T0dBTWxRMERhTHRuQWwvZ3hGYTd0?=
 =?utf-8?B?c1JQQ25DcnkycE1Ub3A0aTVjSmdrbFZjamp1ODVyMzZOWDN6R010WnpwOVVC?=
 =?utf-8?B?NlhPaHJQdWxmZzFkNGdRVGRHYmgrSGY3L3VmT0UyeEFnZXpZWG1UVVREaW1S?=
 =?utf-8?B?V2U4K1p0U0x6dGc2OVBYaEpoT1owQ3BjV3ZUcTFwY0tERGl1bC9GbFhVbFV2?=
 =?utf-8?B?RTFXQlNhbEhaY1o1azJSTU02QzVqWWl5TDMvQ2hZaTNxRnUxTUtLNk5BQ2Nu?=
 =?utf-8?B?Y0owV2lJN3oyVFdHRGZ6RVNVdHVkTHZCczY4ck9tNUF5M2hYT2g4REVvNkxz?=
 =?utf-8?B?SGxOWlhDU093PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 14:15:23.1487 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 593cb44c-b8d5-418f-b1af-08ddf6bdcea6
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7191
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX1KD8WgwpIai/
 m8MNi8Y1fwKsfgB/iwKEhtVPncwnegSLowTV8GyvVNiVrYyCh7NYJyGV6Hm+TNrV+ph1cFF830a
 oTGT0VZeUxdrckN8Usm7Q7PjC93mfpjEgqEYe8Mt2yJbv971w0h8R2o6hQHx6EXx+UhmUFV93cC
 QX5I6+YAuTQgP9LXM9AcgBw5+ZgO5qdh5ldVBfDNPVzCsOcbPWT/ZsQ6TAB4I5kn3z4HMD/10Ms
 EPtwH2JZgC2gve3DUNDYXwYPOJ271tgSi3Nc/WjIH8sahvFtUDqV+aNFw4CdjW1grqEMjx/yZUd
 0tOzj3VcX79kosYgFvTwvYpv4b4+LW/gDttgUgvXOkRQthEqTKR2woVHXy2SqAQ3JgxdWoIOyZ/
 plP1Jwmx
X-Proofpoint-ORIG-GUID: nqo8sHJp0CIqRgXCpDGqTVal8zYHOhfi
X-Authority-Analysis: v=2.4 cv=aJLwqa9m c=1 sm=1 tr=0 ts=68cc13fe cx=c_pps
 a=9FtXM1IveBDD2FvWd4766A==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=SAHXIHsbQyQA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=YfCOm-DyAAAA:8
 a=P-IC7800AAAA:8 a=oV-SCJXLI78jTh8MztEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zQLMK8awuJ6_Hvp-_9Ux:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: nqo8sHJp0CIqRgXCpDGqTVal8zYHOhfi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=0
 bulkscore=0 clxscore=1011 malwarescore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>,
 thomas.petazzoni@bootlin.com,
 Bastien Curutchet <bastien.curutchet@bootlin.com>
Subject: Re: [Uboot-stm32] [PATCH] Revert "board: st: stm32mp1: Clean
	env_get_location()"
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

CgpPbiA5LzE3LzI1IDE2OjI1LCBRdWVudGluIFNjaHVseiB3cm90ZToKPiBIaSBLw7ZyeSwKPiAK
PiBPbiA5LzE3LzI1IDQ6MTcgUE0sIEtvcnkgTWFpbmNlbnQgd3JvdGU6Cj4+IFRoaXMgcmV2ZXJ0
cyBjb21taXQgZDM3NjQxYzYxYmEyMTIyNDFjMzhlM2ZkMjJmMDMzNWZjMGJlYmM5Ni4KPj4KPj4g
UmVzdG9yZSBzdXBwb3J0IGZvciBlbnZpcm9ubWVudCBzdG9yYWdlIGluIEVYVDQgZmlsZXN5c3Rl
bSBvbiBlTU1DIGJvb3QuCj4+IFRoZSBwcmV2aW91cyBjbGVhbnVwIGluY29ycmVjdGx5IHJlbW92
ZWQgdGhpcyBmYWxsYmFjayBvcHRpb24gd2hpY2ggaXMKPj4gbmVlZGVkIGZvciBib2FyZHMgdGhh
dCBzdG9yZSB0aGVpciBlbnZpcm9ubWVudCBpbiBhbiBFWFQ0IHBhcnRpdGlvbi4KPj4KPj4gVGhp
cyBjb25maWd1cmF0aW9uIGlzIE9TLXNwZWNpZmljIHJhdGhlciB0aGFuIGJvYXJkLWRlcGVuZGVu
dCBhbmQgc2hvdWxkCj4+IHJlbWFpbiBhcyBpdCBpcyBjb25maWd1cmFibGUgdmlhIG1lbnVjb25m
aWcuIEV2ZW4gaWYgaXQgaXMgbm90IGRlc2NyaWJlZAo+PiBpbiBTVCBkZWZjb25maWdzIHBlb3Bs
ZSBtYXkgaGF2ZSBlbmFibGVkIGl0IGluIHRoZWlyIGRlZmNvbmZpZy4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogS29yeSBNYWluY2VudCA8a29yeS5tYWluY2VudEBib290bGluLmNvbT4KPj4gLS0tCj4+
Cj4+IERlYnVnZ2luZyB0aGlzIGlzc3VlIHJhaXNlcyBhbm90aGVyIGlzc3VlIHRoYXQgbmVlZCBp
bnZlc3RpZ2F0aW9uLgo+PiBJZiBlbnZfZ2V0X2xvY2F0aW9uIHJldHVybiBFTlZMX0lTX05PV0hF
UkUgYnV0IENPTkZJR19FTlZfSVNfTk9XSEVSRSBpcwo+PiBub3Qgc2V0LCBVLWJvb3Qgc3RhbGwg
d2l0aG91dCBhbnkgbG9nLiBUaGVyZSBtaWdodCBiZSBhbiBFTlYgY2hlY2sgaXNzdWUKPj4gaGVy
ZS4KPiAKPiBJIGJlbGlldmUgdGhpcyBtYXkgYmUgcmVsYXRlZCB0byB3aGF0IEkgaGl0IGFsbW9z
dCB0aHJlZSB5ZWFycyBhZ28sIHNlZSBjb21taXQgbG9nIGluIGh0dHBzOi8vc291cmNlLmRlbngu
ZGUvdS1ib290L3UtYm9vdC8tL2NvbW1pdC9iMWYxYjRhNWE1MjhlZWVmZWEyODNjY2NhMmVlOTc3
N2NiMTBjODQwCj4gCj4gIiIiCj4gc2luY2UgYXJjaF9lbnZfZ2V0X2xvY2F0aW9uKCkgaXMgY2Fs
bGVkCj4gYnkgZW52X2luaXQoKSB3aGljaCBpcyBwYXJ0IG9mIHRoZSBwcmUtcmVsb2NhdGlvbiBw
cm9jZXNzLCBhIHZhbGlkLAo+IG5vbi1FTlZMX1VOS05PV04sIHZhbHVlIHNoYWxsIGJlIHJldHVy
bmVkIG90aGVyd2lzZSB0aGUgcmVsb2NhdGlvbiBmYWlscwo+IHdpdGggdGhlIGZvbGxvd2luZyBt
ZXNzYWdlOgo+IGluaXRjYWxsIHNlcXVlbmNlIDAwMDAwMDAwMDAyODY2YzAgZmFpbGVkIGF0IGNh
bGwgMDAwMDAwMDAwMDI1NmIzNCAoZXJyPS0xOSkKPiAKPiBUaGlzIHZhbGlkLCBub24tRU5WTF9V
TktOT1dOLCB2YWx1ZSBpcyBFTlZMX05PV0hFUkUgd2hpY2ggcmVxdWlyZXMgdG8KPiBhbHdheXMg
c2VsZWN0IENPTkZJR19FTlZfSVNfTk9XSEVSRSBvdGhlcndpc2UgdGhpcyB3b3JrLWFyb3VuZCBk
b2VzIG5vdAo+IHdvcmsuCj4gIiIiCj4gCj4gSG9wZSB0aGlzIGhlbHBzLgo+IAo+IEkgaGF2ZW4n
dCBkdWcgZGVlcGVyIHRoYW4gdGhhdCB0aG91Z2guCj4gCj4gQ2hlZXJzLAo+IFF1ZW50aW4KCkhp
CgpPbiByZWFzb24gaXMgZW51bSBlbnZfbG9jYXRpb24gYXJlIGFsbCBkZWZpbmVkIGluIGluY2x1
ZGUvZW52X2ludGVybmFsLmggcmVnYXJkbGVzcyAKQ09ORklfRU5WX0lTX0lOX1hYWCBmbGFncyBi
ZWluZyBlbmFibGVkLgoKU28gZW52X2dldF9sb2NhdGlvbigpIGNhbiByZXR1cm4gRU5WTF9OT1dI
RVJFIHdpdGhvdXQgRU5WX0lTX05PV0hFUkUgZmxhZyBzZXQuCndoaWNoIGNhbiBsZWFkIHRvIGlz
c3VlIGRlc2NyaWJlZCBieSBRdWVudGluIGp1c3QgYWJvdmUuCgpQYXRyaWNlCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5n
IGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
