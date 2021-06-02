Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB413982CF
	for <lists+uboot-stm32@lfdr.de>; Wed,  2 Jun 2021 09:17:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16824C57B6F;
	Wed,  2 Jun 2021 07:17:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9076AC32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Jun 2021 07:16:59 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 152788NZ018941; Wed, 2 Jun 2021 09:16:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=xyTAalaP55leCsYr8AhZzvzStV7/AwNP/PNO/G7r/zo=;
 b=JJBkZl2wEjY5Kgx4stH6RiCK06jy29TaUP0aAme9yGmY8BUWycSkXwWeqK/K2Ewfo8yk
 OIcyV2r4wwbCR5cnn39JqcO8yTW+f+VnvEwvXtPoOo8nzuLQBKfPfTIaw5TxIroKP3K3
 7OtQrlDlgOWlNIN8s4xsduslWDBQkllczOvr/aFW6jxqsDRmRVu7G8rZwUDbe7rBlY3t
 G7MjE4Pt3M2aqzrLrj0TwX7Gf1LctT/yKAkyDhuQGfcS9PoSWszDNlC3f2S5RmXyvzbT
 9Fn/aY45Ze+zU//foKSvZK+DoblysppbBVrWpAak+w8Bf4ANTaTPMGEFuM2V2veEgfMk hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38x3gvhas6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Jun 2021 09:16:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DF7B31000A2;
 Wed,  2 Jun 2021 09:16:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D444C2128B6;
 Wed,  2 Jun 2021 09:16:52 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 2 Jun
 2021 09:16:52 +0200
To: <u-boot@lists.denx.de>, Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>
References: <cover.1622220270.git.gszymaszek@short.pl>
 <f36a3ba88b2f9b9f6ba2d09de1b0e99a7f1d23f8.1622220270.git.gszymaszek@short.pl>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <5cfe4920-1f2c-25c1-35c4-06a9675050b8@foss.st.com>
Date: Wed, 2 Jun 2021 09:16:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f36a3ba88b2f9b9f6ba2d09de1b0e99a7f1d23f8.1622220270.git.gszymaszek@short.pl>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-02_02:2021-06-01,
 2021-06-02 signatures=0
Subject: Re: [Uboot-stm32] [PATCH 2/5] arm: dts: stm32mp157c-odyssey-som:
 enable all SDMMC2 data lanes
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

SGkgR3J6ZWdvcnoKCk9uIDUvMjgvMjEgNjo1NCBQTSwgR3J6ZWdvcnogU3p5bWFzemVrIHdyb3Rl
Ogo+IEFkZCB0aGUg4oCcc2RtbWMyX2Q0N19waW5zX2TigJ0gcGlucyB0byB0aGUgU0RNTUMyIHBp
bmN0cmxzLiBJbmNyZWFzZSB0aGUKPiBidXMgd2lkdGggZnJvbSBmb3VyIHRvIGVpZ2h0Lgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEdyemVnb3J6IFN6eW1hc3playA8Z3N6eW1hc3pla0BzaG9ydC5wbD4K
PiBDYzogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4gQ2M6
IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gLS0tCj4g
IGFyY2gvYXJtL2R0cy9zdG0zMm1wMTU3Yy1vZHlzc2V5LXNvbS5kdHNpIHwgOCArKysrLS0tLQo+
ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9hcmNoL2FybS9kdHMvc3RtMzJtcDE1N2Mtb2R5c3NleS1zb20uZHRzaSBiL2Fy
Y2gvYXJtL2R0cy9zdG0zMm1wMTU3Yy1vZHlzc2V5LXNvbS5kdHNpCj4gaW5kZXggNWM3NThiMGY3
Mi4uNTgwMWI3YTk2OCAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9kdHMvc3RtMzJtcDE1N2Mtb2R5
c3NleS1zb20uZHRzaQo+ICsrKyBiL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTU3Yy1vZHlzc2V5LXNv
bS5kdHNpCj4gQEAgLTI2MCwxNCArMjYwLDE0IEBACj4gIAo+ICAmc2RtbWMyIHsKPiAgCXBpbmN0
cmwtbmFtZXMgPSAiZGVmYXVsdCIsICJvcGVuZHJhaW4iLCAic2xlZXAiOwo+IC0JcGluY3RybC0w
ID0gPCZzZG1tYzJfYjRfcGluc19hPjsKPiAtCXBpbmN0cmwtMSA9IDwmc2RtbWMyX2I0X29kX3Bp
bnNfYT47Cj4gLQlwaW5jdHJsLTIgPSA8JnNkbW1jMl9iNF9zbGVlcF9waW5zX2E+Owo+ICsJcGlu
Y3RybC0wID0gPCZzZG1tYzJfYjRfcGluc19hICZzZG1tYzJfZDQ3X3BpbnNfZD47Cj4gKwlwaW5j
dHJsLTEgPSA8JnNkbW1jMl9iNF9vZF9waW5zX2EgJnNkbW1jMl9kNDdfcGluc19kPjsKPiArCXBp
bmN0cmwtMiA9IDwmc2RtbWMyX2I0X3NsZWVwX3BpbnNfYSAmc2RtbWMyX2Q0N19zbGVlcF9waW5z
X2Q+Owo+ICAJbm9uLXJlbW92YWJsZTsKPiAgCW5vLXNkOwo+ICAJbm8tc2RpbzsKPiAgCXN0LG5l
Zy1lZGdlOwo+IC0JYnVzLXdpZHRoID0gPDQ+Owo+ICsJYnVzLXdpZHRoID0gPDg+Owo+ICAJdm1t
Yy1zdXBwbHkgPSA8JnYzdjM+Owo+ICAJc3RhdHVzID0gIm9rYXkiOwo+ICB9Owo+IAoKUmV2aWV3
ZWQtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgoKVGhh
bmtzClBhdHJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vdWJvb3Qtc3RtMzIK
