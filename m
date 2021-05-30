Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B85395313
	for <lists+uboot-stm32@lfdr.de>; Sun, 30 May 2021 23:43:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D76AC424BD;
	Sun, 30 May 2021 21:43:18 +0000 (UTC)
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4CA2CC32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 30 May 2021 21:43:16 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20210530214312epoutp0266d26e89953f9984cd26e34227009959~D9jO8RT4j3207632076epoutp02s
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 30 May 2021 21:43:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20210530214312epoutp0266d26e89953f9984cd26e34227009959~D9jO8RT4j3207632076epoutp02s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1622410992;
 bh=y6IAE11Uf/ATHRHnCLgNH6AvKsqKPH7nHq2cT4JcLYI=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=ZMwjDq3NChcsPMxZxyaLwMwn/IPB2g89ezn0f0MtjhaEaRzqSFOuwRPJgHibNmcfh
 XFSq+l+bTO1KSZSohPBiptzriVgwtFZ/P7H/FVwtTkVDoikqOBiqquFWcRHsJS8UUx
 1rMAWW+lfHRbTt0RitS0vd/1j6R74S9gcdHMWeH0=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20210530214312epcas1p41a892e5071c6bb4343881d7425fe27a2~D9jOeMxpT1684216842epcas1p4Q;
 Sun, 30 May 2021 21:43:12 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.156]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4FtX3K20wvz4x9Pv; Sun, 30 May
 2021 21:43:09 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 D2.6D.09701.DE604B06; Mon, 31 May 2021 06:43:09 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20210530214308epcas1p49969b3aa184e0a1ab3831f4daae54911~D9jLF7Td62196321963epcas1p4E;
 Sun, 30 May 2021 21:43:08 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210530214308epsmtrp239be96898b412e78d5bfb5e55d67015e~D9jLFQgEH1880018800epsmtrp2O;
 Sun, 30 May 2021 21:43:08 +0000 (GMT)
