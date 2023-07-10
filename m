Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7AE74D4A6
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Jul 2023 13:35:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67ED1C6B44C;
	Mon, 10 Jul 2023 11:35:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B52FEC6A61D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 11:35:19 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36AAoBUQ019506; Mon, 10 Jul 2023 13:35:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=1RsgNb9xPtoHfFpcm8vvWf3oC5sCO4mK6Z7cOaOwb64=;
 b=CvejU60iM8WX5RqAogmJYzURt5usX+heMFsssDaxOUEG/6q7PO2t7uoo00vaqvNbsifP
 7GGPeRJTGn/Xxx9skwQlYO9QAJv1GHBJ3cFaKEZF5v6IGmyrtacP1dr2bkmAByYmoPYy
 Kb1gCtQpqOydxf46QUB++lcaPKi7oIES2KdWYg7WCW58HsyJHNhVJjhVRtbvDCXz1cxA
 DRWjYx4JX8CywmJD6RvRtj8Ybt1z6GlNjn7u3EeHsmsDLqkTvF2lOztX9Jmo8UoZiesX
 GKBf3rpa4hlToz5hPOip9RMymuhQZMPOd8rc8FiH7KobwXUdGVbH5IWbEu3iaUSIBFdr Ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rrgk789pc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jul 2023 13:35:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2639710005A;
 Mon, 10 Jul 2023 13:35:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1EA18232FF6;
 Mon, 10 Jul 2023 13:35:11 +0200 (CEST)
Received: from [10.48.1.0] (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 10 Jul
 2023 13:35:10 +0200
Message-ID: <5bfeb857-1546-3a66-7221-3e5ac1d3a1f9@foss.st.com>
Date: Mon, 10 Jul 2023 13:35:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20230704173121.589620-1-dario.binacchi@amarulasolutions.com>
 <6798832b-2e55-2d40-e017-bb7c308aaf9f@foss.st.com>
 <CABGWkvruFoNNU+tHg7tKpLCdRxSPcpOmei3Kp8ooteUUVixhSA@mail.gmail.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <CABGWkvruFoNNU+tHg7tKpLCdRxSPcpOmei3Kp8ooteUUVixhSA@mail.gmail.com>
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-10_08,2023-07-06_02,2023-05-22_02
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v2] board: stm32mp1: add splash screen on
	dk2
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

