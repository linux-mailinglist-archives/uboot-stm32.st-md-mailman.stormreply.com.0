Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 756273729FE
	for <lists+uboot-stm32@lfdr.de>; Tue,  4 May 2021 14:22:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09A0FC59781;
	Tue,  4 May 2021 12:22:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7279DC32E90
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 May 2021 12:22:12 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 144C76mM031631; Tue, 4 May 2021 14:22:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=wW2QIQQiTtIXQ+rECKHAx1YzmuBtDAf/3VpzDocsIFU=;
 b=FuoKwFJqYC/kRfaoAKj8bzE0RO0AE/XVUHDN6iMYpWSXunlFfJW34kQm1eKzTUrVxRtG
 rCUd3XJ1s8KKkIyi0it9Hw5qjkaF6+T6l6iBTJufZa50CauXsA2tCAMLoMglkZrS0+p4
 DB9SKqUyNDfo0VNm35Uyvx+Lcz6EJG2xutLz4Cl1m/m9Fv2lINxllyGBr+W6PgPt8miL
 rNZVxLif7plrQUZyxd0xaHCvpUqzRfn9dLfZ3oRYqZdxksy81Y1pQvinLuZr/YXbIa+h
 zoaZ8FVC4I+DczWvMdgAWlLCajvNGu0/YW9DIxSgGUsyRQ0rNIVmJWVO6di1leXSF7Cb iA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38akujx2wm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 14:22:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6BE8710002A;
 Tue,  4 May 2021 14:22:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 59037225619;
 Tue,  4 May 2021 14:22:05 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 4 May
 2021 14:22:04 +0200
To: Simon Glass <sjg@chromium.org>
References: <20210428102345.3192-1-patrick.delaunay@foss.st.com>
 <20210428122109.v3.2.I22712a112842c336b2934d240f18dc64f12919db@changeid>
 <CAPnjgZ2OecZEktCN6i8TKpVmGFQFCZLFcQ37s7-+9FVg6Vi+9Q@mail.gmail.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <3cfe2ffb-15b0-7d7b-415a-abd28b17a7a9@foss.st.com>
Date: Tue, 4 May 2021 14:22:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPnjgZ2OecZEktCN6i8TKpVmGFQFCZLFcQ37s7-+9FVg6Vi+9Q@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-04_07:2021-05-04,
 2021-05-04 signatures=0
Cc: Marek Vasut <marex@denx.de>, Bin Meng <bmeng.cn@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Tero Kristo <t-kristo@ti.com>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Marek Bykowski <marek.bykowski@gmail.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v3 2/7] lmb: add lmb_is_reserved_flags
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


On 4/29/21 6:10 PM, Simon Glass wrote:
> Hi Patrick,
>
> On Wed, 28 Apr 2021 at 03:23, Patrick Delaunay
> <patrick.delaunay@foss.st.com> wrote:
>> Add a new function lmb_is_reserved_flags to check is a
>> address is reserved with a specific flags.
>>
>> This function can be used to check if an address was
>> reserved with no-map flags with:
>>
>> lmb_is_reserved_flags(lmb, addr, LMB_NOMAP);
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>> (no changes since v1)
>>
>>   include/lmb.h |  1 +
>>   lib/lmb.c     | 10 ++++++++--
>>   2 files changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/lmb.h b/include/lmb.h
>> index aa196c63bf..6537d56e18 100644
>> --- a/include/lmb.h
>> +++ b/include/lmb.h
>> @@ -91,6 +91,7 @@ extern phys_addr_t lmb_alloc_addr(struct lmb *lmb, phys_addr_t base,
>>                                    phys_size_t size);
>>   extern phys_size_t lmb_get_free_size(struct lmb *lmb, phys_addr_t addr);
>>   extern int lmb_is_reserved(struct lmb *lmb, phys_addr_t addr);
>> +extern int lmb_is_reserved_flags(struct lmb *lmb, phys_addr_t addr, int flags);
> drop extern and please add a function comment


I chosed to use extern to by aligned with other function and the linux 
memblock library.

But I will drop them in v4



>>   extern long lmb_free(struct lmb *lmb, phys_addr_t base, phys_size_t size);
>>
>>   extern void lmb_dump_all(struct lmb *lmb);
>> diff --git a/lib/lmb.c b/lib/lmb.c
>> index 69700bf9ba..e270e86186 100644
>> --- a/lib/lmb.c
>> +++ b/lib/lmb.c
>> @@ -443,7 +443,7 @@ phys_size_t lmb_get_free_size(struct lmb *lmb, phys_addr_t addr)
>>          return 0;
>>   }
>>
>> -int lmb_is_reserved(struct lmb *lmb, phys_addr_t addr)
>> +int lmb_is_reserved_flags(struct lmb *lmb, phys_addr_t addr, int flags)
>>   {
>>          int i;
>>
>> @@ -451,11 +451,17 @@ int lmb_is_reserved(struct lmb *lmb, phys_addr_t addr)
>>                  phys_addr_t upper = lmb->reserved.region[i].base +
>>                          lmb->reserved.region[i].size - 1;
>>                  if ((addr >= lmb->reserved.region[i].base) && (addr <= upper))
>> -                       return 1;
>> +                       return !!((lmb->reserved.region[i].flags & flags)
>> +                                  == flags);
> I don't know what flags is since there is no comment, but it seems
> that you should drop the !!()


Yes, it is a old C-coding habit.


>>          }
>>          return 0;
>>   }
>>
>> +int lmb_is_reserved(struct lmb *lmb, phys_addr_t addr)
>> +{
>> +       return lmb_is_reserved_flags(lmb, addr, LMB_NONE);
>> +}
>> +
>>   __weak void board_lmb_reserve(struct lmb *lmb)
>>   {
>>          /* please define platform specific board_lmb_reserve() */
>> --
>> 2.17.1
>>
> Regards,
> Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
