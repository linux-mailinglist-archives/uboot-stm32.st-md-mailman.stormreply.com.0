Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 061A53AC58E
	for <lists+uboot-stm32@lfdr.de>; Fri, 18 Jun 2021 09:59:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6F47C597AF;
	Fri, 18 Jun 2021 07:59:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B1D3C597AE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Jun 2021 07:59:31 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15I7uaS3028760; Fri, 18 Jun 2021 09:59:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=qrfV2ufsL1XUVj/G0tT+aZN6gfqfe57soQmQ9UOyFTE=;
 b=47vFpQqjb0EJBh1/PLUrmcXAWxbNXV2+qxoD9MqmqUAVs3kTn+r5yho4iwHm0MIzgdhZ
 p0CtQOvEvIW1v//X6r3IgJus1P/aqXUKUxYUB5d+Xx3DdntELyjOXGOeAmtc/wVM/EWU
 dXvMz+Psyi73X0mml4upm501YsavUnD8HR6l+GiYaXG/kenqXuXkNOvIjeCDGOKeCawC
 saUzl++Le5XDxDn7OUCnjtm4v2BTz7Iy3pss6P3EeHDKCOVusHtX6BcjLV/iRYvjHb80
 X++9rYGs2147f6ZxBDRNQwGuRTGJ0dSFFw5BbkEOVte++kcpSPaFjFk2nNxsMVA3Tkoj qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 398hn39sbq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 09:59:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ABBF510002A;
 Fri, 18 Jun 2021 09:59:29 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A1FF421A20A;
 Fri, 18 Jun 2021 09:59:29 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 18 Jun
 2021 09:59:29 +0200
To: <u-boot@lists.denx.de>, Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>
References: <cover.1622651232.git.gszymaszek@short.pl>
 <f69f91b059ce1d44de15994ac7a6fc25e4165448.1622651232.git.gszymaszek@short.pl>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <71debaee-766c-1daa-69e5-d50c75724076@foss.st.com>
Date: Fri, 18 Jun 2021 09:59:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <f69f91b059ce1d44de15994ac7a6fc25e4165448.1622651232.git.gszymaszek@short.pl>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_17:2021-06-15,
 2021-06-17 signatures=0
Subject: Re: [Uboot-stm32] [PATCH v2 1/5] arm: dts: stm32mp157c-odyssey-som:
 fix the basic SDMMC2 properties
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

CgpPbiA2LzIvMjEgNzowOCBQTSwgR3J6ZWdvcnogU3p5bWFzemVrIHdyb3RlOgo+IFRoZSBTRE1N
QzIgaW50ZXJmYWNlIGhvc3RzIGFuIGVNTUMuIFJlcGxhY2UgdGhlIGludGVyZmFjZSBwcm9wZXJ0
aWVzCj4gdGhhdCB3b3VsZCBvbmx5IGFwcGx5IHRvIFNEIGNhcmRz4oCU4oCcYnJva2VuLWNk4oCd
IGFuZCDigJxkaXNhYmxlLXdw4oCd4oCUd2l0aAo+IHJlbGV2YW50IG9uZXM6IOKAnG5vbi1yZW1v
dmFibGXigJ0sIOKAnG5vLXNk4oCdIGFuZCDigJxuby1zZGlv4oCdLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEdyemVnb3J6IFN6eW1hc3playA8Z3N6eW1hc3pla0BzaG9ydC5wbD4KPiBDYzogUGF0cmlj
ZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4gQ2M6IFBhdHJpY2sgRGVs
YXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFBhdHJp
Y2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+IC0tLQo+IENoYW5nZXMg
Zm9yIHYyOgo+ICAgIC0gcmViYXNlZCBvbiBjdXJyZW50IG1hc3RlciAocGF0Y2ggbm90IGNoYW5n
ZWQpCj4gICAgLSBhZGRlZCBQYXRyaWNlIENob3RhcmTigJlzIFJldmlld2VkLWJ5Cj4gCj4gIGFy
Y2gvYXJtL2R0cy9zdG0zMm1wMTU3Yy1vZHlzc2V5LXNvbS5kdHNpIHwgNSArKystLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9hcmNoL2FybS9kdHMvc3RtMzJtcDE1N2Mtb2R5c3NleS1zb20uZHRzaSBiL2FyY2gvYXJt
L2R0cy9zdG0zMm1wMTU3Yy1vZHlzc2V5LXNvbS5kdHNpCj4gaW5kZXggZTM2N2EzMTFjNC4uZWQz
OTljMDBkMSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9kdHMvc3RtMzJtcDE1N2Mtb2R5c3NleS1z
b20uZHRzaQo+ICsrKyBiL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTU3Yy1vZHlzc2V5LXNvbS5kdHNp
Cj4gQEAgLTI2Nyw4ICsyNjcsOSBAQAo+ICAJcGluY3RybC0wID0gPCZzZG1tYzJfYjRfcGluc19h
PjsKPiAgCXBpbmN0cmwtMSA9IDwmc2RtbWMyX2I0X29kX3BpbnNfYT47Cj4gIAlwaW5jdHJsLTIg
PSA8JnNkbW1jMl9iNF9zbGVlcF9waW5zX2E+Owo+IC0JYnJva2VuLWNkOwo+IC0JZGlzYWJsZS13
cDsKPiArCW5vbi1yZW1vdmFibGU7Cj4gKwluby1zZDsKPiArCW5vLXNkaW87Cj4gIAlzdCxuZWct
ZWRnZTsKPiAgCWJ1cy13aWR0aCA9IDw0PjsKPiAgCXZtbWMtc3VwcGx5ID0gPCZ2M3YzPjsKPiAK
QXBwbGllZCBvbiB1LWJvb3Qtc3RtMzIvbmV4dAoKVGhhbmtzCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9v
dC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
