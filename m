Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF56415A85
	for <lists+uboot-stm32@lfdr.de>; Thu, 23 Sep 2021 11:04:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9757BC5A4D0;
	Thu, 23 Sep 2021 09:04:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E267C5718F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Sep 2021 09:04:42 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18N730jj022164; 
 Thu, 23 Sep 2021 11:04:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=KKSHcuNT+UtkSuLdsG/l1QdPLPiMqalz3Ek71wFDz/c=;
 b=MnVpiEVdZth8P+cEatPCrg1PfrFMeug9htQ/FGW0vUT3pGG/ZB6mWdK+ZCjD0uKow0Wy
 gT99C86dxs8zF/VfixhF1VNuCWSpTdZyRsOkeLEKrC5HjEAclV9WvnO5hXizQCMHmDDG
 iQS30Qz9h+i2cIhxyW+wmlCkgp17sKpV0Auq9+q5PMIzW790TK4yWYv4F3SMEIKhK0iC
 q+skwj/fXqldnXScKI2LxtWH6OFrPpUDaCAJZkJGDYvbQ6gH8OK41BgQ5SGGb7aIef7Y
 fi5FEanY64SzC1hvynyKctuUKGdmh3sq6mrV2DNkThRATJtOuO3CVFv8CmuvhpiSyy4n SQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b8mur8uua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 11:04:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 46C7610002A;
 Thu, 23 Sep 2021 11:04:30 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 898A8226FCF;
 Thu, 23 Sep 2021 11:04:30 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.45) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 23 Sep
 2021 11:04:29 +0200
To: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>
References: <20210922162909.1857566-1-patrick.delaunay@foss.st.com>
 <20210922192925.723abcba@thinkpad>
 <a38d6126-2d09-34d4-0b08-0d1da94ed415@denx.de>
 <20210922210536.6c9c2f9e@thinkpad>
 <56df80f7-aa1d-3cff-5b29-16fdafcf7bcf@denx.de>
 <20210922194615.GD31748@bill-the-cat>
 <59ce8fa7-64f2-07c9-ee2b-4b59335b3907@denx.de>
 <20210922200053.GE31748@bill-the-cat>
 <a0fa4277-80be-ce67-73fa-08a5be23088f@denx.de>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <4f1609c3-0aca-3f49-715b-95c8a3336f61@foss.st.com>
Date: Thu, 23 Sep 2021 11:04:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <a0fa4277-80be-ce67-73fa-08a5be23088f@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-23_03,2021-09-22_01,2020-04-07_01
Cc: Vignesh R <vigneshr@ti.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>, u-boot@lists.denx.de,
 Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH v4 0/2] mtd: spi: nor: force mtd name to
	"nor%d"
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 9/23/21 3:32 AM, Marek Vasut wrote:
> On 9/22/21 10:00 PM, Tom Rini wrote:
>> On Wed, Sep 22, 2021 at 09:56:26PM +0200, Marek Vasut wrote:
>>> On 9/22/21 9:46 PM, Tom Rini wrote:
>>>> On Wed, Sep 22, 2021 at 09:24:24PM +0200, Marek Vasut wrote:
>>>>
>>>>> I am talking about using nor%d in MTDIDS in U-Boot UBI code to =

>>>>> look up from
>>>>> which device to attach UBI in U-Boot.
>>>>
>>>> OK, so are we not able to pass in the correct name now?=A0 Or just =

>>>> worried
>>>> about old environment and new U-Boot?
>>>
>>> Say you have the following in board config:
>>>
>>> CONFIG_MTDIDS_DEFAULT=3D"nor0=3Dff705000.spi.0"
>>> CONFIG_MTDPARTS_DEFAULT=3D"mtdparts=3Dff705000.spi.0:-(fs);"
>>>
>>> Then run "=3D> ubi part fs", which will fail to find nor0, because now =

>>> that
>>> nor0 is called something else. That is what this series tries to fix.
>>
>> Yes, and what is nor0 now, and what happens if you use it?
>
> Now it is "mt25ql02g", for all mt25ql02g on the board, so ... I cannot =

> even select the one SPI NOR I want to use, since they are not even =

> enumerated in any way, they are all the same. You might want to look =

> at get_mtd_device_nm() in drivers/mtd/mtdcore.c .


To comple me use case, on EV1 board can boot from NOR / NAND / SPI-NAND

so mtdparts and mtdids are buidl dynamically with =

CONFIG_SYS_MTDPARTS_RUNTIME in

afraided board/st/common/stm32mp_mtdparts.c::board_mtdparts_default()


I don't use MTDIDS_DEFAULT / MTDPARTS_DEFAULT.


For example, when I force NOR / NAND presence, I create the MTD variables:

mtdids=3Dnand0=3Dnand0,nor0=3Dnor0

mtdparts=3Dmtdparts=3Dnand0:2m(fsbl),2m(ssbl1),2m(ssbl2),-(UBI);nor0:256k(f=
sbl1),256k(fsbl2),2m(ssbl),512k(u-boot-env),-(nor_user)


The command "mtdparts" is working in previous U-Boot releaseafraided

and it is not more working as the name of MTD device change


Today, without my patch I have

STM32MP> mtd list
SF: Detected mx66l51235l with page size 256 Bytes, erase size 64 KiB, =

total 64 MiB
Could not find a valid device for nor0
List of MTD devices:
* nand0
 =A0 - type: NAND flash
 =A0 - block size: 0x40000 bytes
 =A0 - min I/O: 0x1000 bytes
 =A0 - OOB size: 224 bytes
 =A0 - OOB available: 118 bytes
 =A0 - ECC strength: 8 bits
 =A0 - ECC step size: 512 bytes
 =A0 - bitflip threshold: 6 bits
 =A0 - 0x000000000000-0x000040000000 : "nand0"
 =A0=A0=A0 =A0 - 0x000000000000-0x000000200000 : "fsbl"
 =A0=A0=A0 =A0 - 0x000000200000-0x000000400000 : "ssbl1"
 =A0=A0=A0 =A0 - 0x000000400000-0x000000600000 : "ssbl2"
 =A0=A0=A0 =A0 - 0x000000600000-0x000040000000 : "UBI"
* mx66l51235l
 =A0 - device: mx66l51235l@0
 =A0 - parent: spi@58003000
 =A0 - driver: jedec_spi_nor
 =A0 - path: /soc/spi@58003000/mx66l51235l@0
 =A0 - type: NOR flash
 =A0 - block size: 0x10000 bytes
 =A0 - min I/O: 0x1 bytes
 =A0 - 0x000000000000-0x000004000000 : "mx66l51235l"
* mx66l51235l
 =A0 - device: mx66l51235l@1
 =A0 - parent: spi@58003000
 =A0 - driver: jedec_spi_nor
 =A0 - path: /soc/spi@58003000/mx66l51235l@1
 =A0 - type: NOR flash
 =A0 - block size: 0x10000 bytes
 =A0 - min I/O: 0x1 bytes
 =A0 - 0x000000000000-0x000004000000 : "mx66l51235l"



before my patch, Ihave always the error "Device nor0 not found!" on =

mtdparts command

=3D> get_mtd_info

=3D=3D> get_mtd_device_nm("nor0")=A0=A0 build with MTD_DEV_TYPE(type)

=3D=3D=3D> mtd_device_matches_name()

 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 and here "nor0" must be=A0 mtd->name aco=
ring the code


or I miss something...


I don't found any way to solve my issue only with "mtdids" variable.

so I restore the previous behavior as I expect the mtd name

modification can impact many other boards.


A other solution can be change get_mtd_info(),

but I was also afraid of side effect.


Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