X-AuditID: b6c32a36-647ff700000025e5-55-60b406ed50a9
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 88.76.08163.CE604B06; Mon, 31 May 2021 06:43:08 +0900 (KST)
Received: from [10.113.113.235] (unknown [10.113.113.235]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210530214308epsmtip13f2a8b9fe625f9f11e3d8b7cd39c705a~D9jK6sKTq2758127581epsmtip1T;
 Sun, 30 May 2021 21:43:08 +0000 (GMT)
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
From: Jaehoon Chung <jh80.chung@samsung.com>
Message-ID: <f161431a-6915-69b1-9617-35aea4290ad5@samsung.com>
Date: Mon, 31 May 2021 06:44:01 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f3155f93-f2ba-de1f-da12-5cdb8926ff0c@foss.st.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMJsWRmVeSWpSXmKPExsWy7bCmge5bti0JBqeucVv8PPme3WLS+mvs
 Fisv/We1+LZlG6PF272d7BYLty5ncWDzmN1wkcXjaf9Wdo+zd3YwehzcZ+jx9Mde5gDWqGyb
 jNTElNQihdS85PyUzLx0WyXv4HjneFMzA0NdQ0sLcyWFvMTcVFslF58AXbfMHKALlBTKEnNK
 gUIBicXFSvp2NkX5pSWpChn5xSW2SqkFKTkFlgV6xYm5xaV56XrJ+blWhgYGRqZAhQnZGa9+
 LWcvWMRVcfbmccYGxq0cXYycHBICJhItBzezdDFycQgJ7GCUeH57NyOE84lRYsK5x6wQzmdG
 iVunPzHBtHw8egiqahejxPrHp6H63zNKvDjYyw5SJSzgLvGyYT1zFyMHh4hAlcSV9XIgNcwC
 nYwS9/dNZwSpYRPQkdj+7TjYVF4BO4nXJ18wg9gsAqoSmw/cZQWxRQUiJXY+fckOUSMocXLm
 ExYQm1PAXuLGhudgNrOAuMStJ/OZIGx5ie1v5zCDLJMQ6OSQWDKlFewICQEXifUTPSE+EJZ4
 dXwLO4QtJfH53V42CLtaYlfzGajeDqCXtzVBvWwssX/pZCaQOcwCmhLrd+lDhBUldv6eywix
 l0/i3dceVohVvBIdbUIQJSoSl16/ZIJZdffJf1YI20Pi3/HpjBMYFWch+WwWkm9mIflmFsLi
 BYwsqxjFUguKc9NTiw0LjJBjexMjOHVqme1gnPT2g94hRiYOxkOMEhzMSiK8Zyo2JgjxpiRW
 VqUW5ccXleakFh9iNAWG9URmKdHkfGDyziuJNzQ1MjY2tjAxNDM1NFQS5013rk4QEkhPLEnN
 Tk0tSC2C6WPi4JRqYGqdN39hw7F688Nr963a/2ZjTptRSZBX57NCJk3Lfac27jA4nBiar+Eh
 kvFmg3APy4J5302n3V4VH5t7+H+IZYhH8+RjwScOvi1pmd8wc8+EOf/1GTK9vD3dgpKiE3jO
 xs0qCm4SvMrt/Ms0ulckNLkqhrvs0J+yX8Lcq60clGZWvdk0b8bKU+90ApnC9Pz/3t6e9jKD
 RVXw3/PKkFavlLwNR1lDOwIO6krFbjBsLCr+dlLKSD5ym13I7MnH+PaZFZnMXbFmgmSoe1fn
 Ic2sJpaXz+bV3S97dSbOZcXVA5Okuk1Ezaq5hQtCfkn3qnDtKt1/2NjbZqb9nmi3t4ertp9m
 ORQyUTkozr1TpOilEktxRqKhFnNRcSIAUOM+fyYEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrELMWRmVeSWpSXmKPExsWy7bCSnO4bti0JBkeXqVn8PPme3WLS+mvs
 Fisv/We1+LZlG6PF272d7BYLty5ncWDzmN1wkcXjaf9Wdo+zd3YwehzcZ+jx9Mde5gDWKC6b
 lNSczLLUIn27BK6MV7+Wsxcs4qo4e/M4YwPjVo4uRk4OCQETiY9HDzF2MXJxCAnsYJTYfL+b
 ESIhJfH56VS2LkYOIFtY4vDhYoiat4wSt+e8BqsRFnCXeNmwnhnEFhGokrh/cBkbSBGzQCej
 xMurr1kgOiYxSTw98w6sik1AR2L7t+NMIDavgJ3E65MvwOIsAqoSmw/cZQXZJioQKbFzhyVE
 iaDEyZlPWEBsTgF7iRsbnoPZzALqEn/mXWKGsMUlbj2ZzwRhy0tsfzuHeQKj0Cwk7bOQtMxC
 0jILScsCRpZVjJKpBcW56bnFhgVGeanlesWJucWleel6yfm5mxjB0aKltYNxz6oPeocYmTgY
 DzFKcDArifCeqdiYIMSbklhZlVqUH19UmpNafIhRmoNFSZz3QtfJeCGB9MSS1OzU1ILUIpgs
 EwenVAPThfvya0OLDZ81LrlWnZhf+vtnSPb273N36vCweD0KCP35lFf457FjGnONjmjXzv78
 g4vTKUxF5c2Ti3NcxT0d0jYWfI2PWTKH4ShnVH2dYNLqppVT39brzKgIXH5EQk3yzvF78f+C
 92490V+jvDfP0JunJGFu67uJLFwX2Scu9K9YwSCU/5VHX2Nib4CXx3OTyq88Fw5rWns23lrS
 t2WrmCVDwtvoXSKsxn/e2HPmnF//KvKratf04oByn197+pw8Npev1P7Kcl/6+rLvWvbK1/8y
 7V2cGhDSPCP1bKzR0ufrchkmWfD8Swkq6d115tH3tVpZooEPtWasq07nTzd7fsTVKuxtL1tr
 n0jClO1KLMUZiYZazEXFiQChdLA+BQMAAA==
X-CMS-MailID: 20210530214308epcas1p49969b3aa184e0a1ab3831f4daae54911
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210528125424epcas1p3ad9b785f92409d832d7c7f454ee87b89
References: <20210518131213.20343-1-patrick.delaunay@foss.st.com>
 <20210518151206.6.Id5ec1c084e307f296256a9764772f23492ee4766@changeid>
 <CGME20210528125424epcas1p3ad9b785f92409d832d7c7f454ee87b89@epcas1p3.samsung.com>
 <f3155f93-f2ba-de1f-da12-5cdb8926ff0c@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 06/10] stm32mp: stm32prog: correctly
	handle DM_PMIC
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

On 5/28/21 9:54 PM, Patrice CHOTARD wrote:
> Hi Patrick
> 
> On 5/18/21 3:12 PM, Patrick Delaunay wrote:
>> Correctly handle number of alternate when DM_PMIC is not activated.
>> This patch remove the last UNKNOWN partition in this case.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
>> index ea69d5dd16..ab687c272d 100644
>> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
>> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
>> @@ -1150,7 +1150,10 @@ static int dfu_init_entities(struct stm32prog_data *data)
>>  	struct dfu_entity *dfu;
>>  	int alt_nb;
>>  
>> -	alt_nb = 3; /* number of virtual = CMD, OTP, PMIC*/
>> +	alt_nb = 2; /* number of virtual = CMD, OTP*/
>> +	if (CONFIG_IS_ENABLED(DM_PMIC))
>> +		alt_nb++; /* PMIC NVMEM*/
>> +
>>  	if (data->part_nb == 0)
>>  		alt_nb++;  /* +1 for FlashLayout */
>>  	else
>>
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Acked-by: Jaehoon Chung <jh80.chung@samsung.com>

Best Regards,
Jaehoon Chung

> 
> Thanks
> Patrice
> 

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
