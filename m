Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57163A59737
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Mar 2025 15:13:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BF8DC78F97;
	Mon, 10 Mar 2025 14:13:42 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54E5FC7802E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Mar 2025 14:13:41 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52ACE0is006880;
 Mon, 10 Mar 2025 15:13:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=selector1; bh=wiEjIi794h4Bk8c/CoGfT31w
 8hNJLv6TvQkyMm3z4UQ=; b=QrCqHvSi9R6Nbgaq75jKdWADatSHoe+D1MHchCci
 4065AXKzpeJiMMTJkKGLhTP40LGRhIaLXajI6igAiJd0beLcrwah81Kv64BeYe7s
 OBY7gSAJnFTZasQeUcISOSsqn/Ry3MVQKXQIiFBqRmEsYR73t7Gth68Nh82e6lht
 cDLzapwkXClibJXeQTipWrJoJddxLLtf+ZaU47bjWCCrd3kq9YUZLFI9nLYJTlJo
 5gsSK7yZhDO3h7xKIV4FzZOvgc1i5qcPmiCuRbgkcOzgtsjemK/xAigGp4zkU964
 v7GUq4kqZ4k1M1W6b7dy6MdWucmq6VrdVAxKXAsOtGtKMw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4591qrw6e7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Mar 2025 15:13:37 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3E47B40055;
 Mon, 10 Mar 2025 15:12:48 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6598C4FAACE;
 Mon, 10 Mar 2025 15:12:30 +0100 (CET)
Received: from [10.48.86.119] (10.48.86.119) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 15:12:29 +0100
Message-ID: <a168bd2a-6d44-4b36-98fe-3ceb31810edf@foss.st.com>
Date: Mon, 10 Mar 2025 15:12:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20250306105620.624760-1-cheick.traore@foss.st.com>
 <20250306115558.1.I060a56226e03cddfd4a6d6b98bc86c91435710cc@changeid>
 <6ef98461-7ffb-4257-bc5f-bc0c543a773c@foss.st.com>
 <2ad51ae3-53d7-42f6-bb3a-800ba6c6b672@foss.st.com>
 <329df3e4-1493-4966-a7e2-ebd628503e8c@foss.st.com>
Content-Language: en-US
From: Cheick TRAORE <cheick.traore@foss.st.com>
In-Reply-To: <329df3e4-1493-4966-a7e2-ebd628503e8c@foss.st.com>
X-Originating-IP: [10.48.86.119]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_05,2025-03-07_03,2024-11-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 1/5] dm: pwm: Check if duty_ns is lower
 than period_ns
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
Content-Type: multipart/mixed; boundary="===============0255737733485649600=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============0255737733485649600==
Content-Type: multipart/alternative;
	boundary="------------0li6S5we4KzPyFx2JusERxmf"
Content-Language: en-US

--------------0li6S5we4KzPyFx2JusERxmf
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 3/10/25 13:35, Patrice CHOTARD wrote:
>
> On 3/10/25 11:00, Patrice CHOTARD wrote:
>>
>> On 3/6/25 15:13, Patrice CHOTARD wrote:
>>>
>>> On 3/6/25 11:56, Cheick Traore wrote:
>>>> It was possible to provide a duty_ns greater than period_ns to
>>>> "pwm config" command. The framework must check the values before
>>>> providing them to drivers.
>>>>
>>>> Signed-off-by: Cheick Traore<cheick.traore@foss.st.com>
>>>> ---
>>>>
>>>>   drivers/pwm/pwm-uclass.c | 3 +++
>>>>   1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/drivers/pwm/pwm-uclass.c b/drivers/pwm/pwm-uclass.c
>>>> index 6543db1d623..b4491f7dcd4 100644
>>>> --- a/drivers/pwm/pwm-uclass.c
>>>> +++ b/drivers/pwm/pwm-uclass.c
>>>> @@ -27,6 +27,9 @@ int pwm_set_config(struct udevice *dev, uint channel, uint period_ns,
>>>>   	if (!ops->set_config)
>>>>   		return -ENOSYS;
>>>>   
>>>> +	if (duty_ns > period_ns)
>>>> +		return -EINVAL;
>>>> +
>>>>   	return ops->set_config(dev, channel, period_ns, duty_ns);
>>>>   }
>>>>   
>>> Reviewed-by: Patrice Chotard<patrice.chotard@foss.st.com>
>>>
>>> Thanks
>>> Patrice
>> Applied to u-boot-stm32/next
>>
>> Thanks
>> Patrice
>
> Hi Cheick
>
> Unfortunately, this patch is causing U-Boot CI test failed:
> seehttps://source.denx.de/u-boot/custodians/u-boot-stm/-/jobs/1054426
>
> More precisely ut_dm_dm_test_cros_ec_pwm, see test/dm/cros_ec_pwm.c
>
> Either update test/dm/cros_ec_pwm.c or another solution is simply to
> clamp duty_ns to period_ns as following ?
>
>   +	if (duty_ns > period_ns)
>   +		duty_ns = period_ns;
>   +
>
> Patrice
>
>
>> _______________________________________________
>> Uboot-stm32 mailing list
>> Uboot-stm32@st-md-mailman.stormreply.com
>> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Hi Patrice,