SGksCgpPbiA3LzgvMjMgMTk6MTksIERhcmlvIEJpbmFjY2hpIHdyb3RlOgo+IEhpIFBhdHJpY2ss
Cj4KPiBPbiBXZWQsIEp1bCA1LCAyMDIzIGF0IDI6MDnigK9QTSBQYXRyaWNrIERFTEFVTkFZCj4g
PHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+IHdyb3RlOgo+PiBIaSBEYXJpbywKPj4KPj4g
T24gNy80LzIzIDE5OjMxLCBEYXJpbyBCaW5hY2NoaSB3cm90ZToKPj4+IERpc3BsYXkgdGhlIFNU
TWljcm9lbGVjdHJvbmljcyBsb2dvLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFj
Y2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KPj4+Cj4+Pgo+Pj4gLS0t
Cj4+Pgo+Pj4gQ2hhbmdlcyBpbiB2MjoKPj4+IC0gbW92ZSAic3BsYXNoLmgiIGFuZCAic3RfbG9n
b19kYXRhLmgiIGhlYWRlcnMgYmVmb3JlICJzeXNjb24uaCIgaW4gb3JkZXIKPj4+ICAgICB0byBr
ZWVwIGluY2x1ZGVzIHNvcnRlZCBhbHBoYWJldGljYWxseS4KPj4+IC0gcmVtb3ZlICJsb2dvIiB2
YXJpYWJsZSBhbmQgcGFzcyAiKHVsb25nKXN0bWljcm9lbGVjdHJvbmljc191Ym9vdF9sb2dvXzhi
aXRfcmxlIgo+Pj4gICAgIGRpcmVjdGx5IHRvIHRoZSBibXBfZGlzcGxheSgpIGZ1bmN0aW9uLgo+
Pj4KPj4+ICAgIGJvYXJkL3N0L3N0bTMybXAxL3N0bTMybXAxLmMgfCAxMSArKysrKysrKysrKwo+
Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0
IGEvYm9hcmQvc3Qvc3RtMzJtcDEvc3RtMzJtcDEuYyBiL2JvYXJkL3N0L3N0bTMybXAxL3N0bTMy
bXAxLmMKPj4+IGluZGV4IDFhMWIxODQ0YzhjMC4uZWJkMzk0OGQ1MTljIDEwMDY0NAo+Pj4gLS0t
IGEvYm9hcmQvc3Qvc3RtMzJtcDEvc3RtMzJtcDEuYwo+Pj4gKysrIGIvYm9hcmQvc3Qvc3RtMzJt
cDEvc3RtMzJtcDEuYwo+Pj4gQEAgLTMxLDggKzMxLDExIEBACj4+PiAgICAjaW5jbHVkZSA8cGh5
Lmg+Cj4+PiAgICAjaW5jbHVkZSA8cmVtb3RlcHJvYy5oPgo+Pj4gICAgI2luY2x1ZGUgPHJlc2V0
Lmg+Cj4+PiArI2luY2x1ZGUgPHNwbGFzaC5oPgo+Pj4gKyNpbmNsdWRlIDxzdF9sb2dvX2RhdGEu
aD4KPj4+ICAgICNpbmNsdWRlIDxzeXNjb24uaD4KPj4+ICAgICNpbmNsdWRlIDx1c2IuaD4KPj4+
ICsjaW5jbHVkZSA8dmlkZW8uaD4KPj4+ICAgICNpbmNsdWRlIDx3YXRjaGRvZy5oPgo+Pj4gICAg
I2luY2x1ZGUgPGFzbS9nbG9iYWxfZGF0YS5oPgo+Pj4gICAgI2luY2x1ZGUgPGFzbS9pby5oPgo+
Pj4gQEAgLTY4NCw2ICs2ODcsMTQgQEAgaW50IGJvYXJkX2luaXQodm9pZCkKPj4+ICAgICAgICBm
d19pbWFnZXNbMF0uZndfbmFtZSA9IHUiU1RNMzJNUC1GSVAiOwo+Pj4gICAgICAgIGZ3X2ltYWdl
c1swXS5pbWFnZV9pbmRleCA9IDE7Cj4+PiAgICAjZW5kaWYKPj4+ICsKPj4+ICsgICAgIGlmIChJ
U19FTkFCTEVEKENPTkZJR19DTURfQk1QKSkgewo+Pj4gKyAgICAgICAgICAgICBpZiAoYm9hcmRf
aXNfc3RtMzJtcDE1eF9kazIoKSkgewo+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGJtcF9kaXNw
bGF5KCh1bG9uZylzdG1pY3JvZWxlY3Ryb25pY3NfdWJvb3RfbG9nb184Yml0X3JsZSwKPj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCTVBfQUxJR05fQ0VOVEVSLCBCTVBfQUxJ
R05fQ0VOVEVSKTsKPj4+ICsgICAgICAgICAgICAgfQo+Pj4gKyAgICAgfQo+Pj4gKwo+Pj4gICAg
ICAgIHJldHVybiAwOwo+Pj4gICAgfQo+Pj4KPj4KPj4gSSB0aGluayAiaW5jbHVkZS9zdF9sb2dv
X2RhdGEuaCIgc2hvdWxkIGJlIG5vdCBkaXJlY3RseSB1c2VkIGZvciBTVE0zMiBNUFUKPj4KPj4g
aXQgaXMgYSBvYnNvbGV0ZSB3YXkgdG8gaGF2ZSBzcGxhc2ggc2NyZWVuLCB1c2VkIGJ5IFNUTTMy
IE1DVSBhcyBTVE0zMkY3Lgo+Pgo+Pgo+PiBBbmQgZGlyZWN0IG1hbmFnZW1lbnQgZm9yIHNwbGFz
aCBpdCBpcyBub3QgcmVhbGx5IG5lZWRlZCBpbiBib2FyZCBjb2RlLAo+Pgo+PiBhcyBpdCBpcyBh
bHJlYWR5IG1hbmFnZWQgaW4gVklERU8gZnJhbWV3b3JrIHdpdGggQ09ORklHX1ZJREVPX0xPR08K
Pj4KPj4gZW5hYmxlZCBieSBkZWZhdWx0IHNpbmNlIGNvbW1pdCA4NDVkNzFjZTk5OTkzNmFiNWFl
MmNlZjQ1NDJiMjIxODUxY2RlMTk5Cj4+ICgidmlkZW86IFNob3cgdGhlIFUtQm9vdCBsb2dvIGJ5
IGRlZmF1bHQiKQo+Pgo+PiBhbmQgd2l0aCBDT05GSUdfU1BMQVNIX1NDUkVFTgo+Pgo+Pgo+PiBz
ZWUgc3RkaW9faW5pdF90YWJsZXMoKQo+Pgo+PiAgICAgPT4gc3BsYXNoX2Rpc3BsYXkoKTsKPj4K
Pj4KPj4gcG9zaXRpb24gaXMgbWFuYWdlZCB3aXRoOgo+Pgo+PiAtIENPTkZJR19TUExBU0hfU0NS
RUVOX0FMSUdOCj4+Cj4+IC0gdmFyaWFibGU6ICJzcGxhc2hwb3M9bSxtIgo+Pgo+Pgo+PiBCdXQg
YnkgZGVmYXVsdCB0aGUgVS1Cb290IGxvZ28gKHllbGxvdyBzdWJtYXJpbmUpIGlzIHVzZWQgZm9y
IFZJREVPIExPR08KPj4gKFNQTEFTSF9ERUNMKHVfYm9vdF9sb2dvKSBpbiB2aWRlbyB1Y2xhc3MK
Pj4KPj4gb3IgZGVueCBmb3IgU1BMQVNIIGlzIHVzZWQgaW4gdG9vbHMvTWFrZWZpbGUKPj4KPj4K
Pj4gIyBHZW5lcmljIGxvZ28KPj4gaWZlcSAoJChMT0dPX0JNUCksKQo+PiBMT0dPX0JNUD0gJChz
cmN0cmVlKS8kKHNyYykvbG9nb3MvZGVueC5ibXAKPj4KPj4gIyBVc2UgYm9hcmQgbG9nbyBhbmQg
ZmFsbGJhY2sgdG8gdmVuZG9yCj4+IGlmbmVxICgkKHdpbGRjYXJkICQoc3JjdHJlZSkvJChzcmMp
L2xvZ29zLyQoQk9BUkQpLmJtcCksKQo+PiBMT0dPX0JNUD0gJChzcmN0cmVlKS8kKHNyYykvbG9n
b3MvJChCT0FSRCkuYm1wCj4+IGVsc2UKPj4gaWZuZXEgKCQod2lsZGNhcmQgJChzcmN0cmVlKS8k
KHNyYykvbG9nb3MvJChWRU5ET1IpLmJtcCksKQo+PiBMT0dPX0JNUD0gJChzcmN0cmVlKS8kKHNy
YykvbG9nb3MvJChWRU5ET1IpLmJtcAo+PiBlbmRpZgo+PiBlbmRpZgo+Pgo+Pgo+PiBUaGUgU1RN
aWNyb2VsZWN0cm9uaWNzIGxvZ28gaW1hZ2UgY2FuIGJlIGludGVncmF0ZWQgaW4gdGhpcyBkaXJl
Y3Rvcnkgd2l0aAo+Pgo+PiAgICAgICAgICAgIFZFTkRPUj0ic3QiCj4+Cj4+ICAgICAgICAgICAg
Qk9BUkQ9InN0bTMybXAxIgo+Pgo+Pgo+PiBXZSBuZWVkIHRvIGFkZCBpdCAuL3Rvb2xzL2xvZ29z
L3N0LmJtcAo+Pgo+Pgo+PiBJIGNhbiBwcm9wb3NlIHNvbWV0aGluZywgZm9yIGFsbCBTVCBib2Fy
ZCBTVE0zMk1QMXgsIG5vdCBvbmx5IERLMgo+Pgo+Pgo+IFRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0
aW9ucy4KCgpZb3UgYXJlIHdlbGNvbWUuCgoKSSBwcm9wb3NlIHRvIHJlcGxhY2UgeW91IHByb3Bz
YWwgYnkgdGhlIHBhdGNoIEkganVzdCBzZW50IHRvZGF5OgoKCmh0dHA6Ly9wYXRjaHdvcmsub3ps
YWJzLm9yZy9wcm9qZWN0L3Vib290L2xpc3QvP3Nlcmllcz0zNjMxNDMmc3RhdGU9KgoKW1BBVENI
XSBib2FyZDogc3RtMzJtcDE6IGFkZCBzcGxhc2ggc2NyZWVuIHdpdGggc3RtaWNyb2VsZWN0cm9u
aWNzIGxvZ28KCgpJIHRlc3QgaXIgb24gU1RNMzJNUDE1N0MtREsyCgoKVGVsbCBtZSBpZiBpdCBp
cyBPSyBvbiB5b3VyIHNpZGUuCgoKUGF0cmljawoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
