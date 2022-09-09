Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 351005B31FD
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Sep 2022 10:43:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D90F6C64112;
	Fri,  9 Sep 2022 08:43:38 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8370DC6410E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Sep 2022 08:43:38 +0000 (UTC)
Received: from [192.168.1.107] (82-131-156-114.pool.digikabel.hu
 [82.131.156.114])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: hs@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1409883FC6;
 Fri,  9 Sep 2022 10:43:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1662713018;
 bh=9oO8+iuvPFknqTNAmr1waie6Z9Twi3P5wDPNToXx7n8=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Xz7OR87ygFfVUsb1aW62xlsKcb53zd5D0rLDfRh85cacaVS31x31evPUe2enXDwlg
 sphdFqEYJrDMAhtKEuIiV7YEyo47Gn2QNywoKULlz2zwrhVzFsx1wiDLZ8Jc9jt0vv
 o6pqKbrgbK0OjP+44Ifbh2i57g9abizAEK5rLNOp6jlYZojTjtsaqYsANcM5/bKXp4
 BXwRzAFO6sOJ4udCijfX8Vs+unEJtD4kvM+YUeVSf3/yQAGksPPLA0Pswbgp4uUMhc
 vlzMsrkQrzZXD0LWVGL2BDxdAskkFZvTP+xkn67X0iW8AlZ962Wjw+tMgd4QRscFmo
 ZvIfNv+VaxSTw==
To: "Jorge Ramirez-Ortiz, Foundries" <jorge@foundries.io>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
References: <20220908105934.1764482-1-alain.volmat@foss.st.com>
 <20220908105934.1764482-4-alain.volmat@foss.st.com>
 <d7370841-4ba2-7e1f-596c-187de27e51b3@foss.st.com>
 <20220909083038.GA314457@trex>
From: Heiko Schocher <hs@denx.de>
Message-ID: <68306400-21b9-5fb6-cae9-55bdd1381168@denx.de>
Date: Fri, 9 Sep 2022 10:43:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220909083038.GA314457@trex>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: uboot-stm32@st-md-mailman.stormreply.com, oleksandr.suvorov@foundries.io,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v2 3/3] i2c: stm32: only send a STOP upon
 transfer completion
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
Reply-To: hs@denx.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hello Jorge,

On 09.09.22 10:30, Jorge Ramirez-Ortiz, Foundries wrote:
> On 08/09/22, Patrick DELAUNAY wrote:
>> Hi,
>>
>> On 9/8/22 12:59, Alain Volmat wrote:
>>> Current function stm32_i2c_message_xfer is sending a STOP
>>> whatever the result of the transaction is.  This can cause issues
>>> such as making the bus busy since the controller itself is already
>>> sending automatically a STOP when a NACK is generated.  This can
>>> be especially seen when the processing get slower (ex: enabling lots
>>> of debug messages), ending up send 2 STOP (one automatically by the
>>> controller and a 2nd one at the end of the stm32_i2c_message_xfer
>>> function).
>>>
> 
> Cmon no need to thank me, that is kind of excessive :)
> Just the sign-off or codevelop tags for reference
> 
> 
> if you can wait before merging I will test the series before monday

I would love to see a test before we merge this.

@Patrick: feel free to merge it through stm32 repo.

Thanks!

bye,
Heiko
> 
> thanks
> Jorge
> 
>>> Thanks to Jorge Ramirez-Ortiz for diagnosing and proposing a first
>>> fix for this. [1]
>>>
>>> [1] https://lore.kernel.org/u-boot/20220815145211.31342-2-jorge@foundries.io/
>>>
>>> Reported-by: Jorge Ramirez-Ortiz, Foundries <jorge@foundries.io>
>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge@foundries.io>
>>> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
>>> ---
>>>   drivers/i2c/stm32f7_i2c.c | 8 ++++----
>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
>>> index 0ec67b5c12..8803979d3e 100644
>>> --- a/drivers/i2c/stm32f7_i2c.c
>>> +++ b/drivers/i2c/stm32f7_i2c.c
>>> @@ -477,16 +477,16 @@ static int stm32_i2c_message_xfer(struct stm32_i2c_priv *i2c_priv,
>>>   			if (ret)
>>>   				break;
>>> +			/* End of transfer, send stop condition */
>>> +			mask = STM32_I2C_CR2_STOP;
>>> +			setbits_le32(&regs->cr2, mask);
>>> +
>>>   			if (!stop)
>>>   				/* Message sent, new message has to be sent */
>>>   				return 0;
>>>   		}
>>>   	}
>>> -	/* End of transfer, send stop condition */
>>> -	mask = STM32_I2C_CR2_STOP;
>>> -	setbits_le32(&regs->cr2, mask);
>>> -
>>>   	return stm32_i2c_check_end_of_message(i2c_priv);
>>>   }
>>
>>
>> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>>
>> Thanks
>> Patrick
>>

-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