It seems like this patch should finally be reverted.

When the duty cycle exceeds the period, some drivers already clamp the 
value of the duty cycle to the maximum value or do not apply the duty cycle.

So, I will check the duty cycle in|drivers/pwm/pwm-stm32.c|and 
return|-EINVAL|when it exceeds the period.

Thanks,

Cheick

--------------0li6S5we4KzPyFx2JusERxmf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/10/25 13:35, Patrice CHOTARD
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:329df3e4-1493-4966-a7e2-ebd628503e8c@foss.st.com">
      <pre class="moz-quote-pre" wrap="">

On 3/10/25 11:00, Patrice CHOTARD wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

On 3/6/25 15:13, Patrice CHOTARD wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">

On 3/6/25 11:56, Cheick Traore wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">It was possible to provide a duty_ns greater than period_ns to
"pwm config" command. The framework must check the values before
providing them to drivers.

Signed-off-by: Cheick Traore <a class="moz-txt-link-rfc2396E" href="mailto:cheick.traore@foss.st.com">&lt;cheick.traore@foss.st.com&gt;</a>
---

 drivers/pwm/pwm-uclass.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pwm/pwm-uclass.c b/drivers/pwm/pwm-uclass.c
index 6543db1d623..b4491f7dcd4 100644
--- a/drivers/pwm/pwm-uclass.c
+++ b/drivers/pwm/pwm-uclass.c
@@ -27,6 +27,9 @@ int pwm_set_config(struct udevice *dev, uint channel, uint period_ns,
 	if (!ops-&gt;set_config)
 		return -ENOSYS;
 
+	if (duty_ns &gt; period_ns)
+		return -EINVAL;
+
 	return ops-&gt;set_config(dev, channel, period_ns, duty_ns);
 }
 
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Reviewed-by: Patrice Chotard <a class="moz-txt-link-rfc2396E" href="mailto:patrice.chotard@foss.st.com">&lt;patrice.chotard@foss.st.com&gt;</a>

Thanks
Patrice
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Applied to u-boot-stm32/next

Thanks
Patrice
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

Hi Cheick

Unfortunately, this patch is causing U-Boot CI test failed:
see <a class="moz-txt-link-freetext" href="https://source.denx.de/u-boot/custodians/u-boot-stm/-/jobs/1054426">https://source.denx.de/u-boot/custodians/u-boot-stm/-/jobs/1054426</a>

More precisely ut_dm_dm_test_cros_ec_pwm, see test/dm/cros_ec_pwm.c

Either update test/dm/cros_ec_pwm.c or another solution is simply to 
clamp duty_ns to period_ns as following ?

 +	if (duty_ns &gt; period_ns)
 +		duty_ns = period_ns;
 +

Patrice


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">_______________________________________________
Uboot-stm32 mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Uboot-stm32@st-md-mailman.stormreply.com">Uboot-stm32@st-md-mailman.stormreply.com</a>
<a class="moz-txt-link-freetext" href="https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32">https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32</a>
</pre>
      </blockquote>
    </blockquote>
    <p
style="box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px 0px 16px; color: rgb(0, 0, 0); font-family: Open_Sans, system-ui, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgba(255, 255, 255, 0.9); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Hi
      Patrice,</p>
    <p
style="box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px 0px 16px; color: rgb(0, 0, 0); font-family: Open_Sans, system-ui, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgba(255, 255, 255, 0.9); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">It
      seems like this patch should finally be reverted.</p>
    <p
style="box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px 0px 16px; color: rgb(0, 0, 0); font-family: Open_Sans, system-ui, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgba(255, 255, 255, 0.9); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">When
      the duty cycle exceeds the period, some drivers already clamp the
      value of the duty cycle to the maximum value or do not apply the
      duty cycle.</p>
    <p
style="box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px 0px 16px; color: rgb(0, 0, 0); font-family: Open_Sans, system-ui, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgba(255, 255, 255, 0.9); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">So,
      I will check the duty cycle in<span> </span><code
style="box-sizing: inherit; -webkit-tap-highlight-color: transparent; font-family: monospace, monospace; font-size: 1em;">drivers/pwm/pwm-stm32.c</code><span> </span>and
      return<span> </span><code
style="box-sizing: inherit; -webkit-tap-highlight-color: transparent; font-family: monospace, monospace; font-size: 1em;">-EINVAL</code><span> </span>when
      it exceeds the period.</p>
    <p
style="box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px 0px 16px; color: rgb(0, 0, 0); font-family: Open_Sans, system-ui, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgba(255, 255, 255, 0.9); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Thanks,</p>
    <p
style="box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px 0px 16px; color: rgb(0, 0, 0); font-family: Open_Sans, system-ui, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgba(255, 255, 255, 0.9); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Cheick<br>
    </p>
    <p></p>
  </body>
</html>

--------------0li6S5we4KzPyFx2JusERxmf--

--===============0255737733485649600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0255737733485649600==--
