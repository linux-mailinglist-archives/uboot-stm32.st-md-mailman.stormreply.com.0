Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB324BD7E61
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Oct 2025 09:30:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7A14C5660D;
	Tue, 14 Oct 2025 07:30:15 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011019.outbound.protection.outlook.com
 [40.107.130.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57F29C3F945
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Oct 2025 00:49:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DDz+43/ACEVXo2E2cSdvzUXseLXyu/THOrTF3dIKSeIdHOUzNozbDVyWU51erA7Q0W01sVVEIzXX6sHn/C35lCHNbsmxwHsadUyQ+vehmrY1n7kUZzEQM6b5ksqxuws4YqMi8CexPgKvadktJoCEDRmPuYFqTFfbFzKhMapEsWvd8nsI5DcnEBRZoaYQw+sBED/a5Mc5+v0L1WXIj0PCBuDngVa4NT+gs+Vm+3JXxxrMN9m+BVc2YxUfZBPU8RLZkJ6hoqRUVYDoc++M/20NRpGNF67KOtAQo2VbkVfL6wfQqBJ7RxOGOyjuVsePVvwa8IIwtCtXP7pkLgGqMzhQoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7GorWo2dKISJgWoJ4MFIZmme6DeFbHeTIDkACzrTKLw=;
 b=D3gBet4x3q0/voJ3sRmnacJEe3UA3xxKrKwPDXIVc5ol07qtvDuLT/A59Y4OYXfvvdGWq9s8LpULZ3YDFKIgUAivzcgvOInEx6TAXBcUpkWhchbz/xiFtu4cFTiA8sEyLOQREe36c7evNGXrmtk/dF6qU/U2WXa16Dx4/69mT+gRSMD5EtEFGrQMTH0+WtODWlMMgLZSTwuHTD8UbJv564+T3yxcc3ueUYoyJFOHzCB5FZ+xtzKo3B5bPCTAJAnlcVSCOEOgGBV+EgzCGLq9DMNQZqpaWAKZd1ZxY1OrvnnExNxFfE9sjZtR/10SZ5RAL/sFWdfgZm2/lSs94nIQ/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7GorWo2dKISJgWoJ4MFIZmme6DeFbHeTIDkACzrTKLw=;
 b=f+3sa92UjJoZJIOgRP4FocLTvRut/jRRwTZQnZVtJGFxZR0pS3jCjY4fLXN73UIN6ABHxfRahJUybS9Pa3qTB5P4KYPFqzipzoJbxtM6yKTTyD/9vaupyJsfCp+PPWY5UkbmJ2z5m46ET5N7KAckOzlk+1tcZvQy1vrBY7i5QcFzGceyh34Eoafu+JnKp1BURFX5fNhkERHN8PPqT+qHH4DsoIzlb88OomXBy38i6IOt1ZgoUVIl0MFW124KEtr8x1H0Pp/BhRRKhJXppWu5IxZ00s9SSUlQIEcMWad2d5IcvUaut+uNi47UHvsRHm9QZgrH8aq3maoWMrXBUaR4wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10701.eurprd04.prod.outlook.com (2603:10a6:150:20c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 00:49:11 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 00:49:11 +0000
Date: Tue, 14 Oct 2025 10:01:26 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: "Kumar, Udit" <u-kumar1@ti.com>, Tom Rini <trini@konsulko.com>
Message-ID: <20251014020126.GB31468@nxa18884-linux.ap.freescale.net>
References: <20251013-imx-rproc-v1-0-fb43a3fafcd0@nxp.com>
 <20251013-imx-rproc-v1-1-fb43a3fafcd0@nxp.com>
 <eac85809-2d75-434b-a107-3bbcf1807710@ti.com>
Content-Disposition: inline
In-Reply-To: <eac85809-2d75-434b-a107-3bbcf1807710@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR06CA0018.apcprd06.prod.outlook.com
 (2603:1096:4:186::8) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB10701:EE_
X-MS-Office365-Filtering-Correlation-Id: fd5e35da-0a08-4421-3a34-08de0abb7d6c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0SHasHCv2Y6jm8Rb3t+Uy/uDNWpj7tVat/Hfn9OHBbdTK2ZYzB3xbqHTzaRb?=
 =?us-ascii?Q?YrN1wYMa43yStWJEINPRig7fJdLzpIB4/5TbshSxM1/POOoNVtErXkd1jmBG?=
 =?us-ascii?Q?WuvqiQeMqfsV+FkVJue9VJ5pV5oLBXr+ybTtoM3lOqjw5wA7wrN1OcdaPK8r?=
 =?us-ascii?Q?UWkWTrK6ktopQ9blnuROe3RErsVrUosKouQcUPA3lOkcL7Mk9L+SlwaXpSlU?=
 =?us-ascii?Q?0nhQ5nq0rjEfPl3no8xopzKtxA3guHcSfcFBYRCnViO7I6C869l2Gh9Sd1/F?=
 =?us-ascii?Q?To4XBxxuVrJ9b1GUwuaU7YqF12Ml5Svy3G4OimLj4+ZbXdsIKLavaUGc+Fzy?=
 =?us-ascii?Q?6zB8luQ8D1RHUFF25avXNUXvp6UoZQaKnWLmr3H0822CUUsnWcp1g/hPMl7t?=
 =?us-ascii?Q?C1gxRskQ4RyZgyML5+ZiDcPwe1HnrwnbBddWGT2Kh/37IgMZhTFdPbfc8gQU?=
 =?us-ascii?Q?1wmp2KroMBTJDVU3EZYgGGMqIBnMgT/XQKPzmTqrO+/aagtMuYDgPr1jIUAN?=
 =?us-ascii?Q?Ogfo/92z1FvbD2Gh0wBP0LrtaQEin5+uEZA1jQUnObne1sy+XRF2lP3HDljb?=
 =?us-ascii?Q?BOM5YzqQXV2h4ahNQjPdU89eS+6Xz2XMfAB6y6DE92wvqv/pdbq8IwObcVqh?=
 =?us-ascii?Q?hCUO3n0vWDhzt1k03UzA1avWzA/NAvr6k1ppWgwyuhhJxvG7AlfmW7didcqQ?=
 =?us-ascii?Q?ijoTbgbttoeR9hC1qb2kna+Vcv9hP4QwP+4jgaH8hV8qPWBEUenupArglUGd?=
 =?us-ascii?Q?9Xk5bWaDoWcFhn0DVSUZXm4h5mNaqjx428TAazPgR8HWN0st3Ehj8HEkLAvh?=
 =?us-ascii?Q?UXDC6jT5xUpi42NmXHn8HoGf08qHBwkKB4k9CzDmF3UPMv/12JbH6F1Qq8l4?=
 =?us-ascii?Q?97JXbRTzHhAc2+RCqj6Q8Qh8EJwtvH/oEETGutLzP2hR4Axh+4NF/arJ3wQP?=
 =?us-ascii?Q?SXrQyNCJ9JvAfVixqTCCGT8rT75r/DV11LCK7oSu02rgsdz3J/Ka8OpoWhHq?=
 =?us-ascii?Q?qYvXC0zRmTQ6A9zJowqvGNU77+sLQHxgi//IrPF2vc166GFeFIbVRQ7L7C1Z?=
 =?us-ascii?Q?zPpDKE09LZ8sJ/6EMBNdz3bYBFJf+42h+Zy4xglLHFEQnIGG9HYNcSuXO4UP?=
 =?us-ascii?Q?4COObj1jgbrGm5LC5Jm24ey9Kzcsah/fcA/3O481h+mUqa6jrYzcO3AymSBR?=
 =?us-ascii?Q?MTejyx0NM7xkeDCDxceU1Mak5/hmDhZi7hdb9cn8E6uZmR3MBiMiumigiEfi?=
 =?us-ascii?Q?SusKaEe/R5iOhvYWwEe85b1wwD3CFt18FhZQ5zBKkSUawW+XGEOEr4lDrwaj?=
 =?us-ascii?Q?1MXqyoIyokUQ4PdP/BLHhHR5eVE9oj24qH/rtV4CSmFjBTZhcDsYvvPKi4G4?=
 =?us-ascii?Q?gkLwv/IqlCaG3UPYF0wqi8dZeUU0AN6XcNOi2ygdVeBm3JJrKDpcSiuItrRT?=
 =?us-ascii?Q?YrDE4VvZJ/X5UBMQSQ83GLoRGEMxRh3w02Va23g6Lf+gfEgfzO8i+YY7JhoF?=
 =?us-ascii?Q?rv6kPMjQCsDfznlSrTzyAcDx2FoGDMFzsIsR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e/P2mI7lQaBSlntVx3aLnuXTcUdbcqNSSA//LRvg6QRvyOjK5YgTU/ksqOj3?=
 =?us-ascii?Q?6PrU5DwA9m6eMS5CmzB9ZTmldOWTZDLyC2199EA+y3KAs+DWLyvYTIRp2Gu2?=
 =?us-ascii?Q?6y4k7HdcmgiWejBOPc6dQ9B7q69C44VMDzmx4P60+vpIz5gW5B042N3XDsMv?=
 =?us-ascii?Q?nyD+txmZ/UEqkQ/lTk4sHI+cMAx130srYViAmqyYwrk+c5+MtWQ23rx/2XpF?=
 =?us-ascii?Q?RSqo+Bb/EtRVAjsBPt1SMZ5osNDpyqBEvYeMg0t5TU2kMja3uo6E/cxUnZU1?=
 =?us-ascii?Q?IFRLXM2aGa+dN5pwpmr5HDvS0rbUrpIXwOJnCUYOC/e3XjA8yASeK7FA6oxB?=
 =?us-ascii?Q?ph9LhNMoyXlUTFOlY/HJ2zKuYdRESVmhSUpf1+iCBtU6AonNLk5Lrt8vvZy3?=
 =?us-ascii?Q?nLmS91sYyc+Hnkmspyb8q9DuaUbXq9QDdDJB6Kie9qThCuG1UPYoCis216BA?=
 =?us-ascii?Q?2ppV+k3+944ovR/VDqyUru3zKPJigW1Cf2GjPAwxhL2tFbW8hLHAOOJRvNdk?=
 =?us-ascii?Q?7o6/cXD5FhHp0YlF/EOa1lXjakk+AIJ2yFaQ5DEUl96z/PetaCSuvypNiFMh?=
 =?us-ascii?Q?2uAZGsoUXOcug2iIBZ4pg5r7yPh+gHA1TxKhHbOZ+QJ8claTERDYJ13hHppd?=
 =?us-ascii?Q?SWEjHSPLJP03d9+MQskQCHhrUHk0gecmpjLZyibk0ti+5gShtcT9erXRlZUO?=
 =?us-ascii?Q?MpLwwAvhicBE+rgHM4s7tJDtXQa8maJkd/opgBilXZK9TAqVod+Xyf8gIc2J?=
 =?us-ascii?Q?MwsY5NcIM9jXbcRu7HAzjMo0sZbiCfW5oX2qP9WvycZ/vD4zUhWCDNr/bIcu?=
 =?us-ascii?Q?nfZdRqf3FeHc/toC+7hUnIJOjV/hed4dAbYsKwJDQXde4LJAa+PFiB9EP5f+?=
 =?us-ascii?Q?/TSI4bYgJTFzjhEl5JBQ3e+SHQfTC6JOUaQj3p4BV16GOiBR6cGzgAvxPVlm?=
 =?us-ascii?Q?oQuBQxrV3lUQ+x2k8qDJLm0s3wTDjMhm/ULpdUY/DvQr7pY0bF1JLMOcaWhY?=
 =?us-ascii?Q?zO0h6lW+nYyHG4BhL7/RE7o120JaxiYBx7An1KgclKMfSGnwwHQWE/3bLoRG?=
 =?us-ascii?Q?lcFLv4Nx9IPTim37NsXgRlBe95kY/T1OOy+J29e4dJuKcLPsEbTJ9VBL3iFE?=
 =?us-ascii?Q?TSZaOJ0h+umLPtoNoCFsBVrdwHn4CFHYWG4AWD6lpp16XLjIaCOb8rrvb0qo?=
 =?us-ascii?Q?3C/YttSeeFy3SIaFxqmiEKwKjkdMJ441LVjP2QpBIlttg4lC8l/efE8seZ9S?=
 =?us-ascii?Q?ygh9eBl8QTZviZJj0lGUiZYm406/avpv8VYHsSxjPKJXq1XX9zRatYyg2g0r?=
 =?us-ascii?Q?5BoDufwa47VH8D3v62w6Ib73dX9EFd0YNnMAaKXVewEaJmhhMN3xHQ3yWyxr?=
 =?us-ascii?Q?MP6m7RW4WLD7hLNPsPMytJiXeJhmq1OleL+E7JL1jkabIICT9V2e3DcqfaIa?=
 =?us-ascii?Q?1qIo8c36UG5h/30u3Q3/QohSGiA64suExiWXzeKs9Gd7PGqApEzYLYZaEzke?=
 =?us-ascii?Q?yRVL4KHVdnQcc0WN+Qwwhei5mqZhOXKHzxptBKr5pCs7Ghd6FZ3hFUwWjajF?=
 =?us-ascii?Q?vMTKCJ6oC9MC4M3Dt65yKO0pG/LbzJXBxEYd1rd5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd5e35da-0a08-4421-3a34-08de0abb7d6c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 00:49:11.6152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dnob1WrIbl+qQWO3eGiKfXOU0rODW0bBfq0HdZOgV8xgaX+lw0ej4BUF16OUesOipetvNO/unLIecjRuj7vyWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10701
X-Mailman-Approved-At: Tue, 14 Oct 2025 07:30:14 +0000
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>, Ryan Eatmon <reatmon@ti.com>,
 Andrew Davis <afd@ti.com>, u-boot@lists.denx.de,
 Beleswar Padhi <b-padhi@ti.com>, Judith Mendez <jm@ti.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Hari Nagalla <hnagalla@ti.com>,
 Fabio Estevam <festevam@gmail.com>, Stefano Babic <sbabic@nabladev.com>
Subject: Re: [Uboot-stm32] [PATCH 01/11] lib: Import iomem_copy from Linux
	Kernel
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

On Mon, Oct 13, 2025 at 11:41:25PM +0530, Kumar, Udit wrote:
>
>On 10/13/2025 8:19 AM, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>> 
>> memcpy_{from,to}io and memset_io is needed for i.MX8M to write
>> TCM area. So import the APIs from Linux Kernel 6.17.
>> 
>> Reviewed-by: Ye Li <ye.li@nxp.com>
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>   include/asm-generic/io.h |  37 +++++++++++++
>>   lib/Makefile             |   1 +
>>   lib/iomem_copy.c         | 136 +++++++++++++++++++++++++++++++++++++++++++++++
>
>>   3 files changed, 174 insertions(+)
>> 
>> diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
>> index 13d99cfb5973399209c00adee0080ff83414c064..cf981ad3501f935c714b7580536540e7aba249c1 100644
>> --- a/include/asm-generic/io.h
>> +++ b/include/asm-generic/io.h
>> @@ -3,6 +3,7 @@
>>    * Generic I/O functions.
>>    *
>>    * Copyright (c) 2016 Imagination Technologies Ltd.
>> + * Copyright 2025 NXP
>>    */
>>   #ifndef __ASM_GENERIC_IO_H__
>> @@ -453,5 +454,41 @@ static inline void iowrite64_rep(volatile void __iomem *addr,
>>   #endif
>>   #endif /* CONFIG_64BIT */
>> +#ifndef memset_io
>
>If you are on arm, then
>
>arch/arm/include/asm/io.h defines these io functions, for ARM64 and non-ARM64
>platform,
>
>In your SOC, how this works.

Thanks for pointing this out, I thought these helpers were not defined,
so I import this file from Linux. So on my platform, the arm64 io helpers
are used, the functions in this file are not used because there is
"#ifndef xx".

But anyway, for non-ARM/ARM64 platforms, this file is still useful.

I could drop this if you prefer. Or keep this for other ARCH. 

Thanks
Peng

>
>> +/**
>> + * memset_io -	Set a range of I/O memory to a constant value
>> + * @addr:	The beginning of the I/O-memory range to set
>> + * @val:	The value to set the memory to
>> + * @count:	The number of bytes to set
>> + *
>> + * Set a range of I/O memory to a given value.
>> + */
>> +void memset_io(volatile void __iomem *addr, int val, size_t count);
>> +#endif
>> +
>> +#ifndef memcpy_fromio
>> +/**
>> [..]
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
